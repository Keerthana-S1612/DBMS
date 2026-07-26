-- ==========================================================
-- 🔍 Advanced SQL Querying Script
-- Demonstrating: Joins, Group By, Having, Nested & Correlated Subqueries
-- ==========================================================

-- 1. Insert seed data for queries to execute logically
INSERT INTO departments (department_name, location) VALUES
('Engineering', 'San Francisco'),
('Human Resources', 'New York'),
('Sales', 'Chicago'),
('Finance', 'Boston');

INSERT INTO employees (first_name, last_name, email, salary, department_id) VALUES
('Amit', 'Sharma', 'amit@domain.com', 75000.00, 1),
('Priya', 'Patel', 'priya@domain.com', 82000.00, 1),
('Rahul', 'Kumar', 'rahul@domain.com', 45000.00, 2),
('Siddharth', 'Singh', 'sid@domain.com', 95000.00, 1),
('Neha', 'Gupta', 'neha@domain.com', 55000.00, 3),
('Vikram', 'Mehta', 'vik@domain.com', 62000.00, 4);

INSERT INTO projects (project_name, budget) VALUES
('Project Alpha', 50000.00),
('Project Beta', 120000.00),
('Project Gamma', 8000.00);

INSERT INTO works_on (employee_id, project_id, hours_worked) VALUES
(1, 1, 40.0),
(1, 2, 20.0),
(2, 2, 60.0),
(4, 1, 15.0),
(4, 2, 45.0),
(5, 3, 30.0);

-- ==========================================================
-- QUERY EXAMPLES
-- ==========================================================

-- Query 1: Natural Join and Where filtering
-- Get details of employees working in 'Engineering' location
SELECT e.first_name, e.last_name, d.department_name, d.location
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location = 'San Francisco';

-- Query 2: Left Outer Join
-- Show all departments and employees inside them, including empty departments
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

-- Query 3: Group By with Having
-- Find departments with average salary > 60000
SELECT d.department_name, AVG(e.salary) AS average_salary, COUNT(e.employee_id) AS total_employees
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000.00;

-- Query 4: Uncorrelated Subquery (Using IN)
-- Find employees who are working on projects with a budget greater than 100,000
SELECT first_name, last_name, salary
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT employee_id 
    FROM works_on 
    WHERE project_id IN (
        SELECT project_id 
        FROM projects 
        WHERE budget > 100000.00
    )
);

-- Query 5: Correlated Subquery
-- Find employees earning more than the average salary of their respective departments
SELECT e1.first_name, e1.last_name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

-- Query 6: Division Simulation using EXISTS
-- Find employees who work on EVERY project
SELECT e.first_name, e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT p.project_id
    FROM projects p
    WHERE NOT EXISTS (
        SELECT w.project_id
        FROM works_on w
        WHERE w.employee_id = e.employee_id AND w.project_id = p.project_id
    )
);
