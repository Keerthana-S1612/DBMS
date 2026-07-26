# Chapter 7: Structured Query Language (SQL) Core Syntax

This chapter covers Structured Query Language (SQL) from foundational Data Definition (DDL) and Data Manipulation (DML) structures to advanced subqueries, triggers, views, and stored procedures.

---

## 1. SQL Commands Classification

### English
*   **DDL (Data Definition Language)**: Defines the physical structure of tables.
    *   `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `TRUNCATE TABLE`.
    *   *Note*: DDL commands are auto-committed. `TRUNCATE` removes all rows and frees disk space; it cannot be rolled back.
*   **DML (Data Manipulation Language)**: Modifies and queries data records.
    *   `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
    *   *Note*: `DELETE` removes rows one-by-one and records deletions in transaction logs; it can be rolled back.

### Tamil (தமிழ்)
*   **SQL கட்டளைகள்**:
  * **DDL (கட்டமைப்பு)**: அட்டவணையை உருவாக்க மற்றும் மாற்றப் பயன்படும் (`CREATE`, `ALTER`, `DROP`). `TRUNCATE` என்பது முழு அட்டவணையையும் முழுமையாகத் துடைத்து இடத்தைக் காலி செய்யும், இதை ரத்து செய்ய முடியாது (Rollback).
  * **DML (பயன்பாடு)**: வரிகளைச் சேர்க்க, மாற்ற, அழிக்கப் பயன்படும் (`INSERT`, `UPDATE`, `DELETE`, `SELECT`). `DELETE` செய்த வரிகளைத் திரும்பப் பெற முடியும்.

---

## 2. Integrity Constraints in SQL

### English
Constraints are declared during table creation to enforce business logic:
*   `PRIMARY KEY`: Enforces uniqueness and prevents `NULL` values.
*   `FOREIGN KEY`: Enforces referential integrity.
*   `UNIQUE`: Ensures all values in a column are distinct, but allows a single `NULL` value.
*   `NOT NULL`: Prevents saving `NULL` values.
*   `CHECK`: Validates value conditions (e.g., `CHECK (age >= 18)`).
*   `DEFAULT`: Inserts a default value if none is provided.

### Tamil (தமிழ்)
*   **SQL கட்டுப்பாடுகள்**:
  * `PRIMARY KEY`: தனித்துவமானது மற்றும் `NULL` மதிப்புகளை அனுமதிக்காது.
  * `UNIQUE`: தனித்துவமானது ஆனால் `NULL`-ஐ அனுமதிக்கும்.
  * `CHECK`: குறிப்பிட்ட நிபந்தனையைச் சரிபார்க்கும் (எ.கா: வயது 18-க்கு மேல் இருக்க வேண்டும்).

---

## 3. Querying & Grouping (`GROUP BY`, `HAVING`)

### English
*   **GROUP BY**: Groups rows that have the same values into summary rows (e.g., find the number of employees in each department).
*   **HAVING**: Used instead of `WHERE` to filter groups based on aggregate functions (e.g., show departments with more than 5 employees). You cannot use aggregate functions inside a `WHERE` clause.

#### Code Example
```sql
SELECT department_id, COUNT(employee_id) AS total_staff
FROM employees
WHERE salary > 30000                 -- Filters individual rows
GROUP BY department_id
HAVING COUNT(employee_id) > 5;       -- Filters grouped values
```

### Tamil (தமிழ்)
*   **குழுப்படுத்துதல் (GROUP BY & HAVING)**:
  * **GROUP BY**: ஒரே மதிப்புடைய வரிகளை ஒன்றாகக் குழுவாக்கும் (உதாரணம்: ஒவ்வொரு துறையிலும் எத்தனை பேர் வேலை செய்கிறார்கள்).
  * **HAVING**: குழுப்படுத்தப்பட்ட முடிவுகளுக்கு வடிகட்டி (Filter) அமைக்கப் பயன்படும். இதனுள் `COUNT`, `SUM` போன்றவற்றை பயன்படுத்தலாம். (இவற்றை `WHERE` க்ளாஸில் பயன்படுத்த முடியாது).

---

## 4. Subqueries (Uncorrelated vs. Correlated)

### English
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
    WHERE e2.department_id = e1.department_id  -- Reference to outer query e1
);
```

### Tamil (தமிழ்)
*   **துணை குவரிகள் (Subqueries)**:
  * **தனித்த துணை குவரி (Uncorrelated)**: உள்ளே இருக்கும் குவரி ஒரு முறை மட்டுமே இயங்கி ஒரு மதிப்பைத் தரும். அதை வைத்து வெளிக்குவரி இயங்கும்.
  * **தொடர்புடைய துணை குவரி (Correlated)**: உள்ளே இருக்கும் குவரி, வெளிக்குவரியின் ஒவ்வொரு வரிக்கும் மீண்டும் மீண்டும் இயங்கும். இது வெளி டேபிளின் மதிப்பைச் சார்ந்திருக்கும்.

---

## 5. Views in SQL

### English
*   **Concept**: A virtual table based on the result-set of an SQL statement. It does not store physical data records on disk; it executes the underlying query dynamically when accessed.
*   **Pros**: Simplifies complex queries, enhances security by restricting access to sensitive columns.

### Tamil (தமிழ்)
*   **பார்வை (Views)**:
  * இது ஒரு மெய்நிகர் அட்டவணை (Virtual Table). இதில் தரவுகள் நேரடியாகச் சேமிக்கப்படாது, இதைப் பார்க்கும்போது இதன் பின்னணியில் உள்ள குவரி இயங்கித் தரவைக் காட்டும். பாதுகாப்பு மற்றும் குவரிகளை எளிதாக்கப் பயன்படும்.

---

## 6. Advanced PL/SQL & Triggers

### English
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

### Tamil (தமிழ்)
*   **Stored Procedure**: மீண்டும் மீண்டும் பயன்படுத்தக் கூடிய ஒரு SQL குறியீட்டுத் தொகுதி.
*   **டிரிகர் (Triggers)**: ஒரு அட்டவணையில் `INSERT`, `UPDATE` அல்லது `DELETE` செய்யும்போது, நமது குறுக்கீடின்றித் தானாகவே இயங்கும் ஒரு பின்னணி நிரல் (உதாரணம்: சம்பளம் மாறும்போது ஒரு ஆடிட் டேபிளில் பழைய சம்பளத்தைத் தானாகவே சேமிப்பது).
