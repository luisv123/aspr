mysql> SHOW CREATE TABLE events_register;
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table           | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| events_register | CREATE TABLE `events_register` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `event_id` varchar(10) DEFAULT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `tlf` varchar(20) DEFAULT NULL,
  `motives` text,
  `time_register` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT ROW_NUMBER() OVER (ORDER BY time_register) AS NUMERO ,firstname AS NOMBRE, profession AS PROFESION, country  AS PAIS, time_register as FECHA_REGISTRO FROM events_register WHERE event_id='7JUNIOTOE';
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
| NUMERO | NOMBRE                 | PROFESION                                                                  | PAIS | FECHA_REGISTRO      |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
|      1 | William Antonio        | Tecnólogo en radiología                                                    | CO   | 2025-05-19 18:15:28 |
|      2 | Maurice José           | Profesor Universitario                                                     | CU   | 2025-05-19 20:05:21 |
|      3 | Cristofer Hamilton     | Tecnico en radiologuia                                                     | GT   | 2025-05-19 20:31:50 |
|      4 | Stanley                | TECNICO EN RADIOLOGIA                                                      | GT   | 2025-05-19 20:37:15 |
|      5 | Luis                   | Veterinario                                                                | GT   | 2025-05-19 20:45:21 |
|      6 | Adrian                 | Dependiente de veterinaria                                                 | GT   | 2025-05-19 20:48:48 |
|      7 | Enny Carolina          | Bacterióloga                                                               | SV   | 2025-05-19 20:54:19 |
|      8 | Raul Jose              | Radiologo                                                                  | GT   | 2025-05-19 20:55:02 |
|      9 | Christian Erick        | Médico nuclear                                                             | CO   | 2025-05-19 21:15:28 |
|     10 | Richard                | Tecnólogo Médico                                                           | PE   | 2025-05-19 21:48:13 |
|     11 | Ivan                   | Ingeniero                                                                  | MX   | 2025-05-19 21:54:22 |
|     12 | Jeison Esteban         | Docente universitario, tecnólogo en radiología e imágenes diagnósticas     | CO   | 2025-05-19 22:04:49 |
|     13 | César Augusto López    | Tecnico en radiologia                                                      | GT   | 2025-05-19 22:22:44 |
|     14 | José Andrés            | Técnico en Radiología e Imágenes Diagnósticas                              | GT   | 2025-05-19 22:46:15 |
|     15 | Sandra                 | Tecnico en Radiología                                                      | GT   | 2025-05-20 01:13:18 |
|     16 | Yulisa                 | Tecnología médica en radiología                                            | PE   | 2025-05-20 06:39:07 |
|     17 | Marco Rene             | Médico y cirujano                                                          | GT   | 2025-05-20 11:27:48 |
|     18 | Victor Daniel          | Ingeniero mecánico                                                         | VE   | 2025-05-20 11:32:17 |
|     19 | Ana Flor               | Tecnólogo médico                                                           | PE   | 2025-05-20 12:22:02 |
|     20 | Jaime Cristobal        | Licenciado en Radiología e Imagenologia                                    | EC   | 2025-05-20 12:38:29 |
|     21 | Bibiana Aracely        | Técnico en Radiología e imágenes diagnosticas                              | GT   | 2025-05-20 17:59:24 |
|     22 | Luis Emilio            | Técnico en radiología                                                      | GT   | 2025-05-20 17:59:38 |
|     23 | Nery                   | Técnico en radiología e imágenes diagnósticas                              | GT   | 2025-05-20 18:11:21 |
|     24 | Victor Josué           | Técnico Universitario en Radiología e Imágenes Diagnósticas                | GT   | 2025-05-20 18:19:43 |
|     25 | Esmeralda              | Tecnología médica con especialidad en radiología                           | PE   | 2025-05-20 22:48:40 |
|     26 | Homero Josué Álvarez   | Técnico Radiólogo                                                          | MX   | 2025-05-20 23:02:55 |
|     27 | Giovanni Vicente       | RADIOLOGIA                                                                 | MX   | 2025-05-20 23:13:14 |
|     28 | Luis                   | Ajhaha                                                                     | VE   | 2025-05-21 02:13:04 |
|     29 | Raul                   | Fisico Medico                                                              | VE   | 2025-05-21 02:24:03 |
|     30 | Julio Augusto          | Tecnico en Radiologia                                                      | GT   | 2025-05-21 02:24:58 |
|     31 | Gabriela Isabel        | Licenciada en Radiología e Imágenes                                        | SV   | 2025-05-21 03:38:00 |
|     32 | Doris                  | Radiologia                                                                 | SV   | 2025-05-21 03:39:43 |
|     33 | Jhon                   | Pruebs                                                                     | SV   | 2025-05-21 03:56:53 |
|     34 | Urbano                 | Tecnico en Radiologia                                                      | GT   | 2025-05-21 14:05:32 |
|     35 | Walter Dario           | Tecnico en Radiologia                                                      | GT   | 2025-05-21 16:15:42 |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
35 rows in set (0.00 sec)

mysql> SELECT ROW_NUMBER() OVER (ORDER BY event_id) AS NUMERO , CONCAT(firstname , ' ', lastname ) AS NOMBRE, profession AS PROFESION, country  AS PAIS FROM events_register WHERE event_id='31MAYO';
+--------+------------------------------------+-----------------------------------------------------+------+
| NUMERO | NOMBRE                             | PROFESION                                           | PAIS |
+--------+------------------------------------+-----------------------------------------------------+------+
|      1 | Maria Angélica Jiménez Pingo       | Estudiante de radiología                            | PE   |
|      2 | Diana Carolina Mucha Lopez         | Tecnólogo Médico en Radiología                      | PE   |
|      3 | María Daniela Rodriguez Bolivar    | ingeniero de petroleo                               | VE   |
|      4 | Daniela Rodriguez                  | Técnica Radióloga y en Terapia Radiante             | AR   |
|      5 | Reina Elizabeth Mejia Alvarado     | Técnico Universitario en Radiologia                 | GT   |
|      6 | Lara Cruz Marleny                  | Tecnólogo médico en radiologia                      | PE   |
|      7 | Juan Manuel Moraes                 | Imagenologgia                                       | UY   |
|      8 | Yaurima Gómez                      | Ing. Procesos Químicos                              | VE   |
|      9 | Marcos Torres                      | Ingeniero Geofísico                                 | VE   |
|     10 | José Alexander Leal Lopez          | Físico Médico                                       | VE   |
|     11 | Ilda Chica                         | Ing Quimico                                         | EC   |
|     12 | Magda Montaña                      | Tecnologo                                           | CO   |
|     13 | Celso Melgarejo                    | Radiologo                                           | PY   |
|     14 | Pedro Cortez                       | DOSIMETRÍSTA                                        | BO   |
|     15 | William Antonio Aristizabal Loaiza | Tecnólogo en radiología                             | CO   |
|     16 | José Oswaldo Abad Ovalle           | Física                                              | PE   |
|     17 | Erika Chisag                       | biofísica                                           | EC   |
|     18 | Jennifer Pasos Martinez            | Físico médico                                       | NI   |
|     19 | Guido Rincon                       | PROFESOR UNIVERSITARIO                              | CO   |
|     20 | Carol Lizeth Bautista Rodríguez    | Tegnologo en radiología e imágenes diagnósticas     | CO   |
|     21 | German David Alfaro peña           | Médico                                              | SV   |
|     22 | Jeison Esteban Peña Díaz           | Tecnólogo en radiología e imágenes diagnósticas     | CO   |
|     23 | Cristian camilo Pajaro donado      | Estudiante                                          | CO   |
|     24 | Fátima Villalta                    | Médico turnista                                     | SV   |
|     25 | Diana Marilu Carranza de Portillo  | Enfermería                                          | SV   |
|     26 | Iris anayanci Hernández            | Fioterapeuta                                        | SV   |
|     27 | Glenda Aracely Montiel Flores      | Doctora en Medicina                                 | SV   |
|     28 | Jessica Gonzalez                   | Rx                                                  | SV   |
+--------+------------------------------------+-----------------------------------------------------+------+
28 rows in set (0.01 sec)

mysql> SELECT ROW_NUMBER() OVER (ORDER BY time_register) AS NUMERO ,firstname AS NOMBRE, profession AS PROFESION, country  AS PAIS, time_register as FECHA_REGISTRO FROM events_register WHERE event_id='7JUNIOTOE';
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
| NUMERO | NOMBRE                 | PROFESION                                                                  | PAIS | FECHA_REGISTRO      |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
|      1 | William Antonio        | Tecnólogo en radiología                                                    | CO   | 2025-05-19 18:15:28 |
|      2 | Maurice José           | Profesor Universitario                                                     | CU   | 2025-05-19 20:05:21 |
|      3 | Cristofer Hamilton     | Tecnico en radiologuia                                                     | GT   | 2025-05-19 20:31:50 |
|      4 | Stanley                | TECNICO EN RADIOLOGIA                                                      | GT   | 2025-05-19 20:37:15 |
|      5 | Luis                   | Veterinario                                                                | GT   | 2025-05-19 20:45:21 |
|      6 | Adrian                 | Dependiente de veterinaria                                                 | GT   | 2025-05-19 20:48:48 |
|      7 | Enny Carolina          | Bacterióloga                                                               | SV   | 2025-05-19 20:54:19 |
|      8 | Raul Jose              | Radiologo                                                                  | GT   | 2025-05-19 20:55:02 |
|      9 | Christian Erick        | Médico nuclear                                                             | CO   | 2025-05-19 21:15:28 |
|     10 | Richard                | Tecnólogo Médico                                                           | PE   | 2025-05-19 21:48:13 |
|     11 | Ivan                   | Ingeniero                                                                  | MX   | 2025-05-19 21:54:22 |
|     12 | Jeison Esteban         | Docente universitario, tecnólogo en radiología e imágenes diagnósticas     | CO   | 2025-05-19 22:04:49 |
|     13 | César Augusto López    | Tecnico en radiologia                                                      | GT   | 2025-05-19 22:22:44 |
|     14 | José Andrés            | Técnico en Radiología e Imágenes Diagnósticas                              | GT   | 2025-05-19 22:46:15 |
|     15 | Sandra                 | Tecnico en Radiología                                                      | GT   | 2025-05-20 01:13:18 |
|     16 | Yulisa                 | Tecnología médica en radiología                                            | PE   | 2025-05-20 06:39:07 |
|     17 | Marco Rene             | Médico y cirujano                                                          | GT   | 2025-05-20 11:27:48 |
|     18 | Victor Daniel          | Ingeniero mecánico                                                         | VE   | 2025-05-20 11:32:17 |
|     19 | Ana Flor               | Tecnólogo médico                                                           | PE   | 2025-05-20 12:22:02 |
|     20 | Jaime Cristobal        | Licenciado en Radiología e Imagenologia                                    | EC   | 2025-05-20 12:38:29 |
|     21 | Bibiana Aracely        | Técnico en Radiología e imágenes diagnosticas                              | GT   | 2025-05-20 17:59:24 |
|     22 | Luis Emilio            | Técnico en radiología                                                      | GT   | 2025-05-20 17:59:38 |
|     23 | Nery                   | Técnico en radiología e imágenes diagnósticas                              | GT   | 2025-05-20 18:11:21 |
|     24 | Victor Josué           | Técnico Universitario en Radiología e Imágenes Diagnósticas                | GT   | 2025-05-20 18:19:43 |
|     25 | Esmeralda              | Tecnología médica con especialidad en radiología                           | PE   | 2025-05-20 22:48:40 |
|     26 | Homero Josué Álvarez   | Técnico Radiólogo                                                          | MX   | 2025-05-20 23:02:55 |
|     27 | Giovanni Vicente       | RADIOLOGIA                                                                 | MX   | 2025-05-20 23:13:14 |
|     28 | Luis                   | Ajhaha                                                                     | VE   | 2025-05-21 02:13:04 |
|     29 | Raul                   | Fisico Medico                                                              | VE   | 2025-05-21 02:24:03 |
|     30 | Julio Augusto          | Tecnico en Radiologia                                                      | GT   | 2025-05-21 02:24:58 |
|     31 | Gabriela Isabel        | Licenciada en Radiología e Imágenes                                        | SV   | 2025-05-21 03:38:00 |
|     32 | Doris                  | Radiologia                                                                 | SV   | 2025-05-21 03:39:43 |
|     33 | Jhon                   | Pruebs                                                                     | SV   | 2025-05-21 03:56:53 |
|     34 | Urbano                 | Tecnico en Radiologia                                                      | GT   | 2025-05-21 14:05:32 |
|     35 | Walter Dario           | Tecnico en Radiologia                                                      | GT   | 2025-05-21 16:15:42 |
|     36 | Juan Miguel            | Físico                                                                     | EC   | 2025-05-21 16:43:17 |
|     37 | Anderson               | Médico                                                                     | SV   | 2025-05-21 17:40:07 |
|     38 | Carlos Anubis          | Lic en Radiologia                                                          | SV   | 2025-05-21 17:55:09 |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
38 rows in set (0.00 sec)

mysql> SELECT count(*) FROM events WHERE event_id = '7JUNIOTOE' AND (active = 1 OR active = 2)
    -> ;
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)

mysql> ^C
mysql> SELECT ROW_NUMBER() OVER (ORDER BY time_register) AS NUMERO ,firstname AS NOMBRE, profession AS PROFESION, country  AS PAIS, time_register as FECHA_REGISTRO FROM events_register WHERE event_id='7JUNIOTOE';
+--------+-------------------------------+----------------------------------------------------------------------------+------+---------------------+
| NUMERO | NOMBRE                        | PROFESION                                                                  | PAIS | FECHA_REGISTRO      |
+--------+-------------------------------+----------------------------------------------------------------------------+------+---------------------+
|      1 | William Antonio               | Tecnólogo en radiología                                                    | CO   | 2025-05-19 18:15:28 |
|      2 | Maurice José                  | Profesor Universitario                                                     | CU   | 2025-05-19 20:05:21 |
|      3 | Cristofer Hamilton            | Tecnico en radiologuia                                                     | GT   | 2025-05-19 20:31:50 |
|      4 | Stanley                       | TECNICO EN RADIOLOGIA                                                      | GT   | 2025-05-19 20:37:15 |
|      5 | Luis                          | Veterinario                                                                | GT   | 2025-05-19 20:45:21 |
|      6 | Adrian                        | Dependiente de veterinaria                                                 | GT   | 2025-05-19 20:48:48 |
|      7 | Enny Carolina                 | Bacterióloga                                                               | SV   | 2025-05-19 20:54:19 |
|      8 | Raul Jose                     | Radiologo                                                                  | GT   | 2025-05-19 20:55:02 |
|      9 | Christian Erick               | Médico nuclear                                                             | CO   | 2025-05-19 21:15:28 |
|     10 | Richard                       | Tecnólogo Médico                                                           | PE   | 2025-05-19 21:48:13 |
|     11 | Ivan                          | Ingeniero                                                                  | MX   | 2025-05-19 21:54:22 |
|     12 | Jeison Esteban                | Docente universitario, tecnólogo en radiología e imágenes diagnósticas     | CO   | 2025-05-19 22:04:49 |
|     13 | César Augusto López           | Tecnico en radiologia                                                      | GT   | 2025-05-19 22:22:44 |
|     14 | José Andrés                   | Técnico en Radiología e Imágenes Diagnósticas                              | GT   | 2025-05-19 22:46:15 |
|     15 | Sandra                        | Tecnico en Radiología                                                      | GT   | 2025-05-20 01:13:18 |
|     16 | Yulisa                        | Tecnología médica en radiología                                            | PE   | 2025-05-20 06:39:07 |
|     17 | Marco Rene                    | Médico y cirujano                                                          | GT   | 2025-05-20 11:27:48 |
|     18 | Victor Daniel                 | Ingeniero mecánico                                                         | VE   | 2025-05-20 11:32:17 |
|     19 | Ana Flor                      | Tecnólogo médico                                                           | PE   | 2025-05-20 12:22:02 |
|     20 | Jaime Cristobal               | Licenciado en Radiología e Imagenologia                                    | EC   | 2025-05-20 12:38:29 |
|     21 | Bibiana Aracely               | Técnico en Radiología e imágenes diagnosticas                              | GT   | 2025-05-20 17:59:24 |
|     22 | Luis Emilio                   | Técnico en radiología                                                      | GT   | 2025-05-20 17:59:38 |
|     23 | Nery                          | Técnico en radiología e imágenes diagnósticas                              | GT   | 2025-05-20 18:11:21 |
|     24 | Victor Josué                  | Técnico Universitario en Radiología e Imágenes Diagnósticas                | GT   | 2025-05-20 18:19:43 |
|     25 | Esmeralda                     | Tecnología médica con especialidad en radiología                           | PE   | 2025-05-20 22:48:40 |
|     26 | Homero Josué Álvarez          | Técnico Radiólogo                                                          | MX   | 2025-05-20 23:02:55 |
|     27 | Giovanni Vicente              | RADIOLOGIA                                                                 | MX   | 2025-05-20 23:13:14 |
|     28 | Luis                          | Ajhaha                                                                     | VE   | 2025-05-21 02:13:04 |
|     29 | Raul                          | Fisico Medico                                                              | VE   | 2025-05-21 02:24:03 |
|     30 | Julio Augusto                 | Tecnico en Radiologia                                                      | GT   | 2025-05-21 02:24:58 |
|     31 | Gabriela Isabel               | Licenciada en Radiología e Imágenes                                        | SV   | 2025-05-21 03:38:00 |
|     32 | Doris                         | Radiologia                                                                 | SV   | 2025-05-21 03:39:43 |
|     33 | Jhon                          | Pruebs                                                                     | SV   | 2025-05-21 03:56:53 |
|     34 | Urbano                        | Tecnico en Radiologia                                                      | GT   | 2025-05-21 14:05:32 |
|     35 | Walter Dario                  | Tecnico en Radiologia                                                      | GT   | 2025-05-21 16:15:42 |
|     36 | Juan Miguel                   | Físico                                                                     | EC   | 2025-05-21 16:43:17 |
|     37 | Anderson                      | Médico                                                                     | SV   | 2025-05-21 17:40:07 |
|     38 | Carlos Anubis                 | Lic en Radiologia                                                          | SV   | 2025-05-21 17:55:09 |
|     39 | Jdjdskld Kljfslkdj            | 9080809                                                                    | VE   | 2025-05-21 21:29:46 |
|     40 | Jdjdskld Kljfslkdj            | 9080809                                                                    | VE   | 2025-05-21 21:34:00 |
|     41 | Jkhjh                         | uiuoiuoi                                                                   | CO   | 2025-05-21 21:35:28 |
|     42 | Luiso                         | uiuoiuoi                                                                   | CO   | 2025-05-21 21:36:58 |
|     43 | Luis                          | uiuoiuoi                                                                   | CO   | 2025-05-21 21:45:11 |
|     44 | Maria Alejandra De Los Cielo  | uiuoiuoi                                                                   | CO   | 2025-05-21 21:46:08 |
|     45 | Maria Alejandra De Los Cielos | uiuoiuoi                                                                   | CO   | 2025-05-21 21:46:35 |
+--------+-------------------------------+----------------------------------------------------------------------------+------+---------------------+
45 rows in set (0.01 sec)

mysql> Jdjdskld Kljfslkdj            | 9080809                                                                    | VE   | 2025-05-21 21:29:46 |
    -> ^C
mysql> ^C
mysql> SELECT ROW_NUMBER() OVER (ORDER BY time_register) AS NUMERO ,firstname AS NOMBRE, profession AS PROFESION, country  AS PAIS, time_register as FECHA_REGISTRO FROM events_register WHERE event_id='7JUNIOTOE';
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
| NUMERO | NOMBRE                 | PROFESION                                                                  | PAIS | FECHA_REGISTRO      |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
|      1 | William Antonio        | Tecnólogo en radiología                                                    | CO   | 2025-05-19 18:15:28 |
|      2 | Maurice José           | Profesor Universitario                                                     | CU   | 2025-05-19 20:05:21 |
|      3 | Cristofer Hamilton     | Tecnico en radiologuia                                                     | GT   | 2025-05-19 20:31:50 |
|      4 | Stanley                | TECNICO EN RADIOLOGIA                                                      | GT   | 2025-05-19 20:37:15 |
|      5 | Luis                   | Veterinario                                                                | GT   | 2025-05-19 20:45:21 |
|      6 | Adrian                 | Dependiente de veterinaria                                                 | GT   | 2025-05-19 20:48:48 |
|      7 | Enny Carolina          | Bacterióloga                                                               | SV   | 2025-05-19 20:54:19 |
|      8 | Raul Jose              | Radiologo                                                                  | GT   | 2025-05-19 20:55:02 |
|      9 | Christian Erick        | Médico nuclear                                                             | CO   | 2025-05-19 21:15:28 |
|     10 | Richard                | Tecnólogo Médico                                                           | PE   | 2025-05-19 21:48:13 |
|     11 | Ivan                   | Ingeniero                                                                  | MX   | 2025-05-19 21:54:22 |
|     12 | Jeison Esteban         | Docente universitario, tecnólogo en radiología e imágenes diagnósticas     | CO   | 2025-05-19 22:04:49 |
|     13 | César Augusto López    | Tecnico en radiologia                                                      | GT   | 2025-05-19 22:22:44 |
|     14 | José Andrés            | Técnico en Radiología e Imágenes Diagnósticas                              | GT   | 2025-05-19 22:46:15 |
|     15 | Sandra                 | Tecnico en Radiología                                                      | GT   | 2025-05-20 01:13:18 |
|     16 | Yulisa                 | Tecnología médica en radiología                                            | PE   | 2025-05-20 06:39:07 |
|     17 | Marco Rene             | Médico y cirujano                                                          | GT   | 2025-05-20 11:27:48 |
|     18 | Victor Daniel          | Ingeniero mecánico                                                         | VE   | 2025-05-20 11:32:17 |
|     19 | Ana Flor               | Tecnólogo médico                                                           | PE   | 2025-05-20 12:22:02 |
|     20 | Jaime Cristobal        | Licenciado en Radiología e Imagenologia                                    | EC   | 2025-05-20 12:38:29 |
|     21 | Bibiana Aracely        | Técnico en Radiología e imágenes diagnosticas                              | GT   | 2025-05-20 17:59:24 |
|     22 | Luis Emilio            | Técnico en radiología                                                      | GT   | 2025-05-20 17:59:38 |
|     23 | Nery                   | Técnico en radiología e imágenes diagnósticas                              | GT   | 2025-05-20 18:11:21 |
|     24 | Victor Josué           | Técnico Universitario en Radiología e Imágenes Diagnósticas                | GT   | 2025-05-20 18:19:43 |
|     25 | Esmeralda              | Tecnología médica con especialidad en radiología                           | PE   | 2025-05-20 22:48:40 |
|     26 | Homero Josué Álvarez   | Técnico Radiólogo                                                          | MX   | 2025-05-20 23:02:55 |
|     27 | Giovanni Vicente       | RADIOLOGIA                                                                 | MX   | 2025-05-20 23:13:14 |
|     28 | Luis                   | Ajhaha                                                                     | VE   | 2025-05-21 02:13:04 |
|     29 | Raul                   | Fisico Medico                                                              | VE   | 2025-05-21 02:24:03 |
|     30 | Julio Augusto          | Tecnico en Radiologia                                                      | GT   | 2025-05-21 02:24:58 |
|     31 | Gabriela Isabel        | Licenciada en Radiología e Imágenes                                        | SV   | 2025-05-21 03:38:00 |
|     32 | Doris                  | Radiologia                                                                 | SV   | 2025-05-21 03:39:43 |
|     33 | Jhon                   | Pruebs                                                                     | SV   | 2025-05-21 03:56:53 |
|     34 | Urbano                 | Tecnico en Radiologia                                                      | GT   | 2025-05-21 14:05:32 |
|     35 | Walter Dario           | Tecnico en Radiologia                                                      | GT   | 2025-05-21 16:15:42 |
|     36 | Juan Miguel            | Físico                                                                     | EC   | 2025-05-21 16:43:17 |
|     37 | Anderson               | Médico                                                                     | SV   | 2025-05-21 17:40:07 |
|     38 | Carlos Anubis          | Lic en Radiologia                                                          | SV   | 2025-05-21 17:55:09 |
+--------+------------------------+----------------------------------------------------------------------------+------+---------------------+
38 rows in set (0.02 sec)

