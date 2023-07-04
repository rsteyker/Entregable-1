CREATE TABLE "usuarios" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "firstname" varchar(30) NOT NULL,
  "lastname" varchar(30),
  "email" varchar(50) UNIQUE NOT NULL,
  "password" varchar(50) NOT NULL,
  "age" int,
  "rol_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "level_id" int NOT NULL,
  "teacher" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "users_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  "student" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category" varchar(50) NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "rol" varchar(50) NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level" varchar(50) NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "usuarios" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("student") REFERENCES "usuarios" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "usuarios" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");


/** INSERATR VALORES A LAS TABLAS **/

-- roles
INSERT INTO roles (rol) VALUES ('student'), ('teacher'), ('admin');

--usuarios
INSERT INTO usuarios (firstname, lastname, email, password, age, rol_id) 
VALUES ('Katherin', 'Apaza', 'kate@gmail.com', '1234', 25, 2), 
       ('Alicia', 'Carranza', 'ale@gmail.com', '1234', 23, 1), 
       ('Luis', 'Casas', 'luis@gmail.com', '1234', 25, 1), 
       ('Robert', 'Marchino', 'rmarchino@gmail.com', '1234', 27, 3);

--categories
INSERT INTO categories (category) VALUES ('Aplicacion web statica'), 
                                         ('Aplicacion web dinamica'), 
                                         ('Tienda virtual o E-Comerce');

--levels
INSERT INTO levels (level) VALUES ('beginners'), ('intermediante'), ('advanced');

-- courses
INSERT INTO courses (title, description, level_id, teacher, category_id) VALUES 
            ('Desarrollo web completo', 'HTML, CSS, JS, React, Node y Express', 3, 2, 3);

INSERT INTO courses (title, description, level_id, teacher, category_id) VALUES 
            ('Fundamentos de programación', 'HTML, CSS, JS', 1, 2, 1);

--course_videos
INSERT INTO courses_videos (title, url, course_id) VALUES ('Video grabado Desarrollo web completo', 'url1', 1);

--users_courses
INSERT INTO  users_courses (student, course_id) VALUES (1, 1), (1, 2);




