-- Data Engineering 

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
--------------------------------------------
-- Print each file
SELECT *
FROM "Employees";

SELECT *
FROM "Departments_Employees"; 

SELECT *
FROM "Titles"

SELECT * 
FROM "Salaries"

SELECT *
FROM "Departments"

SELECT *
FROM "Department_Manager"
-------------------------------------------------------------
-- Data Analysis

-- 1. List the following details of each employee: 
	-- employee number, last name, first name, sex, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.sex, "Salaries".salary
	FROM "Employees" AS E
	INNER JOIN "Salaries" ON E.emp_no = "Salaries".emp_no;


-- 2. List first name, last name, and hire date 
	-- for employees who were hired in 1986.
SELECT E.last_name, E.first_name, E.hire_date 
FROM "Employees" E
	WHERE hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
	-- department number, department name, the manager's employee number, 
	-- last name, first name.
SELECT DM.dept_no, DM.emp_no, "Departments".dept_name, "Employees".emp_no, "Employees".last_name, "Employees".first_name
	FROM "Department_Manager" AS DM
	INNER JOIN "Departments" ON DM.dept_no = "Departments".dept_no
	INNER JOIN "Employees" ON "Employees".emp_no = DM.emp_no; 
	

-- 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
SELECT E.emp_no,E.last_name, E.first_name, "Departments".dept_name, "Departments_Employees".dept_no
	FROM "Employees" AS E
	INNER JOIN "Departments_Employees" ON E.emp_no = "Departments_Employees".emp_no
	LEFT JOIN "Departments" ON "Departments".dept_no = "Departments_Employees".dept_no;

-- 5. List first name, last name, and sex for employees whose 
	-- first name is "Hercules" and last names begin with "B."
SELECT last_name,first_name, sex FROM "Employees"
	WHERE first_name = 'Heracule'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including 
	-- their employee number, last name, first name, and department name.
SELECT E.emp_no,E.last_name, E.first_name, D.dept_name
FROM "Departments_Employees" DE
INNER JOIN "Employees" E ON E.emp_no = DE.emp_no
INNER JOIN "Departments" D ON DE.dept_no = D.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including 
	-- their employee number, last name, first name, and department name.
SELECT E.emp_no,E.last_name, E.first_name, D.dept_name
FROM "Departments_Employees" DE
INNER JOIN "Employees" E ON E.emp_no = DE.emp_no
INNER JOIN "Departments" D ON DE.dept_no = D.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
	-- i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS "total_last_names" From "Employees"
GROUP BY last_name
ORDER BY "total_last_names" DESC; 


-- Check for myself if the numbers are correct 
	-- (Used the most frequent last name in the list, 'Baba')
SELECT last_name From "Employees"
WHERE last_name = 'Baba';

-- Count 'Baba' 
SELECT COUNT(last_name) From "Employees"
WHERE last_name = 'Baba';

