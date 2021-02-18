-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EBr9Ml
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "employee_number" INT   NOT NULL,
    "employee_title" VARCHAR   NOT NULL,
    "bith_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_number"
     )
);

SELECT *
FROM "Employees";

CREATE TABLE "Departments_Employees" (
    "dept_number" VARCHAR   NOT NULL,
    "employee_number" INT   NOT NULL,
    CONSTRAINT "pk_Departments_Employees" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "employee_number" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_number" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "employee_number" INT   NOT NULL,
    "dept_number" VARCHAR   NOT NULL
);

ALTER TABLE "Departments_Employees" ADD CONSTRAINT "fk_Departments_Employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("employee_title");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments_Employees" ("dept_number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments_Employees" ("dept_number");

----------------------------------------------------------------------------------

-- Question Number 1: List the following details of each employee: employee number, last name, first name, sex, and salary
