DELIMITER $$
CREATE PROCEDURE alumnos_por_año(
	IN año VARCHAR(4)
)
BEGIN
	SELECT a.nombre, a.apellido1, a.apellido2, a.fecha_nacimiento
    FROM alumno AS a
    WHERE YEAR(a.fecha_nacimiento) = año;
END $$
DELIMITER ;

CALL alumnos_por_año('1999');

DELIMITER $$
CREATE PROCEDURE insert_departamento(
	IN codigo_departamento INT,
    IN nombre_departamento VARCHAR(50)
)
BEGIN
	INSERT INTO departamento
	VALUES (codigo_departamento, nombre_departamento);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE lista_asignaturas(
	IN cuatrimestre TINYINT(3),
    IN curso VARCHAR(10),
    IN grado INT
)
BEGIN
    SELECT a.nombre_asignatura
    FROM asignatura AS a
    WHERE cuatrimestre_asignatura = cuatrimestre
        AND codigo_curso = curso
        AND codigo_grado = grado;
END $$
DELIMITER ;

CALL lista_asignaturas(1, '3', 7);

DELIMITER $$
CREATE PROCEDURE insert_genero(
	IN codigo_genero VARCHAR(3),
    IN nombre_genero VARCHAR(20)
)
BEGIN
	INSERT INTO genero
	VALUES (codigo_genero, nombre_genero);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE asignaturas_año_curso(
	IN nif_alumno VARCHAR(9)
)
BEGIN
    SELECT a.nombre_asignatura, ce.anio_inicio, ce.anio_fin
    FROM asignatura AS a
    INNER JOIN alumno_se_matricula_asignatura AS am
    ON am.asignatura_codigo_asignatura = a.codigo_asignatura
    INNER JOIN curso_escolar AS ce
    ON ce.codigo_curso_escolar = am.codigo_curso_escolar
    INNER JOIN alumno AS al
    ON al.codigo_alumno = am.alumno_codigo_alumno
    WHERE al.nif = nif_alumno;
END $$
DELIMITER ;

CALL asignaturas_año_curso('26902806M');

DELIMITER $$
CREATE PROCEDURE insert_grado(
	IN codigo_grado INT,
    IN nombre_grado VARCHAR(100)
)
BEGIN
	INSERT INTO grado
	VALUES (codigo_grado, nombre_grado);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE asignaturas_grado(
	IN grado VARCHAR(100)
)
BEGIN
    SELECT a.nombre_asignatura
    FROM asignatura AS a
    INNER JOIN grado AS g
    ON g.codigo_grado = a.codigo_grado
    WHERE g.nombre_grado = grado;
END $$
DELIMITER ;

CALL asignaturas_grado('Grado en Ingeniería Informática (Plan 2015)');

DELIMITER $$
CREATE PROCEDURE insert_curso(
	IN codigo_curso VARCHAR(10),
    IN nombre_curso VARCHAR(50)
)
BEGIN
	INSERT INTO curso
	VALUES (codigo_curso, nombre_curso);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_tipo_asignatura(
	IN codigo_tipo_asignatura VARCHAR(5),
    IN nombre_tipo_asignatura VARCHAR(50)
)
BEGIN
	INSERT INTO tipo_asignatura
	VALUES (codigo_tipo_asignatura, nombre_tipo_asignatura);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_alumno_se_matricula_asignatura(
	IN alumno_codigo_alumno INT,
    IN asignatura_codigo_asignatura INT,
    IN codigo_curso_escolar INT
)
BEGIN
	INSERT INTO alumno_se_matricula_asignatura
	VALUES (alumno_codigo_alumno, asignatura_codigo_asignatura, codigo_curso_escolar);
END $$
DELIMITER ;