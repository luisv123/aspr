from flask import Flask, render_template, url_for, request, redirect, flash, session, send_file
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
import static

app = Flask(__name__)
app.secret_key = '88653085b29d21c81db94ea79056d11668522a07082844f400842cb5956ab3fc'

testPassword = "pbkdf2:sha256:600000$dtmJGGErcxj9VA4H$b34087f7e762ccc738f82546e6c2959d0ca7b6e4d27ee97d0f2c39e439ddc01c"

def insertInto(cursor, table, values):
    listFields = ""
    listValues = ""
    for value in values:
        listFields += value + ''
        listValues += "'" + values[value] + "'"

        if list(values).index(value) != len(values) - 1:
            listFields += ','
            listValues += ','

    cursor.execute("INSERT INTO "+table+"("+listFields+") VALUES("+listValues+")")

def stringFixer(string):
    finale = ''
    split = string.strip().split(' ')
    for word in split:
        if len(word) >= 1:
            finale += word[0].upper() + word[1:].lower() + ' '


    return finale[:len(finale)-1] # deleting the last 'space'

def gapBetweenTimes(time1, time2):
    gap = time2 - time1

    if gap.total_seconds() < 60:
        return f"{int(gap.total_seconds())} segundos"
    elif gap.total_seconds() < 3600:
        return f"{int(gap.total_seconds() // 60)} minutos"
    elif gap.total_seconds() < 86400:
        return f"{int(gap.total_seconds() // 3600)} horas"
    else:
        return f"{int(gap.total_seconds() // 86400)} días"




listDirections = {
        'test': '/test/<password>/',
        'index': '/',
        'login': '/sesion/iniciar/',
        'logout': '/sesion/cerrar/',
        'eventForm': '/evento/<eventTag>/',
        'eventRegister': '/reservar/<eventTag>/',
        'eventConfirmed': '/reservar/<eventTag>/confirmacion/',
        'newsletterRegister': '/boletin/',
        'eventList': '/eventos/',
        'getCertificate': '/cursos/<eventTag>/certificado/',
        'printXlsx': '/reports'
    }

   ##################################################################
    #   GET CERTIFICATION
    #   https://aspr.pythonanywhere.com/cursos/IHB5M/certificado/
   ##################################################################

   ##################################################################
    #   STATISTIC PAGE
    #   https://aspr.pythonanywhere.com/test/statistics/
   ##################################################################

@app.route(listDirections['test'], methods=['GET','POST'])
def test(password=""):
    if check_password_hash(testPassword, password):
        return 'ok'

    elif password == 'statistics':
        db = static.getDbConnection()
        cursor = db.cursor(dictionary=True)

        cursor.execute("SELECT * FROM events WHERE (active = 1 OR active = 2) ORDER BY limit_date DESC")
        listEvents = cursor.fetchall()

        cursor.execute("SELECT * FROM events_register")
        listRegisters = cursor.fetchall()

        cantRegisters = {}
        for event in listEvents:
            cursor.execute("SELECT * FROM events_register WHERE event_id = '"+event['event_id']+"'")
            cantRegisters[event['event_id']] = len(cursor.fetchall())

        fieldsShow = {'firstname': 'Nombre',
                      'lastname': 'Apellido',
                      'email': 'E-mail',
                      'title': 'Título',
                      'profession': 'Profesión',
                      'tlf': 'Nro. de Teléfono',
                      'country': 'País'}

        return render_template('statistics.html', listEvents=listEvents, listRegisters=listRegisters, fieldsShow=fieldsShow, cantRegisters=cantRegisters)

    else:
        return render_template('events/5julio.html')


   ##################################################################
    #   MAIN PAGE                                                  #
   ##################################################################



@app.route(listDirections['index'], methods=['GET','POST'])
def index():
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    if 'session_rank' in session:
        return render_template('dashboard.html',
                                timeSession=gapBetweenTimes(datetime.strptime(session['session_datetime_init'], "%Y-%m-%d %H:%M:%S"), datetime.now()))

    else:

        cursor.execute("SELECT * FROM events WHERE (active = 1 OR active = 2) ORDER BY limit_date DESC LIMIT 7")
        eventsCarousel = cursor.fetchall()

        return render_template('index.html', eventsCarousel=eventsCarousel, nowDate=datetime.now().date())



   ##################################################################
    #   LOGIN PAGE                                                 #
   ##################################################################



@app.route(listDirections['login'], methods=['GET','POST'])
def login():
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)
    if request.method == 'POST':
        if 'email' in request.form and 'password' in request.form:

            if request.form['email'].strip() != '' and request.form['password'] != '':

                cursor.execute("SELECT * FROM users where email = '"+ request.form['email'].strip() +"' and active = 1")
                results = cursor.fetchall()

                if len(results) > 0:

                    if check_password_hash(results[0]['password'], request.form['password']):
                        session['session_user_id'] = results[0]['user_id']
                        session['session_firstname'] = results[0]['firstname']
                        session['session_lastname'] = results[0]['lastname']
                        session['session_email'] = results[0]['email']
                        session['session_gender'] = results[0]['gender']
                        session['session_rank'] = results[0]['user_rank']
                        session['session_datetime_init'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

                        return redirect(url_for('index'))

                    else:
                        flash('E-mail o Contraseña inválidos', 'error')
                else:
                    flash('E-mail o Contraseña inválidos', 'error')
            else:
                flash('Hay Campos Vacíos', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')

    return render_template('login.html')



@app.route(listDirections['logout'], methods=['GET','POST'])
def logout():
    session.clear()
    return redirect(url_for('index'))



   ##################################################################
    #   FORMULARIO PARA EL EVENTO                                  #
   ##################################################################

@app.route(listDirections['eventForm'], methods=['GET','POST'])
def eventForm(eventTag=""):

    if eventTag == "10_MAYO":
        return redirect(url_for('eventForm', eventTag='10MAYO'))

    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM events WHERE event_id = '"+eventTag+"' AND (active = 1 OR active = 2)")
    results = cursor.fetchall()

    if len(results) > 0:
        return render_template('events/' + eventTag.lower() + '.html', results=results[0])

    else:
        return render_template('error.html')

   ##################################################################
    #   FORMULARIO PARA EL EVENTO - BACKEND                        #
   ##################################################################

@app.route(listDirections['eventRegister'], methods=['GET','POST'])
def eventRegister(eventTag=""):
    db = static.getDbConnection()
    cursor = db.cursor()

    if 'firstname' in request.form and 'lastname' in request.form and 'email' in request.form:

        if request.form['firstname'].strip() != '' and request.form['lastname'].strip() != '' and request.form['email'].strip() != '':

            cursor.execute("SELECT count(*) FROM events WHERE event_id = '"+eventTag+"' AND limit_date >= '"+datetime.now().strftime("%Y-%m-%d")+"' AND active = 1")
            results = cursor.fetchall()

            if results[0][0] > 0: # Check the event exists

                cursor.execute("SELECT count(*) FROM events_register WHERE email = '"+request.form['email'].strip()+"' AND event_id = '"+eventTag+"'")
                results = cursor.fetchall()

                if results[0][0] == 0: # Check if the email is unique for the event

                    # Verification ended

                    firstname = stringFixer(request.form['firstname'])
                    lastname = stringFixer(request.form['lastname'])

                    registerValues = {
                            'firstname': firstname,
                            'lastname': lastname,
                            'email': request.form['email'].strip(),
                            'event_id': eventTag
                        }

                    listExtraFields = ['title','profession','org','country','tlf','id','motives']

                    for field in listExtraFields:
                        if field in request.form:
                            registerValues[field] = request.form[field].strip()


                    insertInto(cursor, 'events_register', registerValues)

                    if 'newsletter_confirm' in request.form: # Registing in the newsletter list

                        cursor.execute("SELECT count(*) FROM newsletter_register WHERE email = '"+request.form['email'].strip()+"'")
                        results = cursor.fetchall()
                        if results[0][0] == 0:
                            insertInto(cursor, 'newsletter_register', {
                                    'firstname': firstname,
                                    'lastname': lastname,
                                    'email': request.form['email'].strip()
                                })

                        flash('True', 'newsletterRegister')

                    db.commit()

                    session['eventRegistered'] = eventTag
                    session['eventRegisteredName'] = firstname + ' ' + lastname

                    return redirect(url_for('eventConfirmed', eventTag=eventTag))


                else:
                    flash('E-mail ya registrado para este Evento', 'error')
            else:
                flash('Error al cargar el Evento', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')
    else:
        flash('Hay Campos Vacíos', 'error')


    return redirect(url_for('eventForm', eventTag=eventTag))



   ##################################################################
    #   MENSAJE DE CONFIRMACION PARA EL EVENTO                     #
   ##################################################################

@app.route(listDirections['eventConfirmed'], methods=['GET','POST'])
def eventConfirmed(eventTag=""):
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM events WHERE event_id = '"+eventTag+"' AND limit_date >= '"+datetime.now().strftime("%Y-%m-%d")+"' AND active = 1")
    results = cursor.fetchall()

    if len(results) > 0:
        if 'eventRegistered' in session and 'eventRegisteredName' in session:
            if session['eventRegistered'] == eventTag:
                name = session['eventRegisteredName']
                session.pop('eventRegistered')
                session.pop('eventRegisteredName')
                return render_template('eventConfirmed.html', title=results[0]['title'], name=name)

    return render_template('error.html')



   ##################################################################
    #   LISTA DE EVENTOS                                           #
   ##################################################################

@app.route(listDirections['eventList'], methods=['GET','POST'])
def eventList():
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM events WHERE (active = 1 OR active = 2) ORDER BY limit_date DESC")
    results = cursor.fetchall()

    return render_template('eventList.html', listEvents=results, nowDate=datetime.now().date())



   ##################################################################
    #   REGISTRO A LA NEWSLETTER                                   #
   ##################################################################

@app.route(listDirections['newsletterRegister'], methods=['GET','POST'])
def newsletterRegister():
    db = static.getDbConnection()
    cursor = db.cursor()
    if request.method == 'POST':

        if 'firstname' in request.form and 'lastname' in request.form and 'email' in request.form:

            if request.form['firstname'].strip() != '' and request.form['lastname'].strip() != '' and request.form['email'].strip() != '':

                cursor.execute("SELECT count(*) FROM newsletter_register WHERE email = '"+request.form['email'].strip()+"'")
                results = cursor.fetchall()

                if results[0][0] == 0: # Checks if the email is not registered
                    insertInto(cursor, 'newsletter_register', {
                            'firstname': request.form['firstname'].strip(),
                            'lastname': request.form['lastname'].strip(),
                            'email': request.form['email'].strip()
                        })

                    db.commit()

                    flash('E-mail Registrado','success')

                else:
                    flash('E-mail ya Registrado', 'error')

            else:
                flash('Hay Campos Vacíos', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')

    return render_template('newsletterRegister.html')


   ##################################################################
    #   CERTIFICADOS DE CURSOS                                     #
   ##################################################################

@app.route(listDirections['getCertificate'] + '<int:idCertificate>/', methods=['GET','POST'])
def showtCertificate(eventTag="", idCertificate=0):
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute(f"SELECT * FROM events_certificate where event_id = '{eventTag}'")
    result = cursor.fetchall()

    if len(result) > 0 and type(idCertificate) == type(1):
        cursor.execute(f"SELECT * FROM events_register where event_id = '{eventTag}'")
        values = cursor.fetchall()

        if len(values) >= idCertificate:
            return render_template(f'courses/{eventTag}/showCertified.html',
                certifiedUrl=url_for('static', filename='certifieds/'+eventTag+'/'+str(idCertificate)+'.png'),
                values=values[idCertificate - 1])

        else:
            return render_template('error.html')
    else:
        return render_template('error.html')



@app.route(listDirections['getCertificate'], methods=['GET','POST'])
def getCertificate(eventTag=""):
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        if 'email' in request.form:
            if request.form['email'] != '':
                cursor.execute(f"SELECT * FROM events_certificate where event_id = '{eventTag}' and active = 1")
                result = cursor.fetchall()

                if len(result) > 0:
                    cursor.execute(f"SELECT * FROM events_register where event_id = '{eventTag}' and email = '"+request.form['email']+"'")
                    values = cursor.fetchall()

                    if len(values) > 0:
                        cursor.execute(f"SELECT * FROM events_register where event_id = '{eventTag}'")
                        results = cursor.fetchall()

                        certifiedName = str(results.index(values[0]) + 1)

                        return render_template(f'courses/{eventTag}/getCertified.html',
                            certifiedUrl=url_for('static', filename='certifieds/'+eventTag+'/'+certifiedName+'.png'),
                            values=values[0])

                    else:
                        flash('E-mail Invalido', 'error')
                else:
                    return render_template('error.html')
            else:
                flash('Hay Campos Vacíos', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')

    cursor.execute(f"SELECT * FROM events_certificate where event_id = '{eventTag}' and active = 1")
    results = cursor.fetchall()

    if len(results) > 0:
        return render_template(f'courses/{eventTag}/emailValidator.html', eventTag=eventTag)

    else:
        return render_template('error.html')


   ##################################################################
    #   LOGIN PAGE                                                 #
   ##################################################################
   #@app.route(listDirections['printXlsx'], methods=['GET','POST'])
   #def printXlsx():
   #db = static.getDbConnection()
    #   cursor = db.cursor(dictionary=True)
    #   cursor.execute(f"SELECT ROW_NUMBER() OVER (ORDER BY event_id) AS NUMERO , CONCAT(firstname , ' ', lastname ) AS NOMBRE, profession , country  AS PAIS FROM events_register WHERE event_id='7JUNIOTOE';")
    #   values = cursor.fetchall()
    #   #for row in values:


   ##################################################################
    #   PAGINA DE ERROR 404                                        #
   ##################################################################

@app.errorhandler(404)
def error404(e):
    return render_template('error.html'), 404



   ##################################################################
    #   PAGINA DE ERROR INTERNO                                    #
   ##################################################################

@app.errorhandler(500)
def error(e):
    return render_template('error.html'), 500

   ##################################################################
    #   PAGINA ODETT                                   #
   ##################################################################

@app.route('/random')
def random():
    return 'HELLO NAGAL ET GRETI'



