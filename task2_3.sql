CREATE TYPE grade_type AS ENUM ('junior', 'middle', 'seniaor');
CREATE TYPE score_type AS ENUM ('A', 'B', 'C', 'D', 'E');


CREATE TABLE IF NOT EXISTS employees (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    surname VARCHAR (255) NOT NULL,
    birthdate DATE NOT NULL,
    start_date DATE NOT NULL,
    grade grade_type NOT NULL,
    salary INT,
    department_id INT,
    driver_license BOOLEAN,
    CONSTRAINT department_fk
        FOREIGN KEY (department_id)
        REFERENCES departments(id)
        ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS departments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    director_name VARCHAR (255),
    employee_count SMALLINT
)

CREATE TABLE IF NOT EXISTS scores (
    employee_id INT PRIMARY KEY,
    q1 score_type,
    q2 score_type,
    q3 score_type,
    q4 score_type,
    CONSTRAINT employee_fk
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
        ON DELETE CASCADE
)

INSERT INTO departments (
    name,
    director_name,
    employee_count
)
VALUES
    ('IT', 'Petrov', 2),
    ('DA', 'Ivanova', 3);

INSERT INTO employees (
    surname,
    birthdate,
    start_date,
    grade,
    salary,
    department_id,
    driver_license
)
VALUES
    ('Petrov', '1992-01-21', '2015-06-01', 'senior', 120000, 1, True),
    ('Gribanov', '1996-06-12', '2018-03-15', 'middle', 90000, 1, True),
    ('Sidorov', '2000-02-01', '2021-06-15', 'junior', 60000, 2, False),
    ('Ivanova', '1993-07-21', '2017-04-15', 'middle', 110000, 2, True),
    ('Kruglik', '1997-03-19', '2019-12-01', 'junior', 70000, 2, True);

INSERT INTO departments (
    name,
    director_name,
    employee_count
)
VALUES
    ('intelligent DA', 'Grigoriev', 3);

INSERT INTO employees (
    surname,
    birthdate,
    start_date,
    grade,
    salary,
    department_id,
    driver_license
)
VALUES
    ('Grigoriev', '1991-02-28', '2022-12-01', 'senior', 120000, 3, True),
    ('Glinka', '1993-11-21', '2022-12-01', 'middle', 100000, 3, False),
    ('Neglinka', '1995-09-29', '2022-12-01', 'middle', 100000, 3, False);

INSERT INTO scores (
    employee_id,
    q1,
    q2,
    q3,
    q4
)
VALUES
    (1, 'A', 'A', 'A', 'A'),
    (2, 'B', 'B', 'A', 'B'),
    (3, 'D', 'A', 'D', 'B'),
    (4, 'E', 'D', 'B', 'C'),
    (5, 'A', 'A', 'C', 'A');

SELECT id, surname, start_date FROM employees e;

SELECT id, surname, start_date FROM employees e limit 3;

SELECT id FROM employees e WHERE driver_license = True;

SELECT employee_id FROM scores s WHERE q1 = 'D' or q1 = 'E' or q2 = 'D' or q2 = 'E' or q3 = 'D' or q3 = 'E' or q4 = 'D' or q4 = 'E';

SELECT MAX(salary) FROM employees e;

SELECT name FROM departments WHERE employee_count IN (SELECT MAX(employee_count) FROM departments);

SELECT id FROM employees ORDER BY start_date;
