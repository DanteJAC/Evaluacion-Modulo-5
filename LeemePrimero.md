

Base de datos en MySQL:

CREATE DATABASE basededatos;
USE basededatos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO usuarios (username, password) VALUES ('admin', 'admin123');
INSERT INTO usuarios (username, password) VALUES ('admin1', 'admin321');

ALTER TABLE usuarios ADD saldo DECIMAL(10, 2) DEFAULT 0.00;


UPDATE usuarios SET saldo = 1000 WHERE username = 'admin';
UPDATE usuarios SET saldo = 1000 WHERE username = 'admin1';



**IDE usado Eclipse**

Tomcat 9.0.86
Librerias externas
jstl-1.2-jar
mysql-connector-j-8-3-0-jar
standar.jar





