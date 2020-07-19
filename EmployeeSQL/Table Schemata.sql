-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/q9BKqn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- I edited the exported file a little to change the formatting of the keys


CREATE TABLE "Titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(30)   NOT NULL,
    PRIMARY KEY ("title_id")
);

CREATE TABLE "Employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY("emp_title_id") REFERENCES "Titles" ("title_id")
);

CREATE TABLE "Departments" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "Dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    PRIMARY KEY ("emp_no","dept_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "Departments" ("dept_no")
);

CREATE TABLE "Dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" integer   NOT NULL,
    PRIMARY KEY ("dept_no","emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "Departments" ("dept_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employees" ("emp_no")
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employees" ("emp_no")
);