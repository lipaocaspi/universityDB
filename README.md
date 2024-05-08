# universityDB

#### Normalización

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
-- genero
-- -----------------------------------------------------
CREATE TABLE genero (
	codigo_genero VARCHAR(3) NOT NULL,
    nombre_genero VARCHAR(20) NOT NULL,
    CONSTRAINT PK_genero PRIMARY KEY (codigo_genero)
);

-- -----------------------------------------------------
-- tipo_telefono
-- -----------------------------------------------------
CREATE TABLE tipo_telefono (
	codigo_tipo VARCHAR(5) NOT NULL,
    nombre_tipo VARCHAR(20) NOT NULL,
    CONSTRAINT PK_tipo_telefono PRIMARY KEY (codigo_tipo)
);

-- -----------------------------------------------------
-- curso_escolar
-- -----------------------------------------------------
CREATE TABLE curso_escolar (
	codigo_curso_escolar INT NOT NULL,
    anyo_inicio YEAR(4) NOT NULL,
    anyo_fin YEAR(4) NOT NULL,
    CONSTRAINT PK_curso_escolar PRIMARY KEY (codigo_curso_escolar)
);

-- -----------------------------------------------------
-- grado
-- -----------------------------------------------------
CREATE TABLE grado (
	codigo_grado INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_grado PRIMARY KEY (codigo_grado)
);

-- -----------------------------------------------------
-- curso
-- -----------------------------------------------------
CREATE TABLE curso (
	codigo_curso INT NOT NULL,
    nombre_curso VARCHAR(50) NOT NULL,
    CONSTRAINT PK_curso PRIMARY KEY (codigo_curso)
);

-- -----------------------------------------------------
-- tipo_asignatura
-- -----------------------------------------------------
CREATE TABLE tipo_asignatura (
	codigo_tipo VARCHAR(5) NOT NULL,
    nombre_tipo VARCHAR(50) NOT NULL,
    CONSTRAINT PK_tipo_asignatura PRIMARY KEY (codigo_tipo)
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
    /* DIRECCIÓN */
    fecha_nacimiento DATE NOT NULL,
    codigo_genero VARCHAR(3) NOT NULL,
    codigo_departamento INT NOT NULL,
    CONSTRAINT PK_profesor PRIMARY KEY (codigo_profesor),
    /* FOREIGN KEY DIRECCIÓN */
    CONSTRAINT FK_genero_profesor
      FOREIGN KEY (codigo_genero)
      REFERENCES genero(codigo_genero),
    CONSTRAINT FK_departamento_profesor
      FOREIGN KEY (codigo_departamento)
      REFERENCES departamento(codigo_departamento)
);

--------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- telefono
-- -----------------------------------------------------
CREATE TABLE telefono (
	codigo_telefono VARCHAR(5) NOT NULL,
    numero_telefono VARCHAR(9) NOT NULL,
    CONSTRAINT PK_telefono PRIMARY KEY (codigo_telefono)
);
```

#### Inserción de datos

```sql

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

