CREATE VIEW alumnos_apellidos_nombre AS
SELECT a.apellido1, a.apellido2, a.nombre
FROM alumno AS a
ORDER BY a.apellido1 ASC, a.apellido2 ASC, a.nombre ASC;

CREATE VIEW profesores_departamentos AS
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre_departamento
FROM profesor AS p
INNER JOIN departamento AS d
ON d.codigo_departamento = p.codigo_departamento
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

CREATE VIEW profesores_sin_asignatura AS
SELECT p.nombre, p.apellido1, p.apellido2
FROM profesor AS p
LEFT JOIN asignatura AS a
ON a.codigo_profesor = p.codigo_profesor
WHERE a.codigo_profesor IS NULL;

CREATE VIEW asignaturas_sin_profesor AS
SELECT a.nombre_asignatura
FROM asignatura AS a
LEFT JOIN profesor AS p
ON p.codigo_profesor = a.codigo_profesor
WHERE p.codigo_profesor IS NULL;

CREATE VIEW numero_profesores_departamento AS
SELECT d.nombre_departamento, COUNT(p.codigo_profesor) AS numero_profesores
FROM profesor AS p
INNER JOIN departamento AS d
ON d.codigo_departamento = p.codigo_departamento
GROUP BY d.nombre_departamento
ORDER BY COUNT(p.codigo_profesor) DESC;

CREATE VIEW numero_asignaturas_grado AS
SELECT g.nombre_grado, COUNT(a.codigo_asignatura) AS numero_asignaturas
FROM grado AS g
LEFT JOIN asignatura AS a
ON a.codigo_grado = g.codigo_grado
GROUP BY g.nombre_grado
ORDER BY COUNT(a.codigo_asignatura) DESC;

CREATE VIEW numero_asignaturas_profesor AS
SELECT p.codigo_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.codigo_asignatura) AS numero_asignaturas
FROM profesor AS p
LEFT JOIN asignatura AS a
ON a.codigo_profesor = p.codigo_profesor
GROUP BY p.codigo_profesor, p.nombre, p.apellido1, p.apellido2
ORDER BY numero_asignaturas DESC;

CREATE VIEW profesores_departamentos AS
SELECT d.nombre_departamento, p.apellido1, p.apellido2, p.nombre
FROM profesor AS p
LEFT JOIN departamento AS d
ON d.codigo_departamento = p.codigo_departamento
ORDER BY d.nombre_departamento ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

CREATE VIEW departamentos_sin_profesor AS
SELECT d.nombre_departamento
FROM departamento AS d
LEFT JOIN profesor AS p
ON p.codigo_departamento = d.codigo_departamento
WHERE p.codigo_departamento IS NULL;

CREATE VIEW numero_profesores_departamentos AS
SELECT d.nombre_departamento, COUNT(p.codigo_profesor) AS numero_profesores
FROM departamento AS d
LEFT JOIN profesor AS p
ON p.codigo_departamento = d.codigo_departamento
GROUP BY d.nombre_departamento
ORDER BY COUNT(p.codigo_profesor) DESC;