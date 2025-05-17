from flask import Flask, render_template, url_for, request, redirect, flash, session, send_file
import hashlib
from datetime import datetime
import static

app = Flask(__name__)
app.secret_key = '88653085b29d21c81db94ea79056d11668522a07082844f400842cb5956ab3fc'

testPassword = "44ac25ce40d77a2c9627c42bd899b2d39dfb061b0a97dfa4f0091a86483a2343"

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


listDirections = {
        'test': '/test/<password>/',
        'index': '/',
        'eventForm': '/evento/<eventTag>/',
        'eventRegister': '/reservar/<eventTag>/',
        'eventConfirmed': '/reservar/<eventTag>/confirmacion/',
        'newsletterRegister': '/boletin/',
        'eventList': '/eventos/',
        'getCertifieds': '/cursos/<eventTag>/certificado/'
    }



   ##################################################################
    #   TEST PAGE                                                  #
   ##################################################################

@app.route(listDirections['test'], methods=['GET','POST'])
def test(password=""):

    hashObj = hashlib.sha256()
    hashObj.update(password.encode('utf-8'))

    if hashObj.hexdigest() == testPassword:
        return render_template('events/31mayo.html')

    elif password == 'statistics':
        db = static.getDbConnection()
        cursor = db.cursor(dictionary=True)

        cursor.execute("SELECT * FROM events WHERE (active = 1 OR active = 2) ORDER BY limit_date DESC")
        listEvents = cursor.fetchall()

        #return 'Nya~ >.<'

        return render_template('statistics.html', listEvents)

    else:
        return render_template('index.html')


   ##################################################################
    #   MAIN PAGE                                                  #
   ##################################################################

@app.route(listDirections['index'], methods=['GET','POST'])
def index():
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM events WHERE (active = 1 OR active = 2) ORDER BY limit_date DESC LIMIT 7")
    eventsCarousel = cursor.fetchall()

    return render_template('index.html', eventsCarousel=eventsCarousel, nowDate=datetime.now().date())



   ##################################################################
    #   FORMULARIO PARA EL EVENTO                                  #
   ##################################################################

@app.route(listDirections['eventForm'], methods=['GET','POST'])
def eventForm(eventTag=""):

    if eventTag == "10_MAYO":
        return redirect('/evento/10MAYO/')

    db = static.getDbConnection()
    cursor = db.cursor()

    cursor.execute("SELECT count(*) FROM events WHERE event_id = '"+eventTag+"' AND (active = 1 OR active = 2)")
    results = cursor.fetchall()

    if results[0][0] > 0:
        return render_template('events/' + eventTag.lower() + '.html')

    else:
        return render_template('404.html')

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
                    registerValues = {
                            'firstname': request.form['firstname'].strip(),
                            'lastname': request.form['lastname'].strip(),
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
                                    'firstname': request.form['firstname'].strip(),
                                    'lastname': request.form['lastname'].strip(),
                                    'email': request.form['email'].strip()
                                })

                        flash('True', 'newsletterRegister')

                    db.commit()

                    session['eventRegistered'] = eventTag
                    return redirect("/reservar/"+eventTag+"/confirmacion/")


                else:
                    flash('E-mail ya registrado para este Evento', 'error')
            else:
                flash('Error al cargar el Evento', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')
    else:
        flash('Hay Campos Vacíos', 'error')


    return redirect("/evento/"+eventTag+"/")



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
        if 'eventRegistered' in session:
            if session['eventRegistered'] == eventTag:
                session.pop('eventRegistered')
                return render_template('eventConfirmed.html', title=results[0]['title'])

    return render_template('404.html')



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

@app.route(listDirections['getCertifieds'] + '<int:idCertified>/', methods=['GET','POST'])
def getCertifiedsRedirect(eventTag="", idCertified=0):
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    cursor.execute(f"SELECT * FROM events_certified where event_id = '{eventTag}'")
    result = cursor.fetchall()

    if len(result) > 0 and type(idCertified) == type(1):
        cursor.execute(f"SELECT * FROM events_register where event_id = '{eventTag}'")
        values = cursor.fetchall()

        if len(values) >= idCertified:
            return render_template(f'courses/{eventTag}/showCertified.html',
                certifiedUrl=url_for('static', filename='certifieds/'+eventTag+'/'+str(idCertified)+'.png'),
                values=values[idCertified - 1])

        else:
            return render_template('404.html')
    else:
        return render_template('404.html')



@app.route(listDirections['getCertifieds'], methods=['GET','POST'])
def getCertifieds(eventTag=""):
    db = static.getDbConnection()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        if 'email' in request.form:
            if request.form['email'] != '':
                cursor.execute(f"SELECT * FROM events_certified where event_id = '{eventTag}' and active = 1")
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
                    return render_template('404.html')
            else:
                flash('Hay Campos Vacíos', 'error')
        else:
            flash('Hay Campos Vacíos', 'error')

    cursor.execute(f"SELECT * FROM events_certified where event_id = '{eventTag}' and active = 1")
    results = cursor.fetchall()

    if len(results) > 0:
        return render_template(f'courses/{eventTag}/emailValidator.html', eventTag=eventTag)

    else:
        return render_template('404.html')


   ##################################################################
    #   PAGINA DE ERROR 404                                        #
   ##################################################################

@app.errorhandler(404)
def error404(e):
    return render_template('404.html'), 404



   ##################################################################
    #   PAGINA DE ERROR INTERNO                                    #
   ##################################################################

@app.errorhandler(500)
def error(e):
    return render_template('404.html'), 500

   ##################################################################
    #   PAGINA ODETT                                   #
   ##################################################################

@app.route('/random')
def random():
    return 'HELLO NAGAL ET GRETI'



