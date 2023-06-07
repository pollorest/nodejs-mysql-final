mysql -u root -p

create database bdproyectofinal;

use bdproyectofinal;

CREATE TABLE Usuario (
Id int NOT NULL PRIMARY KEY,
Nombre VARCHAR(50),
Contraseña VARCHAR(20),
Email VARCHAR(40),
Genero VARCHAR(20),
Id_nodo INT NOT NULL,
Cuenta_bancaria NUMERIC (20,0),
Categoria VARCHAR (30)
);

CREATE TABLE Administrador (
Identificador INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(50),
Contraseña VARCHAR(20),
Email VARCHAR(25),
Genero VARCHAR(15),
Id INT NOT NULL,
Id_usuario INT NOT NULL,
FOREIGN KEY (Id_usuario) REFERENCES Usuario(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Profesor (
Id int NOT NULL PRIMARY KEY,
Nombre VARCHAR(50),
Contraseña VARCHAR(20),
Telefono NUMERIC (10,0),
Email VARCHAR (40),
Area_principal VARCHAR(30),
Area_alternativa VARCHAR(30),
Id_usuario INT NOT NULL,
Identificador INT NOT NULL,
FOREIGN KEY (Id_usuario) REFERENCES Usuario(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (Identificador) REFERENCES Administrador(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Cursos (
Categoria VARCHAR(20),
fecha_inicio VARCHAR(30),
fecha_creacion VARCHAR(10),
fecha_fin VARCHAR(10),
Precio INT,
Semestre INT,
Nombre VARCHAR(50),
Identificador INT NOT NULL PRIMARY KEY,
Id INT NOT NULL,
Url VARCHAR(60),
FOREIGN KEY (Id) REFERENCES Profesor(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Estudiante (
Id INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(50),
Contraseña VARCHAR(20),
Email VARCHAR(25),
Genero VARCHAR(15),
Id_usuario INT NOT NULL,
FOREIGN KEY (Id_usuario) REFERENCES Usuario(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Materiales (
Identificador INT NOT NULL PRIMARY KEY,
Archivos INT,
Descripcion VARCHAR(40),
Titulo VARCHAR(100),
Id INT NOT NULL,
FOREIGN KEY (Id) REFERENCES Profesor(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Tareas (
Identificador INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(30),
Descripcion VARCHAR(70),
fecha_creacion DATE,
fecha_entrega DATE,
Puntaje FLOAT,
archivo_estudiante INT,
Id INT NOT NULL,
FOREIGN KEY (Id) REFERENCES Profesor(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Foro (
Identificador INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(30),
Descripcion VARCHAR(70),
fecha_creacion DATE,
fecha_terminacion DATE,
Id INT NOT NULL,
FOREIGN KEY (Id) REFERENCES Profesor(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Mensaje (
Identificador INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(30),
Descripcion VARCHAR (70),
Id_mensaje INT NOT NULL,
Identificador_foro INT NOT NULL,
FOREIGN KEY (Identificador_foro) REFERENCES Foro(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Tiene (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Estudiante(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Tareas(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Pertenece (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Estudiante(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Cursos(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Dispone (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Estudiante(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Materiales(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Participa (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Estudiante(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Foro(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Matricula (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Estudiante(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Administrador(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Interes (
Id INT NOT NULL,
Identificador INT NOT NULL,
PRIMARY KEY(Id, Identificador),
FOREIGN KEY (Id) REFERENCES Profesor(Id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (Identificador) REFERENCES Cursos(Identificador)
  ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Usuario (Id,Nombre,Contraseña,Email,Genero,Id_nodo,Cuenta_bancaria,Categoria) VALUES (001234,"Juan David","Jd_054321","jdavid12@gmail.com","Masculino",10210,0012362830851,"Ingenieria de procesos");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (005678, "Luisa Marcela", "L_marce103721", "luisamar33@yahoo.com", "Femenino", 11629, 0712562890853, "Administracion de empresas");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (007295, "Juan Camilo", "@Juanca51200", "jcamilo2212@hotmail.com", "Masculino", 12861, 0212262839057, "Ingenieria de procesos");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (006941, "Jhon Jairo", "1006217399", "jhjairo11@gmail.com", "Masculino", 11281, 021236583041, "Negocios internacionales");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (001266, "Luis Ernesto", "1006217399", "lernesto79@hotmail.com", "Masculino", 104924, 0779984020, "Ing de Sistemas");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (005448, "Martin Alvarez", "zzek1o3", "malvarez21@gmail.com", "Masculino", 145321, 02149029945, "Mercadeo");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (007200, "Juliana Toro", "lfffp000", "jtoro991@yahoo.com", "Femenino", 15531, 00094288424, "Psicologia");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (009295, "Mariana Castro", "1234567890",  "maricastr028@hotmail.com", "Femenino", 15021, 021434920424, "Admin de Negocios");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (0055063, "Andrea Alvarez", "@Andreal01",  "aalvarez21@gmail.com", "Femenino", 15021, 021434920424, "Matematicas");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (006503, "Mauricio Restrepo", "MauriRestrep88.",   "mauricrestrep028@gmail.com", "Masculino", 15021, 021434920424, "Computacion");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (010943, "Camilo Alberto","CAlberto205_00", "camiloalb55@hotmail.com", "Masculino", 15021, 021434920424, "Matematicas");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (000972, "Maria Angel","@Mangel71802.",  "mariangel441@yahoo.com", "Femenino", 15021, 021434920424, "Fisica");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (009842, "Mariana Suarez","#Marisuar7287",  "mariangel441@yahoo.com", "Femenino", 15021, 021434920424, "Fisica");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (0111092, "Jacobo Arias","$JacoArias2112",  "mariangel441@yahoo.com", "Femenino", 15021, 021434920424, "Fisica");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (007005, "Juan David Muñoz","/JuanDam100",  "mariangel441@yahoo.com", "Femenino", 15021, 021434920424, "Fisica");
INSERT INTO Usuario (Id, Nombre, Contraseña, Email, Genero, Id_nodo, Cuenta_bancaria, Categoria) VALUES (0022093, "Daniela Franco","@DanielaFranc0127",  "mariangel441@yahoo.com", "Femenino", 15021, 021434920424, "Fisica");

INSERT INTO Administrador (Identificador, Nombre, Contraseña, Email, Genero, Id, Id_usuario) VALUES (003670, "Luis Ernesto", "#Leo38409", "lernesto79@hotmail.com", "Masculino", 23751, 001266);
INSERT INTO Administrador (Identificador, Nombre, Contraseña, Email, Genero, Id, Id_usuario) VALUES (173621, "Martin Alvarez", "Malva173_", "malvarez21@gmail.com", "Masculino", 52909, 005448);
INSERT INTO Administrador (Identificador, Nombre, Contraseña, Email, Genero, Id, Id_usuario) VALUES (234789, "Juliana Toro", "JuliTor021.", "jtoro991@yahoo.com", "Femenino", 12762, 007200);
INSERT INTO Administrador (Identificador, Nombre, Contraseña, Email, Genero, Id, Id_usuario) VALUES (360256, "Mariana Castro", "Mcastr033_", "maricastr028@hotmail.com", "Femenino", 17052, 009295);

INSERT INTO Profesor (Id, Nombre, Contraseña, Telefono, Email, Area_principal, Area_alternativa, Id_usuario, Identificador) VALUES (007490, "Andrea Alvarez", "@Andreal01", 3007120538, "aalvarez21@gmail.com", "Matemáticas", "Algebra lineal", 0055063, 003670);
INSERT INTO Profesor (Id, Nombre, Contraseña, Telefono, Email, Area_principal, Area_alternativa, Id_usuario, Identificador) VALUES (052716, "Mauricio Restrepo", "MauriRestrep88.", 3125570221, "mauricrestrep028@gmail.com", "Programación", "Lenguajes de programación", 006503, 173621);
INSERT INTO Profesor (Id, Nombre, Contraseña, Telefono, Email, Area_principal, Area_alternativa, Id_usuario, Identificador) VALUES (031884, "Camilo Alberto", "CAlberto205_00", 3144070271, "camiloalb55@hotmail.com", "Leyes", "Derecho Penal", 010943, 234789);
INSERT INTO Profesor (Id, Nombre, Contraseña, Telefono, Email, Area_principal, Area_alternativa, Id_usuario, Identificador) VALUES (123765, "Maria Angel", "@Mangel71802.", 3105207504, "mariangel441@yahoo.com", "Economia", "Macroeconomia", 000972, 360256);

INSERT INTO Cursos (Categoria, fecha_inicio, fecha_creacion, fecha_fin, Precio, Semestre, Nombre, Identificador, Id, Url) VALUES ("Computacion", "2023-04-18", "2022-07-21", "2024-03-14", 1200000, 4, "Bases de datos", 007742, 052716, "https://www.basesdedatos.com.co");
INSERT INTO Cursos (Categoria, fecha_inicio, fecha_creacion, fecha_fin, Precio, Semestre, Nombre, Identificador, Id, Url) VALUES ("Matematicas", "2023-09-12", "2022-03-12", "2024-07-30", 1600000, 1, "Lenguajes Formales y Compiladores", 052716, 007490, "https://www.lenguajesfyc.com");
INSERT INTO Cursos (Categoria, fecha_inicio, fecha_creacion, fecha_fin, Precio, Semestre, Nombre, Identificador, Id, Url) VALUES ("Derecho", "2023-02-06", "2022-01-25", "2024-02-14", 2500000, 6, "Introducción al Derecho", 003871, 031884, "https://www.introalderecho.co");
INSERT INTO Cursos (Categoria, fecha_inicio, fecha_creacion, fecha_fin, Precio, Semestre, Nombre, Identificador, Id, Url) VALUES ("Admin de Negocios", "2023-05-22", "2022-08-27", "2024-10-13", 499000, 3, "Macroeconomía", 007456, 123765, "https://www.macroecono.com.co");

INSERT INTO Estudiante (Id, Nombre, Contraseña, Email, Genero, Id_usuario) VALUES (005136, "Mariana Suarez", "#Marisuar7287", "msuarez73@hotmail.com", "Femenino", 009842);
INSERT INTO Estudiante (Id, Nombre, Contraseña, Email, Genero, Id_usuario) VALUES (016134, "Jacobo Arias", "$JacoArias2112", "jarias88@hotmail.com", "Masculino", 0111092);
INSERT INTO Estudiante (Id, Nombre, Contraseña, Email, Genero, Id_usuario) VALUES (015128, "Juan David Muñoz", "/JuanDam100", "juandamuñoz513@gmail.com", "Masculino", 007005);
INSERT INTO Estudiante (Id, Nombre, Contraseña, Email, Genero, Id_usuario) VALUES (028709, "Daniela Franco", "@DanielaFranc0127", "danifranc094@gmail.com", "Femenino", 0022093);

INSERT INTO Materiales (Identificador, Archivos, Descripcion, Titulo, Id) VALUES (005129, 7, "Cajas y equipos nuevos", "Metales, objetos pesados y valiosos", 007490);
INSERT INTO Materiales (Identificador, Archivos, Descripcion, Titulo, Id) VALUES (016617, 3, "Ladrillos", "Destinados para construcciones", 052716);
INSERT INTO Materiales (Identificador, Archivos, Descripcion, Titulo, Id) VALUES (024390, 9, "Sillas, equipos nuevos y demás objetos", "Todos para salones de computo ya que se requiere mejorar ciertas aulas", 031884);
INSERT INTO Materiales (Identificador, Archivos, Descripcion, Titulo, Id) VALUES (032288, 5, "Pintura", "Ubicarla donde es debido y destinarla para futuros trabajos", 123765);


INSERT INTO Tareas (Identificador, Nombre, Descripcion, fecha_creacion, fecha_entrega, Puntaje, archivo_estudiante, Id) VALUES (1000345, "Lectura Libro", "Terminar libro del curso para socializarlo con la clase", '2020-07-12', '2020-07-25', 4.5, 01,007490 );
INSERT INTO Tareas (Identificador, Nombre, Descripcion, fecha_creacion, fecha_entrega, Puntaje, archivo_estudiante, Id) VALUES (1000911, "Descargar MongoDB", "Descargar Mongo local y Atlas", '2023-05-01', '2023-05-05', 5.0, 02,052716);
INSERT INTO Tareas (Identificador, Nombre, Descripcion, fecha_creacion, fecha_entrega, Puntaje, archivo_estudiante, Id) VALUES (1000822, "Maqueta hogar", "Hacer maqueta que replique su vivienda", '2022-03-11', '2022-04-02', 3.2, 03,031884);
INSERT INTO Tareas (Identificador, Nombre, Descripcion, fecha_creacion, fecha_entrega, Puntaje, archivo_estudiante, Id) VALUES (1000756, "Ensayo racismo", "Hacer un ensayo dando su opinion sobre el tema", '2021-08-20', '2021-08-29', 2.9, 04,123765);

INSERT INTO Foro (Identificador, Nombre, Descripcion, fecha_creacion, fecha_terminacion, Id) VALUES (1001440, "Los Viajeros", "Foro sobre viajes para conocer al mundo", '2021-02-10', '2021-04-01',007490);
INSERT INTO Foro (Identificador, Nombre, Descripcion, fecha_creacion, fecha_terminacion, Id) VALUES (1001502, "El lado oscura de la luna", "Hablaremos sobre teorias conspirativas", '2022-10-24', '2021-11-03',052716);
INSERT INTO Foro (Identificador, Nombre, Descripcion, fecha_creacion, fecha_terminacion, Id) VALUES (1001623, "La fosa de las marianas", "¿Que falta por conocer de las profundidades?", '2023-01-30', '2021-03-21',031884);
INSERT INTO Foro (Identificador, Nombre, Descripcion, fecha_creacion, fecha_terminacion, Id) VALUES (1001799, "Los Viajeros", "Foro sobre viajes para conocer al mundo", '2021-02-10', '2021-04-01',123765);

INSERT INTO Mensaje (Identificador, Nombre, Descripcion, Id_mensaje, Identificador_foro) VALUES (1002560, "Anuncio parroquial", "Traer plata para el refrigerio", 220133, 1001440);
INSERT INTO Mensaje (Identificador, Nombre, Descripcion, Id_mensaje, Identificador_foro) VALUES (1002098, "Dia de las madres", "Haremos una actividad en madera a sus mamas", 234378, 1001502);
INSERT INTO Mensaje (Identificador, Nombre, Descripcion, Id_mensaje, Identificador_foro) VALUES (1002123, "Salida pedagogica", "Nos vemos en la noche en la terminal", 218880, 1001623);
INSERT INTO Mensaje (Identificador, Nombre, Descripcion, Id_mensaje, Identificador_foro) VALUES (1002788, "Reposicion de clase", "La clase se repondra el martes", 276653, 1001799);


INSERT INTO Tiene (Id, Identificador)  VALUES (005136,1000345); #estudiante tareas
INSERT INTO Tiene (Id, Identificador)  VALUES (016134, 1000911);
INSERT INTO Tiene (Id, Identificador)  VALUES (015128, 1000822);
INSERT INTO Tiene (Id, Identificador)  VALUES (028709, 1000756);

INSERT INTO Pertenece (Id, Identificador) VALUES (005136, 007742); #estudiante cursos
INSERT INTO Pertenece (Id, Identificador) VALUES (016134, 052716);
INSERT INTO Pertenece (Id, Identificador) VALUES (015128, 003871);
INSERT INTO Pertenece (Id, Identificador) VALUES (028709, 007456);


INSERT INTO Dispone(Id,Identificador) VALUES(005136,005129); #estudiantes-materiales
INSERT INTO Dispone(Id,Identificador) VALUES(028709,024390); #estudiantes-materiales
INSERT INTO Dispone(Id,Identificador) VALUES(016134,016617); #estudiantes-materiales
INSERT INTO Dispone(Id,Identificador) VALUES(015128,032288); #estudiantes-materiales


INSERT INTO Participa(Id,Identificador) VALUES(005136,1001623); #estudiante-foro
INSERT INTO Participa(Id,Identificador) VALUES(028709,1001799); #estudiante-foro
INSERT INTO Participa(Id,Identificador) VALUES(016134,1001440); #estudiante-foro
INSERT INTO Participa(Id,Identificador) VALUES(015128,1001502); #estudiante-foro

INSERT INTO Matricula(Id,Identificador) VALUES(016134,173621); #estudiante-administrador
INSERT INTO Matricula(Id,Identificador) VALUES(015128,360256); #estudiante-administrador
INSERT INTO Matricula(Id,Identificador) VALUES(005136,003670); #estudiante-administrador
INSERT INTO Matricula(Id,Identificador) VALUES(028709,234789); #estudiante-administrador

INSERT INTO Interes(Id,Identificador) VALUES(052716,007742); #profesor-cursos
INSERT INTO Interes(Id,Identificador) VALUES(007490,052716); #profesor-cursos
INSERT INTO Interes(Id,Identificador) VALUES(031884,003871); #profesor-cursos
INSERT INTO Interes(Id,Identificador) VALUES(123765,007456); #profesor-cursos