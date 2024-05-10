CREATE DATABASE uniDB;
USE uniDB;
-- -----------------------------------------------------
-- pais
-- -----------------------------------------------------
CREATE TABLE pais (
  codigo_pais VARCHAR(10) NOT NULL,
  nombre_pais VARCHAR(50) NOT NULL,
  CONSTRAINT PK_pais PRIMARY KEY (codigo_pais)
);

-- -----------------------------------------------------
-- region
-- -----------------------------------------------------
CREATE TABLE region (
  codigo_region VARCHAR(10) NOT NULL,
  nombre_region VARCHAR(50) NOT NULL,
  codigo_pais VARCHAR(10) NOT NULL,
  CONSTRAINT PK_region PRIMARY KEY (codigo_region),
  CONSTRAINT FK_region_pais
    FOREIGN KEY (codigo_pais)
    REFERENCES pais(codigo_pais)
);

-- -----------------------------------------------------
-- ciudad
-- -----------------------------------------------------
CREATE TABLE ciudad (
  codigo_ciudad VARCHAR(10) NOT NULL,
  nombre_ciudad VARCHAR(50) NOT NULL,
  codigo_region VARCHAR(10) NOT NULL,
  CONSTRAINT PK_ciudad PRIMARY KEY (codigo_ciudad),
  CONSTRAINT FK_ciudad_region
    FOREIGN KEY (codigo_region)
    REFERENCES region(codigo_region)
);

-- -----------------------------------------------------
-- departamento
-- -----------------------------------------------------
CREATE TABLE departamento (
	codigo_departamento INT NOT NULL,
    nombre_departamento VARCHAR(50) NOT NULL,
    CONSTRAINT PK_departamento PRIMARY KEY (codigo_departamento)
);

-- -----------------------------------------------------
-- direccion
-- -----------------------------------------------------
CREATE TABLE direccion (
	codigo_direccion VARCHAR(5) NOT NULL,
    linea_direccion1 VARCHAR(50) NOT NULL,
    codigo_ciudad VARCHAR(10) NOT NULL,
    CONSTRAINT PK_direccion PRIMARY KEY (codigo_direccion),
    CONSTRAINT FK_direccion_ciudad 
      FOREIGN KEY (codigo_ciudad)
      REFERENCES ciudad(codigo_ciudad)
);

-- -----------------------------------------------------
-- telefono
-- -----------------------------------------------------
CREATE TABLE telefono (
	codigo_telefono VARCHAR(5) NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL,
    CONSTRAINT PK_telefono PRIMARY KEY (codigo_telefono)
);

-- -----------------------------------------------------
-- genero
-- -----------------------------------------------------
CREATE TABLE genero (
	codigo_genero VARCHAR(3) NOT NULL,
    nombre_genero VARCHAR(20) NOT NULL,
    CONSTRAINT PK_genero PRIMARY KEY (codigo_genero)
);

-- -----------------------------------------------------
-- curso_escolar
-- -----------------------------------------------------
CREATE TABLE curso_escolar (
	codigo_curso_escolar INT NOT NULL,
    anio_inicio YEAR(4) NOT NULL,
    anio_fin YEAR(4) NOT NULL,
    CONSTRAINT PK_curso_escolar PRIMARY KEY (codigo_curso_escolar)
);

-- -----------------------------------------------------
-- grado
-- -----------------------------------------------------
CREATE TABLE grado (
	codigo_grado INT NOT NULL,
    nombre_grado VARCHAR(100) NOT NULL,
    CONSTRAINT PK_grado PRIMARY KEY (codigo_grado)
);

-- -----------------------------------------------------
-- curso
-- -----------------------------------------------------
CREATE TABLE curso (
	codigo_curso VARCHAR(10) NOT NULL,
    nombre_curso VARCHAR(50) NOT NULL,
    CONSTRAINT PK_curso PRIMARY KEY (codigo_curso)
);

-- -----------------------------------------------------
-- tipo_asignatura
-- -----------------------------------------------------
CREATE TABLE tipo_asignatura (
	codigo_tipo_asignatura VARCHAR(5) NOT NULL,
    nombre_tipo_asignatura VARCHAR(50) NOT NULL,
    CONSTRAINT PK_tipo_asignatura PRIMARY KEY (codigo_tipo_asignatura)
);

-- -----------------------------------------------------
-- profesor
-- -----------------------------------------------------
CREATE TABLE profesor (
	codigo_profesor INT NOT NULL,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    codigo_genero VARCHAR(3) NOT NULL,
    codigo_departamento INT NOT NULL,
    CONSTRAINT PK_profesor PRIMARY KEY (codigo_profesor),
    CONSTRAINT FK_genero_profesor
      FOREIGN KEY (codigo_genero)
      REFERENCES genero(codigo_genero),
    CONSTRAINT FK_departamento_profesor
      FOREIGN KEY (codigo_departamento)
      REFERENCES departamento(codigo_departamento)
);

-- -----------------------------------------------------
-- asignatura
-- -----------------------------------------------------
CREATE TABLE asignatura (
	codigo_asignatura INT NOT NULL,
    nombre_asignatura VARCHAR(100) NOT NULL,
    creditos_asignatura FLOAT NOT NULL,
    codigo_tipo_asignatura VARCHAR(5) NOT NULL,
    codigo_curso VARCHAR(10) NOT NULL,
    cuatrimestre_asignatura TINYINT(3) NOT NULL,
    codigo_profesor INT,
    codigo_grado INT NOT NULL,
    CONSTRAINT PK_asignatura PRIMARY KEY (codigo_asignatura),
    CONSTRAINT FK_tipo_asignatura_asignatura
      FOREIGN KEY (codigo_tipo_asignatura)
      REFERENCES tipo_asignatura(codigo_tipo_asignatura),
    CONSTRAINT FK_curso_asignatura
      FOREIGN KEY (codigo_curso)
      REFERENCES curso(codigo_curso),
    CONSTRAINT FK_profesor_asignatura
      FOREIGN KEY (codigo_profesor)
      REFERENCES profesor(codigo_profesor),
    CONSTRAINT FK_grado_asignatura
      FOREIGN KEY (codigo_grado)
      REFERENCES grado(codigo_grado)
);

-- -----------------------------------------------------
-- alumno
-- -----------------------------------------------------
CREATE TABLE alumno (
	codigo_alumno INT NOT NULL,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    codigo_genero VARCHAR(3) NOT NULL,
    CONSTRAINT PK_alumno PRIMARY KEY (codigo_alumno),
    CONSTRAINT FK_genero_alumno
      FOREIGN KEY (codigo_genero)
      REFERENCES genero(codigo_genero)
);

-- -----------------------------------------------------
-- alumno_se_matricula_asignatura
-- -----------------------------------------------------
CREATE TABLE alumno_se_matricula_asignatura (
	alumno_codigo_alumno INT NOT NULL,
    asignatura_codigo_asignatura INT NOT NULL,
    codigo_curso_escolar INT NOT NULL,
    CONSTRAINT PK_alumno_se_matricula_asignatura PRIMARY KEY (alumno_codigo_alumno, asignatura_codigo_asignatura, codigo_curso_escolar),
    CONSTRAINT FK_alumno_alumno_se_matricula_asignatura
      FOREIGN KEY (alumno_codigo_alumno)
      REFERENCES alumno(codigo_alumno),
    CONSTRAINT FK_asignatura_alumno_se_matricula_asignatura
      FOREIGN KEY (asignatura_codigo_asignatura)
      REFERENCES asignatura(codigo_asignatura),
    CONSTRAINT FK_curso_escolar_alumno_se_matricula_asignatura
      FOREIGN KEY (codigo_curso_escolar)
      REFERENCES curso_escolar(codigo_curso_escolar)
);

-- -----------------------------------------------------
-- telefono_profesor
-- -----------------------------------------------------
CREATE TABLE telefono_profesor (
	codigo_telefono_profesor VARCHAR(5) NOT NULL,
    profesor_codigo_profesor INT NOT NULL,
    telefono_codigo_telefono VARCHAR(5) NOT NULL,
    CONSTRAINT PK_telefono_profesor PRIMARY KEY (codigo_telefono_profesor),
    CONSTRAINT FK_profesor_telefono_profesor
      FOREIGN KEY (profesor_codigo_profesor)
      REFERENCES profesor(codigo_profesor),
    CONSTRAINT FK_telefono_telefono_profesor
      FOREIGN KEY (telefono_codigo_telefono)
      REFERENCES telefono(codigo_telefono)
);

-- -----------------------------------------------------
-- telefono_alumno
-- -----------------------------------------------------
CREATE TABLE telefono_alumno (
	codigo_telefono_alumno VARCHAR(5) NOT NULL,
    alumno_codigo_alumno INT NOT NULL,
    telefono_codigo_telefono VARCHAR(5) NOT NULL,
    CONSTRAINT PK_telefono_alumno PRIMARY KEY (codigo_telefono_alumno),
    CONSTRAINT FK_alumno_telefono_alumno
      FOREIGN KEY (alumno_codigo_alumno)
      REFERENCES alumno(codigo_alumno),
    CONSTRAINT FK_telefono_telefono_alumno
      FOREIGN KEY (telefono_codigo_telefono)
      REFERENCES telefono(codigo_telefono)
);

-- -----------------------------------------------------
-- direccion_profesor
-- -----------------------------------------------------
CREATE TABLE direccion_profesor (
	codigo_direccion_profesor VARCHAR(5) NOT NULL,
    profesor_codigo_profesor INT NOT NULL,
    direccion_codigo_direccion VARCHAR(5) NOT NULL,
    CONSTRAINT PK_direccion_profesor PRIMARY KEY (codigo_direccion_profesor),
    CONSTRAINT FK_profesor_direccion_profesor
      FOREIGN KEY (profesor_codigo_profesor)
      REFERENCES profesor(codigo_profesor),
    CONSTRAINT FK_direccion_direccion_profesor
      FOREIGN KEY (direccion_codigo_direccion)
      REFERENCES direccion(codigo_direccion)
);

-- -----------------------------------------------------
-- direccion_alumno
-- -----------------------------------------------------
CREATE TABLE direccion_alumno (
	codigo_direccion_alumno VARCHAR(5) NOT NULL,
    alumno_codigo_alumno INT NOT NULL,
    direccion_codigo_direccion VARCHAR(5) NOT NULL,
    CONSTRAINT PK_direccion_alumno PRIMARY KEY (codigo_direccion_alumno),
    CONSTRAINT FK_alumno_direccion_alumno
      FOREIGN KEY (alumno_codigo_alumno)
      REFERENCES alumno(codigo_alumno),
    CONSTRAINT FK_direccion_direccion_alumno
      FOREIGN KEY (direccion_codigo_direccion)
      REFERENCES direccion(codigo_direccion)
);