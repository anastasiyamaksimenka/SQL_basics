CREATE TABLE EMPLOYEE(
ID NUMBER CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
FIRSTNAME VARCHAR2(50) NOT NULL, 
SECONDNAME VARCHAR2(50),
SURNAME VARCHAR2(50) NOT NULL,
DATE_OF_BIRTH DATE NOT NULL,
SALARY NUMBER(8,2) NOT NULL CONSTRAINT EMPLOYEE_SALARY_CH CHECK(SALARY>50000)
);

INSERT INTO EMPLOYEE VALUES (1, 'John', 'Doe', 'Smith', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 60000.00);
INSERT INTO EMPLOYEE VALUES (2, 'Jane', 'Mary', 'Johnson', TO_DATE('1985-04-23', 'YYYY-MM-DD'), 75000.00);
INSERT INTO EMPLOYEE VALUES (3, 'Alice', 'Marie', 'Johnson', TO_DATE('1992-08-10', 'YYYY-MM-DD'), 55000.00);
INSERT INTO EMPLOYEE VALUES (4, 'Bob', 'Lee', 'Smith', TO_DATE('1988-12-05', 'YYYY-MM-DD'), 60000.00);
INSERT INTO EMPLOYEE VALUES (5, 'Eva', 'Grace', 'Taylor', TO_DATE('1995-03-18', 'YYYY-MM-DD'), 65000.00);

SELECT * FROM EMPLOYEE

SELECT * FROM EMPLOYEE
WHERE SALARY >=65000
ORDER BY SURNAME;

SELECT * FROM EMPLOYEE 
WHERE DATE_OF_BIRTH <= TO_DATE('1988-12-31', 'YYYY-MM-DD')
   OR DATE_OF_BIRTH >= TO_DATE('1995-01-01', 'YYYY-MM-DD');
 
CREATE TABLE BOOKS(
ID NUMBER PRIMARY KEY, 
BOOK_NAME VARCHAR2(100) NOT NULL,
PRICE NUMBER(7,2) NOT NULL, 
QUANTITY NUMBER NOT NULL,
AUTHOR VARCHAR2(100) NOT NULL,
STATUS VARCHAR2(50) NOT NULL
);

INSERT INTO BOOKS VALUES (1, 'The Great Gatsby', 15.99, 50, 'F. Scott Fitzgerald', 'Available');
INSERT INTO BOOKS VALUES (2, 'To Kill a Mockingbird', 12.50, 30, 'Harper Lee', 'Available');
INSERT INTO BOOKS VALUES (3, '1984', 10.75, 20, 'George Orwell', 'Available');
INSERT INTO BOOKS VALUES (4, 'Pride and Prejudice', 18.25, 40, 'Jane Austen', 'Available');
INSERT INTO BOOKS VALUES (5, 'The Catcher in the Rye', 14.99, 25, 'J.D. Salinger', 'Available');
INSERT INTO BOOKS VALUES (6, 'The Hobbit', 22.50, 15, 'J.R.R. Tolkien', 'Available');
INSERT INTO BOOKS VALUES (7, 'The Lord of the Rings', 30.00, 10, 'J.R.R. Tolkien', 'Available');
INSERT INTO BOOKS VALUES (8, 'Harry Potter and the Sorcerer''s Stone', 19.95, 35, 'J.K. Rowling', 'Available');
INSERT INTO BOOKS VALUES (9, 'The Da Vinci Code', 25.50, 18, 'Dan Brown', 'Available');
INSERT INTO BOOKS VALUES (10, 'The Hunger Games', 16.75, 22, 'Suzanne Collins', 'Available');

SELECT * FROM BOOKS ORDER BY PRICE;

SELECT SUM(PRICE), SUM(QUANTITY) FROM BOOKS;

SELECT BOOK_NAME, AUTHOR, PRICE,
CASE 
WHEN PRICE > 15 THEN 'COSTLY'
ELSE 'CHEAP'
END AS PRICE_CATEGORY
FROM BOOKS;

CREATE TABLE ARTISTS (
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT ARTISTS_PK PRIMARY KEY,
NAME VARCHAR2(100) NOT NULL,
COUNTRY VARCHAR2(50) NOT NULL,
GENER VARCHAR2(50) NOT NULL
);

INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Taylor Swift ',  'US ',  'Pop ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Led Zeppelin ',  'US ',  'Hard rock ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'ABBA ',  'Sweden ',  'Disco ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Queen ',  'UK ',  'Rock ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Celine Dion ',  'Canada ',  'Pop ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Meatloaf ',  'US ',  'Hard rock ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Garth Brooks ',  'US ',  'Country ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Shania Twain ',  'Canada ',  'Country ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Rihanna ',  'US ',  'Pop ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Guns N Roses ',  'US ',  'Hard rock ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Gloria Estefan ',  'US ',  'Pop ');
INSERT INTO ARTISTS (NAME, COUNTRY, GENER) VALUES ( 'Bob Marley ',  'Jamaica ',  'Reggae ');

CREATE TABLE SONGS(
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT SONGS_PK PRIMARY KEY,
ARTIST VARCHAR2(100) NOT NULL,
TITLE VARCHAR2(100) NOT NULL
);

INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Taylor Swift', 'Shake it off');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Rihanna', 'Stay');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Celine Dion', 'My heart will go on');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Celine Dion', 'A new day has come');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Shania Twain', 'Party for two');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Gloria Estefan', 'Conga');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Led Zeppelin', 'Stairway to heaven');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('ABBA', 'Mamma mia');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Queen', 'Bicycle Race');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Queen', 'Bohemian Rhapsody');
INSERT INTO SONGS(ARTIST, TITLE) VALUES ('Guns N Roses', 'Dont cry');

SELECT TITLE FROM SONGS WHERE ARTIST IN('Celine Dion');

SELECT TITLE FROM SONGS WHERE ARTIST IN(SELECT NAME FROM ARTISTS WHERE GENER IN('Pop'));

CREATE TABLE BOOKS (
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT BOOKS_PK PRIMARY KEY,
AUTHOR VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
words NUMBER NOT NULL
);

INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Philosophers Stone', 79944);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Chamber of Secrets', 85141);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Prisoner of Azkaban', 107253);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Goblet of Fire', 190637);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Order of the Phoenix', 257045);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Half-Blood Prince', 168923);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ('J.K. Rowling', 'Harry Potter and the Deathly Hallows', 197651);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ( 'J.R.R. Tolkien ',  'The Hobbit ', 95022);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ( 'J.R.R. Tolkien ',  'Fellowship of the Ring ', 177227);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ( 'J.R.R. Tolkien ',  'Two Towers ', 143436);
INSERT INTO BOOKS (AUTHOR, TITLE, WORDS) VALUES ( 'J.R.R. Tolkien ',  'Return of the King ', 134462);

SELECT AUTHOR, SUM(WORDS) "WORDS SUM"
FROM BOOKS
GROUP BY AUTHOR
HAVING SUM(WORDS)>100000;

SELECT AUTHOR, ROUND(AVG(WORDS),-1) "AVG WORDS"
FROM BOOKS
GROUP BY AUTHOR
HAVING AVG(WORDS)>15000;

CREATE TABLE GRADES(
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT GRADES_PK PRIMARY KEY,
NAME VARCHAR2(100) NOT NULL,
NUMBER_GRADE NUMBER NOT NULL,
FRACTION_COMPLETED REAL NOT NULL
);

INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('John Doe', 85, 0.75);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Jane Smith', 92, 0.90);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Bob Johnson', 78, 0.60);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Alice Williams', 95, 0.80);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Eva Taylor', 88, 0.70);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Chris Brown', 79, 0.65);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Olivia Davis', 94, 0.85);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Sam Robinson', 87, 0.75);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Emma Miller', 91, 0.95);
INSERT INTO GRADES (NAME, NUMBER_GRADE, FRACTION_COMPLETED) VALUES ('Daniel White', 83, 0.80);

SELECT NAME , NUMBER_GRADE, ROUND(FRACTION_COMPLETED*100) "PRECENT COMPLETED"
FROM GRADES;

SELECT COUNT(*) AS "NUMBER OF STUDENTS",
CASE 
WHEN ROUND(AVG(FRACTION_COMPLETED) * 100) > 90 THEN 'A'
WHEN ROUND(AVG(FRACTION_COMPLETED) * 100) > 80 THEN 'B'
WHEN ROUND(AVG(FRACTION_COMPLETED) * 100) > 70 THEN 'C'
ELSE 'F'
END AS "GRADE"
FROM GRADES
GROUP BY CASE 
WHEN ROUND(FRACTION_COMPLETED * 100) > 90 THEN 'A'
WHEN ROUND(FRACTION_COMPLETED * 100) > 80 THEN 'B'
WHEN ROUND(FRACTION_COMPLETED * 100) > 70 THEN 'C'
ELSE 'F'
END;

CREATE TABLE PERSONS(
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT PERSONS_PK PRIMARY KEY,
NAME VARCHAR2(100)NOT NULL, 
AGE NUMBER NOT NULL
);

INSERT INTO PERSONS (NAME, AGE) VALUES ('Bobby McBobbyFace', 12);
INSERT INTO PERSONS (NAME, AGE) VALUES ('Lucy BoBucie', 25);
INSERT INTO PERSONS (NAME, AGE) VALUES ('Banana FoFanna', 14);
INSERT INTO PERSONS (NAME, AGE) VALUES ('Shish Kabob', 20);
INSERT INTO PERSONS (NAME, AGE) VALUES ('Fluffy Sparkles', 8);
INSERT INTO PERSONS (name,age) VALUES ('Ragzz',24);

CREATE table HOBBIES (
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT HOBBIES_PK PRIMARY KEY,
PERSON_ID NUMBER NOT NULL,
NAME VARCHAR2(50) NOT NULL
);

INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (1, 'drawing');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (1, 'coding');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (2, 'dancing');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (2, 'coding');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (3, 'skating');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (3, 'rowing');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (3, 'drawing');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (4, 'coding');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (4, 'dilly-dallying');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (4, 'meowing');
INSERT INTO HOBBIES (PERSON_ID, NAME) VALUES (5,'talking');

SELECT PERSONS.NAME, HOBBIES.NAME FROM PERSONS JOIN HOBBIES ON PERSONS.ID=HOBBIES.PERSON_ID;

SELECT PERSONS.NAME, HOBBIES.NAME FROM PERSONS JOIN HOBBIES ON PERSONS.ID=HOBBIES.PERSON_ID WHERE PERSONS.NAME IN ('Bobby McBobbyFace');

SELECT PERSONS.NAME, PERSONS.AGE, HOBBIES.NAME FROM PERSONS LEFT OUTER JOIN HOBBIES ON PERSONS.ID=HOBBIES.PERSON_ID;

SELECT PERSONS.NAME, PERSONS.AGE, COUNT(HOBBIES.NAME)
FROM PERSONS
LEFT OUTER JOIN HOBBIES ON PERSONS.ID = HOBBIES.PERSON_ID
GROUP BY PERSONS.NAME, PERSONS.AGE;

CREATE TABLE FRIENDS (
ID NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT FRIENDS_PK PRIMARY KEY,
PRESON1_ID NUMBER,
PRESON2_ID NUMBER);

INSERT INTO FRIENDS (PRESON1_ID, PRESON2_ID) VALUES (1, 4);
INSERT INTO FRIENDS (PRESON1_ID, PRESON2_ID) VALUES (2, 3);

SELECT PERSONS.NAME, HOBBIES.NAME FROM PERSONS
JOIN HOBBIES ON PERSONS.ID = HOBBIES.PERSON_ID;

SELECT A.NAME AS PERSON1_NAME, B.NAME AS PERSON2_NAME
FROM FRIENDS
JOIN PERSONS A ON FRIENDS.PERSON1_ID = A.ID
JOIN PERSONS B ON FRIENDS.PERSON2_ID = B.ID;

/*
CREATE TABLE EMPLOYEE(
ID NUMBER CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
FIRSTNAME VARCHAR2(50) NOT NULL, 
SECONDNAME VARCHAR2(50),
SURNAME VARCHAR2(50) NOT NULL,
DATE_OF_BIRTH DATE NOT NULL,
SALARY NUMBER(8,2) NOT NULL CONSTRAINT EMPLOYEE_SALARY_CH CHECK(SALARY>50000)
);

INSERT INTO EMPLOYEE VALUES (1, 'John', 'Doe', 'Smith', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 60000.00);
INSERT INTO EMPLOYEE VALUES (2, 'Jane', 'Mary', 'Johnson', TO_DATE('1985-04-23', 'YYYY-MM-DD'), 75000.00);
INSERT INTO EMPLOYEE VALUES (3, 'Alice', 'Marie', 'Johnson', TO_DATE('1992-08-10', 'YYYY-MM-DD'), 55000.00);
INSERT INTO EMPLOYEE VALUES (4, 'Bob', 'Lee', 'Smith', TO_DATE('1988-12-05', 'YYYY-MM-DD'), 60000.00);
INSERT INTO EMPLOYEE VALUES (5, 'Eva', 'Grace', 'Taylor', TO_DATE('1995-03-18', 'YYYY-MM-DD'), 65000.00);
*/

SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET FIRSTNAME='Anna' WHERE ID =1;
UPDATE EMPLOYEE SET SURNAME='Whithous' WHERE ID =4;

SELECT * FROM EMPLOYEE;

DELETE FROM EMPLOYEE WHERE FIRSTNAME='Eva';

SELECT * FROM EMPLOYEE;

ALTER TABLE EMPLOYEE ADD WORKING_YEARS NUMBER;

SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET WORKING_YEARS= 3 WHERE ID=1;
UPDATE EMPLOYEE SET WORKING_YEARS= 1 WHERE ID=2;
UPDATE EMPLOYEE SET WORKING_YEARS= 6 WHERE ID=3;
UPDATE EMPLOYEE SET WORKING_YEARS= 10 WHERE ID=4;

SELECT * FROM EMPLOYEE;