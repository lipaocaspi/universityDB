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