SELECT register_id , event_id , firstname , lastname , country , profession  FROM events_register WHERE event_id = '26ABRIL';
SELECT register_id , event_id , firstname , lastname  FROM events_register_old;

--- CONSULTA QUE UNO DOS CONSULTAS SEPARADAS EN UNA MISMA TABLA --
SELECT
    ROW_NUMBER() OVER (ORDER BY event_id) AS NUMERO,
    resultado_combinado.*
FROM (
	SELECT event_id , firstname , lastname , email FROM events_register_old
	UNION
	SELECT event_id , firstname , lastname , email FROM events_register WHERE event_id = "26ABRIL"
) AS resultado_combinado;


-- CONSULTA QUE OBTIENE LOS INSCRITOS EN CIERTO EVENTO Y LOS CUENTA --
SELECT 
    ROW_NUMBER() OVER (ORDER BY event_id) AS NUMERO , 
    CONCAT(firstname , ' ', lastname ) AS NOMBRE, profession , 
    country  AS PAIS FROM events_register WHERE event_id='10MAYO'
