# Chapter 2: Entity-Relationship (ER) Model (Lectures 16 - 31)

This chapter explains how to model data conceptually using the Entity-Relationship framework. It covers entity structures, attribute types, relationship mapping constraints, weak entity designs, subtyping, and reduction to relational schemas.

---

## Lecture 16: Introduction to ER Model
*   **Concept**: The Entity-Relationship (ER) model is a conceptual database design model introduced by Peter Chen in 1976.
*   **Purpose**: It allows database designers to represent the logical structure of a database graphically (ER Diagram) before implementing the schema physically in SQL. It bridges the gap between real-world requirements and relational databases.

---

## Lecture 17: Entity and Entity Sets
*   **Entity**: A distinguishable object in the real world (e.g., a specific employee "John", a specific book "DBMS Complete").
    *   *Physical Existence*: Person, Car.
    *   *Conceptual Existence*: Bank Account, Course, Job.
*   **Entity Set**: A collection of entities of the same type that share the same attributes (e.g., all employees, all departments).

---

## Lecture 18: Attributes and Types of Attributes
Attributes are properties that describe an entity.
1.  **Simple (Atomic) Attributes**: Cannot be divided into subparts (e.g., `Salary`).
2.  **Composite Attributes**: Can be divided into smaller sub-attributes representing simpler meanings (e.g., `Name` divided into `First_Name`, `Last_Name`, `Middle_Initial`).
3.  **Single-Valued Attributes**: Contain exactly one value for a specific entity instance (e.g., `Date_of_Birth`).
4.  **Multi-Valued Attributes**: Contain a set of values for a single entity instance (e.g., an employee having multiple `Phone_Numbers` or `Email_Addresses`). Denoted by a **double oval**.
5.  **Derived Attributes**: The value is calculated from other related attributes (e.g., `Age` calculated from `Date_of_Birth` and `Current_Date`). Denoted by a **dashed oval**.

---

## Lecture 19: Keys in ER Diagrams
*   **Concept**: An attribute (or set of attributes) whose values uniquely identify each entity in an entity set.
*   **Primary Key in ER**: Underlined in the diagram (e.g., `Roll_Number` in a Student entity set).
*   **Composite Key**: A key consisting of multiple attributes, all of which are underlined.

---

## Lecture 20: Relationship and Relationship Sets
*   **Relationship**: An association among several entities (e.g., Employee "John" *works_in* Department "HR").
*   **Relationship Set**: A mathematical relation among $n \ge 2$ entity sets. If $E_1, E_2, ..., E_n$ are entity sets, a relationship set $R$ is a set of associations:
    \[R \subseteq \{ (e_1, e_2, ..., e_n) \mid e_1 \in E_1, e_2 \in E_2, ..., e_n \in E_n \}\]
*   **Notation**: Denoted by a **diamond** in ER diagrams.

---

## Lecture 21: Degree of a Relationship Set
The number of entity sets participating in a relationship set.
*   **Unary (Recursive) Relationship (Degree 1)**: An entity set is related to itself.
    *   *Example*: Employee *manages* Employee (where some employees manage other employees).
*   **Binary Relationship (Degree 2)**: Two entity sets participate (most common).
    *   *Example*: Student *enrolls_in* Course.
*   **Ternary Relationship (Degree 3)**: Three entity sets participate.
    *   *Example*: Employee *works_on* Project *using* Job_Role.

---

## Lecture 22: Mapping Cardinality Constraints
Expresses the number of entities to which another entity can be associated via a relationship set.
1.  **One-to-One (1:1)**: An entity in A is associated with at most one entity in B, and vice versa (e.g., Employee *manages* Department).
2.  **One-to-Many (1:N)**: An entity in A is associated with any number of entities in B, but an entity in B can be associated with at most one entity in A (e.g., Department *hosts* Employees).
3.  **Many-to-One (N:1)**: Many entities in A can point to one entity in B.
4.  **Many-to-Many (N:N)**: An entity in A is associated with any number of entities in B, and vice versa (e.g., Student *takes* Courses).

---

## Lecture 23: Participation Constraints (Total & Partial)
*   **Total Participation**: Every entity in the entity set must participate in at least one relationship instance in the relationship set.
    *   *Notation*: **Double line** connecting the entity set to the relationship.
    *   *Example*: Every `Employee` must be assigned to some `Department`. (Total participation of Employee).
*   **Partial Participation**: Some entities in the entity set may not participate in the relationship.
    *   *Notation*: **Single line**.
    *   *Example*: Not every `Employee` manages a `Department`. (Partial participation of Employee in the Manages relationship).

---

## Lecture 24: Weak Entity Sets
*   **Concept**: An entity set that does not have a primary key of its own is called a **Weak Entity Set**.
*   **Dependence**: It is existence-dependent on a **Strong Entity Set** (identifying/owner entity set).
*   **Key Structure**: It is identified by the primary key of the strong entity set plus a **Discriminator (Partial Key)** of the weak entity set. The discriminator is underlined with a **dashed line**.
*   **Notation**: Double rectangle for the weak entity set, and a double diamond for the identifying relationship.

---

## Lecture 25: Strong vs. Weak Entity Sets Comparison

| Feature | Strong Entity Set | Weak Entity Set |
| :--- | :--- | :--- |
| **Primary Key** | Possesses its own primary key. | Does not have a primary key; relies on composite key. |
| **Existence** | Independent of other entities. | Dependent on the owner (strong) entity set. |
| **Notation** | Single Rectangle. | Double Rectangle. |
| **Relationship** | Single Diamond (standard association). | Double Diamond (identifying relationship). |
| **Key Attribute** | Underlined with a solid line. | Partial key (discriminator) underlined with a dashed line. |

---

## Lecture 26: Enhanced ER: Generalization
*   **Concept**: A bottom-up design process where multiple entity sets sharing common features are synthesized into a higher-level super-type entity set.
*   **Example**: `Car` (attributes: *Engine_Capacity, Max_Speed*) and `Truck` (attributes: *Cargo_Weight*) share common attributes like *License_Plate, Brand*. They are generalized into a higher-level entity `Vehicle` containing the shared attributes.

---

## Lecture 27: Enhanced ER: Specialization
*   **Concept**: A top-down design process where a high-level entity set is broken down into lower-level sub-type entity sets based on distinct features.
*   **Example**: `Employee` is specialized into `Developer` (attributes: *Languages_Used*) and `Salesperson` (attributes: *Monthly_Quota*).

---

## Lecture 28: Enhanced ER: Aggregation
*   **Concept**: An abstraction through which a relationship set is treated as a higher-level entity set. This allows a relationship set to participate in another relationship set.
*   **Why**: Normal relationships only connect entities. If we want to connect a relationship (e.g., Employee *works_on* Project) to another entity (e.g., using a *Machine*), we enclose the first relationship in an aggregate box.

---

## Lecture 29: ER Diagram to Table Reduction (Rule 1 - 1:N Relationship)
*   **Rule**: Mapping a binary 1:N relationship.
*   **Method**: Do not create a separate table for the relationship. Instead, take the primary key of the entity on the "1" side and place it as a **Foreign Key** in the table on the "N" side.
*   **Example**:
    *   `Department(Dept_ID, Dept_Name)` (1-side)
    *   `Employee(Emp_ID, Name, Salary)` (N-side)
    
    *Mapping Result (2 Tables)*:
    
    **departments Table:**
    | Dept_ID (PK) | Dept_Name |
    | :--- | :--- |
    | D01 | Engineering |
    
    **employees Table (Contains FK pointing to departments):**
    | Emp_ID (PK) | Name | Salary | Dept_ID (FK) |
    | :--- | :--- | :--- | :--- |
    | E101 | Amit | 75000 | D01 |

---

## Lecture 30: ER Diagram to Table Reduction (Rule 2 - N:N Relationship)
*   **Rule**: Mapping a binary N:N relationship.
*   **Method**: You **must** create a separate table for the relationship. The schema of this new table will contain the primary keys of both participating entity sets + any descriptive attributes of the relationship.
*   **Example**:
    *   `Student(Roll_No, Name)`
    *   `Course(Course_ID, Title)`
    *   Relationship: `Takes(hours)`
    
    *Mapping Result (3 Tables)*:
    
    **students Table:**
    | Roll_No (PK) | Name |
    | :--- | :--- |
    | S101 | John |

    **courses Table:**
    | Course_ID (PK) | Title |
    | :--- | :--- |
    | C50 | Databases |

    **takes Table (Composite PK: {Roll_No, Course_ID}):**
    | Roll_No (FK) | Course_ID (FK) | hours |
    | :--- | :--- | :--- |
    | S101 | C50 | 40 |

---

## Lecture 31: ER Diagram to Table Reduction (Rule 3 - Weak Entity Set)
*   **Rule**: Mapping a Weak Entity Set.
*   **Method**: Create a table for the weak entity set. The schema of this table must include all attributes of the weak entity set + the primary key of the strong identifying entity set (as a foreign key). The primary key of this new table is a composite key: `{Strong_Primary_Key, Weak_Discriminator}`.
*   **Example**:
    *   Strong Entity: `Employee(Emp_ID, Name)`
    *   Weak Entity: `Dependent(Dep_Name, Relationship)` (where Dep_Name is the discriminator)
    
    *Mapping Result (2 Tables)*:
    
    **employees Table:**
    | Emp_ID (PK) | Name |
    | :--- | :--- |
    | E101 | Amit |

    **dependents Table (Composite PK: {Emp_ID, Dep_Name}):**
    | Emp_ID (FK) | Dep_Name | Relationship |
    | :--- | :--- | :--- |
    | E101 | Priya | Spouse |
    | E101 | Rohan | Son |
