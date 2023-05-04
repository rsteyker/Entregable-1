/*
- GENERACIÓN DE DIAGRAM
*/

Table users {
  id int [pk, increment]
  name varchar(30) [not null]
  email varchar(40) [not null]
  password varchar(255) [not null]
}

Table users_rol {
  id int [pk, increment]
  user_id int [not null]
  rol_id  int [not null]
}

Table roles {
  id int [pk, increment]
  name varchar(40) [not null]
}

/*
 Un usuario puede tener uno o muchos roles ->M
 un rol puede tener uno o varios usuarios -> M
*/

Table course {
  id int [pk, increment]
  title varchar(80) [not null]
  description varchar(255) [not null]
  duration int [not null]
  price decimal(11,2) [not null]
  level_id int [not null]

}

Table users_courses {
  id int [pk, increment]
  fecha date [not null]
  course_id int [not null]
  user_id int [not null]
}

/*
- Un usuario puede tener uno o varios cursos -> M
- Un curso puede pertenecer a uno o varios usuarios -> M
*/

Table levels {
  id int [pk, increment]
  name varchar(40) [not null]
  number int [not null]
}

/*
- Un curso puede tener uno o muchos niveles -> 1
- Un nivel solo puede pertenecer a uno o varios cursos -> M 
*/

Table course_videos {
  id int [pk, increment]
  title varchar(80) [not null]
  url varchar(255) [not null]
  course_id int [not null]
}

/*
- Un curso puede tener uno o muchos videos -> 1
- Un video debe pertenecer a uno o varios cursos -> 1
*/

Table categories {
  id int [pk, increment]
  name varchar(40) [not null]
}

Table course_categories {
  id int [pk, increment]
  course_id int [not null]
  categorie_id int [not null]
}

/*
-Un curso puede pertenecer a uno o muchas categorías -> M
-Una categoría puede pertenecer a uno o muchos cursos -> M
*/


Ref: "users"."id" < "users_rol"."user_id"

Ref: "roles"."id" < "users_rol"."rol_id"

Ref: "users"."id" < "users_courses"."user_id"

Ref: "course"."id" < "users_courses"."course_id"

Ref: "course"."id" < "course_categories"."course_id"

Ref: "categories"."id" < "course_categories"."categorie_id"

Ref: "course"."id" < "course_videos"."id"

Ref: "levels"."id" < "course"."level_id"

/*
- INSERTAR VALORES A LA TABLA DE ROLES
*/

INSERT INTO login (name) VALUES ('students', 'teacher', 'admin');

/*
- INSERTAR VALORES A LA TABLA DE USERS
*/
 INSERT INTO users (name, email, password) VALUES ('Juan Castro'), ('juancastro@gmail.com'), ('juan2023')
 INSERT INTO users (name, email, password) VALUES ('Luis Casas'), ('luiscasas@gmail.com'), ('luis2023')

/*
- INSERTAR VALORES A LA TABLA DE USERS_ROL
*/
INSERT INTO users_rol (user_id, rol_id) VALUES (1, 1), (2, 2);

/*
- INSERTAR VALORES A LA TABLA DE LEVEL
*/
INSERT INTO levels (name, number) VALUES ('Beginner', 1), ('Intermediate', 2), ('Advanced', 3);

/*
- INSERTAR VALORES A LA TABLA DE COURSE
*/
INSERT INTO course (title, description, duration, price, level_id ) 
VALUES ('Fundamentos de programación', 'Aprenderas las bases de HTML, CSS y JS', 30, 50, 1);

INSERT INTO course (title, description, duration, price, level_id ) 
VALUES ('Frontend con react', 'Aprenderas las bases de react', 30, 100, 2);

/*
- INSERTAR VALORES A LA TABLA DE USERS_COURSES
*/
INSERT INTO users_courses (fecha, course_id, user_id) VALUES ('2023/05/04', 1, 1);

INSERT INTO users_courses (fecha, course_id, user_id) VALUES ('2023/05/04', 2, 2);

/*
- INSERTAR VALORES A LA TABLA DE COURSE_VIDEOS
*/
INSERT INTO course_videos (title, url, course_id) VALUES ('Primeros pasos en JS', 'url1', 1);

INSERT INTO course_videos (title, url, course_id) VALUES ('Primeros pasos en HTML', 'url2', 1);

/*
- INSERTAR VALORES A LA TABLA DE CATEGORIES
*/
INSERT INTO categories (name) VALUES ('Programación', 'Marketing', 'Diseño Gráfico');

/*
- INSERTAR VALORES A LA TABLA DE COURSE_CATEGORIES
*/
INSERT INTO course_categories (course_id, categorie_id) VALUES (1, 1), (2, 2);



















