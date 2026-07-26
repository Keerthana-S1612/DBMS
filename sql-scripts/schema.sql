-- ==========================================================
-- 🗄️ Database Schema Definition Script
-- Includes: Primary Keys, Foreign Keys, Unique & Check Constraints
-- Dialect: PostgreSQL / standard ANSI SQL
-- ==========================================================

-- 1. Departments Table (Strong Entity)
CREATE TABLE departments (
    department_id SERIAL,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    CONSTRAINT pk_departments PRIMARY KEY (department_id),
    CONSTRAINT uq_department_name UNIQUE (department_name)
);

-- 2. Employees Table (Strong Entity referencing Departments)
CREATE TABLE employees (
    employee_id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    department_id INT,
    CONSTRAINT pk_employees PRIMARY KEY (employee_id),
    CONSTRAINT uq_employee_email UNIQUE (email),
    CONSTRAINT chk_salary CHECK (salary > 0),
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id) 
        REFERENCES departments (department_id) 
        ON DELETE SET NULL
);

-- 3. Projects Table (Strong Entity)
CREATE TABLE projects (
    project_id SERIAL,
    project_name VARCHAR(100) NOT NULL,
    budget NUMERIC(12, 2) NOT NULL,
    CONSTRAINT pk_projects PRIMARY KEY (project_id),
    CONSTRAINT chk_budget CHECK (budget > 1000)
);

-- 4. Works_On Table (Representing many-to-many N:N relationship)
CREATE TABLE works_on (
    employee_id INT,
    project_id INT,
    hours_worked NUMERIC(5, 2) DEFAULT 0.0,
    CONSTRAINT pk_works_on PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_work_employee FOREIGN KEY (employee_id) 
        REFERENCES employees (employee_id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_work_project FOREIGN KEY (project_id) 
        REFERENCES projects (project_id) 
        ON DELETE CASCADE,
    CONSTRAINT chk_hours CHECK (hours_worked >= 0.0)
);

-- 5. Dependents Table (Weak Entity dependent on Employees)
CREATE TABLE dependents (
    employee_id INT,
    dependent_name VARCHAR(100),
    relationship VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    CONSTRAINT pk_dependents PRIMARY KEY (employee_id, dependent_name),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (employee_id) 
        REFERENCES employees (employee_id) 
        ON DELETE CASCADE
);
