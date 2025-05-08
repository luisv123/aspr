DROP DATABASE IF EXISTS aspr$aspr;
CREATE DATABASE aspr$aspr;
USE aspr$aspr

CREATE TABLE events(
    event_id   VARCHAR(15) NOT NULL,
    limit_date DATE,
    active     BOOL,
    PRIMARY KEY(event_id)
);

CREATE TABLE events_register(
    register_id  INT NOT NULL AUTO_INCREMENT,
    firstname    VARCHAR(30)  NOT NULL,
    lastname     VARCHAR(30)  NOT NULL,
    email        VARCHAR(100) NOT NULL,
    inputs       TEXT,
    event_id     VARCHAR(10),
    PRIMARY KEY(register_id)
);

CREATE TABLE newsletter_register(
    register_id  INT NOT NULL AUTO_INCREMENT,
    firstname    VARCHAR(30)  NOT NULL,
    lastname     VARCHAR(30)  NOT NULL,
    email        VARCHAR(100) NOT NULL,
    PRIMARY KEY(register_id)
);