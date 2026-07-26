# Chapter 7: Structured Query Language (SQL) Core Syntax

This chapter covers Structured Query Language (SQL) from foundational Data Definition (DDL) and Data Manipulation (DML) structures to advanced subqueries, triggers, views, and stored procedures.

---

## 1. SQL Commands Classification
*   **DDL (Data Definition Language)**: Defines the physical structure of tables.
    *   `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `TRUNCATE TABLE`.
    *   *Note*: DDL commands are auto-committed. `TRUNCATE` removes all rows and frees disk space; it cannot be rolled back.
*   **DML (Data Manipulation Language)**: Modifies and queries data records.
    *   `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
    *   *Note*: `DELETE` removes rows one-by-one and records deletions in transaction logs; it can be rolled back.

---

## 2. Integrity Constraints in SQL
Constraints are declared during table creation to enforce business logic:
*   `PRIMARY KEY`: Enforces uniqueness and prevents `NULL` values.
*   `FOREIGN KEY`: Enforces referential integrity.
*   `UNIQUE`: Ensures all values in a column are distinct, but allows a single `NULL` value.
*   `NOT NULL`: Prevents saving `NULL` values.
*   `CHECK`: Validates value conditions (e.g., `CHECK (age >= 18)`).
*   `DEFAULT`: Inserts a default value if none is provided.

---

## 3. Querying & Grouping (`GROUP BY`, `HAVING`)
*   **GROUP BY**: Groups rows that have the same values into summary rows (e.g., find the number of employees in each department).
*   **HAVING**: Used instead of `WHERE` to filter groups based on aggregate functions (e.g., show departments with more than 5 employees). You cannot use aggregate functions inside a `WHERE` clause.

**Input Table (employees):**
| employee_id | name | department_id | salary |
| :--- | :--- | :--- | :--- |
| 1 | Amit | 1 | 75000 |
| 2 | Priya | 1 | 82000 |
| 3 | Rahul | 2 | 45000 |
| 4 | Siddharth | 1 | 95000 |

**SQL Query:**
```sql
SELECT department_id, AVG(salary) AS avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 2;
```

**Output Result:**
| department_id | avg_sal |
| :--- | :--- |
| 1 | 84000.00 |

---

## 4. Subqueries (Uncorrelated vs. Correlated)
*   **Uncorrelated Subquery**: The inner query is independent of the outer query. It runs once first, returns a set of values, and the outer query executes using those values.
*   **Correlated Subquery**: The inner query depends on values from the outer query. The inner query is executed repeatedly (once for every row processed by the outer query). Uses operators like `EXISTS`.

#### Correlated Query Example
Find employees earning more than the average salary of *their* department:
```sql
SELECT e1.name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
```

---

## 5. Views in SQL
*   **Concept**: A virtual table based on the result-set of an SQL statement. It does not store physical data records on disk; it executes the underlying query dynamically when accessed.
*   **Pros**: Simplifies complex queries, enhances security by restricting access to sensitive columns.

---

## 6. Advanced PL/SQL & Triggers
*   **Stored Procedure**: A prepared SQL code block that you can save and reuse. Can take parameters and return values.
*   **Trigger**: A named database object that automatically executes (fires) in response to specific events (like `INSERT`, `UPDATE`, or `DELETE` statements) on a table.

#### PostgreSQL PL/pgSQL Trigger Example
```sql
-- 1. Create a function that the trigger will execute
CREATE OR REPLACE FUNCTION audit_employee_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO employee_audit(employee_id, action, changed_at)
    VALUES (OLD.employee_id, 'UPDATE', NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Bind the function as a trigger to the table
CREATE TRIGGER trg_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_employee_change();
```
