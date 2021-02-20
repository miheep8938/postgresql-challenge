-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EBr9Ml
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "bith_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments_Employees" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

ALTER TABLE "Departments_Employees" ADD CONSTRAINT "fk_Departments_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("emp_title");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments_Employees" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments_Employees" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

