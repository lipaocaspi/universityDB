# universityDB

#### Normalización

![](https://raw.githubusercontent.com/lipaocaspi/universityDB/main/DER.png)

#### Creación BD

```sql
-- -----------------------------------------------------
-- pais
-- -----------------------------------------------------
/* 1FN */
CREATE TABLE pais (
  codigo_pais VARCHAR(10) NOT NULL,
  nombre_pais VARCHAR(50) NOT NULL,
  CONSTRAINT PK_pais PRIMARY KEY (codigo_pais)
);

-- -----------------------------------------------------
-- region
-- -----------------------------------------------------
/* 1FN */
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
/* 1FN */
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
    nonbre_asignatura VARCHAR(100) NOT NULL,
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
```

#### Inserción de datos

```sql
INSERT INTO pais (codigo_pais, nombre_pais)
VALUES
    ('1', 'España');

INSERT INTO region (codigo_region, nombre_region, codigo_pais)
VALUES
    ('1', 'Andalucía', '1');

INSERT INTO ciudad (codigo_ciudad, nombre_ciudad, codigo_region)
VALUES
    ('1', 'Almería', '1');

INSERT INTO departamento (codigo_departamento, nombre_departamento)
VALUES
    (1, 'Informática'),
    (2, 'Matemáticas'),
    (3, 'Economía y Empresa'),
    (4, 'Educación'),
    (5, 'Agronomía'),
    (6, 'Química y Física'),
    (7, 'Filología'),
    (8, 'Derecho'),
    (9, 'Biología y Geología');

INSERT INTO direccion (codigo_direccion, linea_direccion1, codigo_ciudad)
VALUES
    ('1', 'C/ Mercurio', '1'),
    ('2', 'C/ Real del barrio alto', '1'),
    ('3', 'C/ Estrella fugaz', '1'),
    ('4', 'C/ Júpiter', '1'),
    ('5', 'C/ Neptuno', '1'),
    ('6', 'C/ Urano', '1'),
    ('7', 'C/ Andarax', '1'),
    ('8', 'C/ Picos de Europa', '1'),
    ('9', 'C/ Los pinos', '1'),
    ('10', 'C/ Cabo de Gata', '1'),
    ('11', 'C/ Zapillo', '1'),
    ('12', 'C/ Marte', '1'),
    ('13', 'C/ Venus', '1'),
    ('14', 'C/ Saturno', '1'),
    ('15', 'C/ Plutón', '1'),
    ('16', 'C/ Almanzora', '1'),
    ('17', 'C/ Guadalquivir', '1'),
    ('18', 'C/ Duero', '1'),
    ('19', 'C/ Tajo', '1'),
    ('20', 'C/ Sierra de los Filabres', '1'),
    ('21', 'C/ Sierra de Gádor', '1'),
    ('22', 'C/ Veleta', '1'),
    ('23', 'C/ Quinto pino', '1');

INSERT INTO telefono (codigo_telefono, numero_telefono)
VALUES
    ('1', '618253876'),
    ('2', '950254837'),
    ('3', '950254834'),
    ('4', '628349590'),
    ('5', '624349590'),
    ('6', '626351429'),
    ('7', '679837625'),
    ('8', '678652431'),
    ('9', '626652498'),
    ('10', '628452384'),
    ('11', '678812017'),
    ('12', '618223876'),
    ('13', '678516294'),
    ('14', '669162534'),
    ('15', '669163534'),
    ('16', '664162534'),
    ('17', '950896725'),
    ('18', '950263514'),
    ('19', '668726354'),
    ('20', '638726354'),
    ('21', '668726350'),
    ('22', '662765413'),
    ('23', '662765411'),
    ('24', '662735413'),
    ('25', '662765412'),
    ('26', '662765341');
 
INSERT INTO genero (codigo_genero, nombre_genero)
VALUES
    ('HOM', 'Hombre'),
    ('MUJ', 'Mujer');

INSERT INTO curso_escolar (codigo_curso_escolar, anio_inicio, anio_fin)
VALUES 
    (1, 2014, 2015),
    (2, 2015, 2016),
    (3, 2016, 2017),
    (4, 2017, 2018);

INSERT INTO grado (codigo_grado, nombre_grado)
VALUES
    (1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
    (2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
    (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
    (4, 'Grado en Ingeniería Informática (Plan 2015)'),
    (5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
    (6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
    (7, 'Grado en Biotecnología (Plan 2015)'),
    (8, 'Grado en Ciencias Ambientales (Plan 2009)'),
    (9, 'Grado en Matemáticas (Plan 2010)'),
    (10, 'Grado en Química (Plan 2009)');

INSERT INTO curso (codigo_curso, nombre_curso)
VALUES
    ('1', 'Primer curso'),
    ('2', 'Segundo curso'),
    ('3', 'Tercer curso'),
    ('4', 'Cuarto curso');

INSERT INTO tipo_asignatura (codigo_tipo_asignatura, nombre_tipo_asignatura)
VALUES
    ('BA', 'Básica'),
    ('OB', 'Obligatoria'), 
    ('OP', 'Optativa');

INSERT INTO profesor (codigo_profesor, nif, nombre, apellido1, apellido2, fecha_nacimiento, codigo_genero, codigo_departamento)
VALUES 
    (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', '1979/08/19', 'MUJ', 1),
    (5, '38223286T', 'David', 'Schmidt', 'Fisher', '1978/01/19', 'HOM', 2),
    (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', '1977/08/21', 'MUJ', 3),
    (10, '61142000L', 'Esther', 'Spencer', 'Lakin', '1977/05/19', 'MUJ', 4),
    (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', '1971-04-29', 'MUJ', 4),
    (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', '1980/02/01', 'HOM', 6),
    (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', '1977/01/02', 'HOM', 1),
    (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', '1980/03/14', 'HOM', 2),
    (16, '10485008K', 'Antonio', 'Fahey', 'Considine', '1982/03/18', 'HOM', 3),
    (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', '1973/05/05', 'HOM', 4),
    (18, '04326833G', 'Micaela', 'Monahan', 'Murray', '1976/02/25', 'HOM', 5),
    (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', '1980/10/31', 'HOM', 6),
    (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', '1980/10/16', 'HOM', 1),
    (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', '1980/11/21', 'HOM', 1),
    (23, '77194445M', 'María', 'Domínguez', 'Hernández', '1980/12/13', 'MUJ', 2);

INSERT INTO asignatura (codigo_asignatura, nonbre_asignatura, creditos_asignatura, codigo_tipo_asignatura, codigo_curso, cuatrimestre_asignatura, codigo_profesor, codigo_grado)
VALUES 
    (1, 'Álgegra lineal y matemática discreta', 6, 'BA', '1', 1, NULL, 4),
    (2, 'Cálculo', 6, 'BA', '1', 1, NULL, 4),
    (3, 'Física para informática', 6, 'BA', '1', 1, NULL, 4),
    (4, 'Introducción a la programación', 6, 'BA', '1', 1, NULL, 4),
    (5, 'Organización y gestión de empresas', 6, 'BA', '1', 1, NULL, 4),
    (6, 'Estadística', 6, 'BA', '1', 2, NULL, 4),
    (7, 'Estructura y tecnología de computadores', 6, 'BA', '1', 2, NULL, 4),
    (8, 'Fundamentos de electrónica', 6, 'BA', '1', 2, NULL, 4),
    (9, 'Lógica y algorítmica', 6, 'BA', '1', 2, NULL, 4),
    (10, 'Metodología de la programación', 6, 'BA', '1', 2, NULL, 4),
    (11, 'Arquitectura de Computadores', 6, 'BA', '2', 1, 3, 4),
    (12, 'Estructura de Datos y Algoritmos I', 6, 'OB', '2', 1, 3, 4),
    (13, 'Ingeniería del Software', 6, 'OB', '2', 1, 14, 4),
    (14, 'Sistemas Inteligentes', 6, 'OB', '2', 1, 3, 4),
    (15, 'Sistemas Operativos', 6, 'OB', '2', 1, 14, 4),
    (16, 'Bases de Datos', 6, 'BA', '2', 2, 14, 4),
    (17, 'Estructura de Datos y Algoritmos II', 6, 'OB', '2', 2, 14, 4),
    (18, 'Fundamentos de Redes de Computadores', 6 ,'OB', '2', 2, 3, 4),
    (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'OB', '2', 2, 3, 4),
    (20, 'Programación de Servicios Software', 6, 'OB', '2', 2, 14, 4),
    (21, 'Desarrollo de interfaces de usuario', 6, 'OB', '3', 1, 14, 4),
    (22, 'Ingeniería de Requisitos', 6, 'OP', '3', 1, NULL, 4),
    (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'OP', '3', 1, NULL, 4),
    (24, 'Modelado y Diseño del Software 1', 6, 'OP', '3', 1, NULL, 4),
    (25, 'Multiprocesadores', 6, 'OP', '3', 1, NULL, 4),
    (26, 'Seguridad y cumplimiento normativo', 6, 'OP', '3', 1, NULL, 4),
    (27, 'Sistema de Información para las Organizaciones', 6, 'OP', '3', 1, NULL, 4),
    (28, 'Tecnologías web', 6, 'OP', '3', 1, NULL, 4),
    (29, 'Teoría de códigos y criptografía', 6, 'OP', '3', 1, NULL, 4),
    (30, 'Administración de bases de datos', 6, 'OP', '3', 2, NULL, 4),
    (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'OP', '3', 2, NULL, 4),
    (32, 'Informática industrial y robótica', 6, 'OP', '3', 2, NULL, 4),
    (33, 'Ingeniería de Sistemas de Información', 6, 'OP', '3', 2, NULL, 4),
    (34, 'Modelado y Diseño del Software 2', 6, 'OP', '3', 2, NULL, 4),
    (35, 'Negocio Electrónico', 6, 'OP', '3', 2, NULL, 4),
    (36, 'Periféricos e interfaces', 6, 'OP', '3', 2, NULL, 4),
    (37, 'Sistemas de tiempo real', 6, 'OP', '3', 2, NULL, 4),
    (38, 'Tecnologías de acceso a red', 6, 'OP', '3', 2, NULL, 4),
    (39, 'Tratamiento digital de imágenes', 6, 'OP', '3', 2, NULL, 4),
    (40, 'Administración de redes y sistemas operativos', 6, 'OP', '4', 1, NULL, 4),
    (41, 'Almacenes de Datos', 6, 'OP', '4', 1, NULL, 4),
    (42, 'Fiabilidad y Gestión de Riesgos', 6, 'OP', '4', 1, NULL, 4),
    (43, 'Líneas de Productos Software', 6, 'OP', '4', 1, NULL, 4),
    (44, 'Procesos de Ingeniería del Software 1', 6, 'OP', '4', 1, NULL, 4),
    (45, 'Tecnologías multimedia', 6, 'OP', '4', 1, NULL, 4),
    (46, 'Análisis y planificación de las TI', 6, 'OP', '4', 2, NULL, 4),
    (47, 'Desarrollo Rápido de Aplicaciones', 6, 'OP', '4', 2, NULL, 4),
    (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'OP', '4', 2, NULL, 4),
    (49, 'Inteligencia del Negocio', 6, 'OP', '4', 2, NULL, 4),
    (50, 'Procesos de Ingeniería del Software 2', 6, 'OP', '4', 2, NULL, 4),
    (51, 'Seguridad Informática', 6, 'OP', '4', 2, NULL, 4),
    (52, 'Biologia celular', 6, 'BA', '1', 1, NULL, 7),
    (53, 'Física', 6, 'BA', '1', 1, NULL, 7),
    (54, 'Matemáticas I', 6, 'BA', '1', 1, NULL, 7),
    (55, 'Química general', 6, 'BA', '1', 1, NULL, 7),
    (56, 'Química orgánica', 6, 'BA', '1', 1, NULL, 7),
    (57, 'Biología vegetal y animal', 6, 'BA', '1', 2, NULL, 7),
    (58, 'Bioquímica', 6, 'BA', '1', 2, NULL, 7),
    (59, 'Genética', 6, 'BA', '1', 2, NULL, 7),
    (60, 'Matemáticas II', 6, 'BA', '1', 2, NULL, 7),
    (61, 'Microbiología', 6, 'BA', '1', 2, NULL, 7),
    (62, 'Botánica agrícola', 6, 'OB', '2', 1, NULL, 7),
    (63, 'Fisiología vegetal', 6, 'OB', '2', 1, NULL, 7),
    (64, 'Genética molecular', 6, 'OB', '2', 1, NULL, 7),
    (65, 'Ingeniería bioquímica', 6, 'OB', '2', 1, NULL, 7),
    (66, 'Termodinámica y cinética química aplicada', 6, 'OB', '2', 1, NULL, 7),
    (67, 'Biorreactores', 6, 'OB', '2', 2, NULL, 7),
    (68, 'Biotecnología microbiana', 6, 'OB', '2', 2, NULL, 7),
    (69, 'Ingeniería genética', 6, 'OB', '2', 2, NULL, 7),
    (70, 'Inmunología', 6, 'OB', '2', 2, NULL, 7),
    (71, 'Virología', 6, 'OB', '2', 2, NULL, 7),
    (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'OB', '3', 1, NULL, 7),
    (73, 'Fisiología animal', 4.5, 'OB', '3', 1, NULL, 7),
    (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'OB', '3', 1, NULL, 7),
    (75, 'Operaciones de separación', 6, 'OB', '3', 1, NULL, 7),
    (76, 'Patología molecular de plantas', 4.5, 'OB', '3', 1, NULL, 7),
    (77, 'Técnicas instrumentales básicas', 4.5, 'OB', '3', 1, NULL, 7),
    (78, 'Bioinformática', 4.5, 'OB', '3', 2, NULL, 7),
    (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'OB', '3', 2, NULL, 7),
    (80, 'Biotecnología vegetal', 6, 'OB', '3', 2, NULL, 7),
    (81, 'Genómica y proteómica', 4.5, 'OB', '3', 2, NULL, 7),
    (82, 'Procesos biotecnológicos', 6, 'OB', '3', 2, NULL, 7),
    (83, 'Técnicas instrumentales avanzadas', 4.5, 'OB', '3', 2, NULL, 7);

INSERT INTO alumno (codigo_alumno, nif, nombre, apellido1, apellido2, fecha_nacimiento, codigo_genero)
VALUES
    (1, '89542419S', 'Juan', 'Saez', 'Vega', '1992/08/08', 'HOM'),
    (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', '1991/03/28', 'HOM'),
    (4, '17105885A', 'Pedro', 'Heller', 'Pagac', '2000/10/05', 'HOM'),
    (6, '04233869Y', 'José', 'Koss', 'Bayer', '1998/01/28', 'HOM'),
    (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', '1999/05/24', 'HOM'),
    (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', '1996/11/21', 'HOM'),
    (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', '1997/04/26', 'HOM'),
    (19, '11578526G', 'Inma', 'Lakin', 'Yundt', '1998/09/01', 'MUJ'),
    (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', '1998/01/01', 'HOM'),
    (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', '1999/02/11', 'HOM'),
    (23, '64753215G', 'Irene', 'Hernández', 'Martínez', '1996/03/12', 'MUJ'),
    (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', '1995/04/13', 'MUJ');

INSERT INTO alumno_se_matricula_asignatura (alumno_codigo_alumno, asignatura_codigo_asignatura, codigo_curso_escolar)
VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 1),
    (1, 6, 1),
    (1, 7, 1),
    (1, 8, 1),
    (1, 9, 1),
    (1, 10, 1),
    (1, 1, 2),
    (1, 2, 2),
    (1, 3, 2),
    (1, 1, 3),
    (1, 2, 3),
    (1, 3, 3),
    (1, 1, 4),
    (1, 2, 4),
    (1, 3, 4),
    (2, 1, 1),
    (2, 2, 1),
    (2, 3, 1),
    (4, 1, 1),
    (4, 2, 1),
    (4, 3, 1),
    (4, 1, 2),
    (4, 2, 2),
    (4, 3, 2),
    (4, 4, 2),
    (4, 5, 2),
    (4, 6, 2),
    (4, 7, 2),
    (4, 8, 2),
    (4, 9, 2),
    (4, 10, 2);

INSERT INTO telefono_profesor (codigo_telefono_profesor, profesor_codigo_profesor, telefono_codigo_telefono)
VALUES
    ('1', 3, '12'),
    ('2', 5, '13'),
    ('3', 8, '14'),
    ('4', 10, '15'),
    ('5', 12, '16'),
    ('6', 13, '17'),
    ('7', 14, '18'),
    ('8', 15, '19'),
    ('9', 16, '20'),
    ('10', 17, '21'),
    ('11', 18, '22'),
    ('12', 20, '23'),
    ('13', 21, '24'),
    ('14', 22, '25'),
    ('15', 23, '26');

INSERT INTO telefono_alumno (codigo_telefono_alumno, alumno_codigo_alumno, telefono_codigo_telefono)
VALUES
    ('1', 1, '1'),
    ('2', 2, '2'),
    ('3', 4, '3'),
    ('4', 6, '4'),
    ('5', 7, '5'),
    ('6', 9, '6'),
    ('7', 11, '7'),
    ('8', 19, '8'),
    ('9', 21, '8'),
    ('10', 22, '9'),
    ('11', 23, '10'),
    ('12', 24, '11');

INSERT INTO direccion_profesor (codigo_direccion_profesor, profesor_codigo_profesor, direccion_codigo_direccion)
VALUES
    ('1', 3, '12'),
    ('2', 5, '13'),
    ('3', 8, '14'),
    ('4', 10, '15'),
    ('5', 12, '16'),
    ('6', 13, '17'),
    ('7', 14, '18'),
    ('8', 15, '19'),
    ('9', 16, '20'),
    ('10', 17, '21'),
    ('11', 18, '22'),
    ('12', 20, '23'),
    ('13', 21, '23'),
    ('14', 22, '23'),
    ('15', 23, '23');

INSERT INTO direccion_alumno (codigo_direccion_alumno, alumno_codigo_alumno, direccion_codigo_direccion)
VALUES
    ('1', 1, '1'),
    ('2', 2, '2'),
    ('3', 4, '3'),
    ('4', 6, '4'),
    ('5', 7, '5'),
    ('6', 9, '6'),
    ('7', 11, '7'),
    ('8', 19, '8'),
    ('9', 21, '9'),
    ('10', 22, '10'),
    ('11', 23, '11'),
    ('12', 24, '1');
```



#### Consultas SQL

##### Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

   ```sql
   
   ```

   

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

   ```sql
   
   ```

   

3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```sql
   
   ```

   

4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

   ```sql
   
   ```

   

5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```sql
   
   ```

   

##### Consultas multitabla (Composición interna)

1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   
   ```

   

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  
  ```

  

3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

  ```sql
  
  ```

  

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

  ```sql
  
  ```

  

5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  
  ```

  

6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

  ```sql
  
  ```

  

##### Consultas multitabla (Composición externa)

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

   ```sql
   
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento.

   ```sql
   
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

   ```sql
   
   ```

   

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

   ```sql
   
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   
   ```

   

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

   ```sql
   
   ```

   


##### Consultas resumen

1. Devuelve el número total de alumnas que hay.

   ```sql
   
   ```

   

2. Calcula cuántos alumnos nacieron en 1999.

   ```sql
   
   ```

   

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

   ```sql
   
   ```

   

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

   ```sql
   
   ```

   

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

   ```sql
   
   ```

   

6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

   ```sql
   
   ```

   

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.

   ```sql
   
   ```

   

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

   ```sql
   
   ```

   

9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

   ```sql
   
   ```

   


##### Subconsultas

1. Devuelve todos los datos del alumno más joven.

   ```sql
   
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento.

   ```sql
   
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

   ```sql
   
   ```

   

4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

   ```sql
   
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   
   ```

   

6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

   ```sql
   
   ```

   

#### Vistas

1. A

   ```sql
   
   ```

   

2. B

   ```sql
   
   ```

   

3. C

   ```sql
   
   ```

   

4. D

   ```sql
   
   ```

   

5. E

   ```sql
   
   ```

   

6. F

   ```sql
   
   ```

   

7. G

   ```sql
   
   ```

   

8. H

   ```sql
   
   ```

   

9. I

   ```sql
   
   ```

   

10. J

    ```sql
    
    ```

    

#### Procedimientos almacenados

1. A

   ```sql
   
   ```

   

2. B

   ```sql
   
   ```

   

3. C

   ```sql
   
   ```

   

4. D

   ```sql
   
   ```

   

5. E

   ```sql
   
   ```

   

6. F

   ```sql
   
   ```

   

7. G

   ```sql
   
   ```

   

8. H

   ```sql
   
   ```

   

9. I

   ```sql
   
   ```

   

10. J

    ```sql
    
    ```

