-- ==========================================================
-- 🔔 PL/pgSQL Stored Procedures & Triggers Script
-- Dialect: PostgreSQL
-- ==========================================================

-- 1. Create an Audit Logging Table
CREATE TABLE employee_audit (
    audit_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    old_salary NUMERIC(10, 2),
    new_salary NUMERIC(10, 2),
    action VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create the Trigger Function
-- Automatically logs salary adjustments when an employee row is updated
CREATE OR REPLACE FUNCTION log_salary_change()
RETURNS TRIGGER AS $$
BEGIN
    -- Log trigger only when salary is updated
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO employee_audit (employee_id, old_salary, new_salary, action)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary, 'SALARY_UPDATE');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Bind the Trigger Function to the Employees Table
CREATE TRIGGER trg_salary_audit
    AFTER UPDATE ON employees
    FOR EACH ROW
    EXECUTE FUNCTION log_salary_change();

-- 4. Create a Stored Procedure
-- Updates employee salary and validates that the increment does not exceed 50% in a single transaction
CREATE OR REPLACE PROCEDURE update_employee_salary(
    emp_id INT,
    percentage_increment NUMERIC
)
LANGUAGE plpgsql AS $$
DECLARE
    current_sal NUMERIC;
    new_sal NUMERIC;
BEGIN
    -- Fetch current salary
    SELECT salary INTO current_sal FROM employees WHERE employee_id = emp_id;
    
    -- Check if employee exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee with ID % not found.', emp_id;
    END IF;

    -- Calculate increment and check safety limit (max 50%)
    IF percentage_increment > 50.0 OR percentage_increment <= 0.0 THEN
        RAISE EXCEPTION 'Safety breach! Increment percentage % must be between 0 and 50.', percentage_increment;
    END IF;

    new_sal := current_sal + (current_sal * (percentage_increment / 100));

    -- Update database record
    UPDATE employees SET salary = new_sal WHERE employee_id = emp_id;
    
    COMMIT;
END;
$$;
