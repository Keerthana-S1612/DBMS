# Chapter 3: Relational Model & Relational Algebra (Lectures 32 - 61)

This chapter covers the mathematical structure of Relational Databases, defining tables, constraints, and query languages (Relational Algebra and Calculus).

---

## Lecture 32: Introduction to Relational Model
*   **Concept**: Proposed by Edgar F. Codd (E.F. Codd) of IBM in 1970. It uses a mathematical relation (table) as its basic structure.
*   **Terminology Mapping**:
    *   **Relation** = Table
    *   **Tuple** = Row / Record
    *   **Attribute** = Column / Field
    *   **Cardinality** = Number of rows (tuples) in a relation.
    *   **Degree (Arity)** = Number of columns (attributes) in a relation schema.

---

## Lecture 33: Domains, Attributes, Tuples, Relations
*   **Domain**: A set of atomic/indivisible values of a specific data type (e.g., Domain of `Age` is positive integers between 1 and 120).
*   **Relation Schema**: $R(A_1, A_2, ..., A_n)$ where $R$ is the relation name and $A_i$ are attributes.
*   **Relation Instance**: $r(R)$ is a set of tuples $t = \langle v_1, v_2, ..., v_n \rangle$ where each value $v_i \in Domain(A_i)$.

---

## Lecture 34: Characteristics of Relations
1.  **Ordering of tuples in a relation**: Order of rows does not matter.
2.  **Ordering of attributes in a relation schema**: Order of columns does not matter.
3.  **Uniqueness of tuples**: All rows must be distinct. Mathematically, a relation is a *set* of tuples, and sets cannot contain duplicate elements.
4.  **Atomic values**: Each cell must contain exactly one value (1st Normal Form constraint).

---

## Lecture 35: Relational Integrity Constraints
Integrity constraints are rules defined to ensure data validity and consistency.
*   **Types**: Domain constraints, Key constraints, Referential integrity constraints.

---

## Lecture 36: Domain Constraints
*   **Concept**: Specifies that the value of each attribute $A$ must be an atomic value from the domain $Dom(A)$.
*   **Enforcement**: Handled via data types (e.g., `INT`, `VARCHAR`) and checking rules (e.g., `CHECK (salary > 0)`).

---

## Lecture 37: Keys: Super Key, Candidate Key, Primary Key
*   **Super Key**: A set of one or more attributes that, taken collectively, allows us to identify uniquely a tuple in the relation.
*   **Candidate Key**: A **minimal** super key. A set of attributes that uniquely identifies tuples, such that no proper subset of it can identify tuples.
*   **Primary Key**: The candidate key selected by the database designer to uniquely identify tuples in a relation. Cannot contain null values.

**Example Database Table (Student):**
| Roll_No (PK) | Registration_No (CK) | Name | Email |
| :--- | :--- | :--- | :--- |
| 1 | REG001 | Amit | amit@mail.com |
| 2 | REG002 | Priya | priya@mail.com |

*   *Super Keys*: `{Roll_No}`, `{Roll_No, Name}`, `{Registration_No, Email}`, etc.
*   *Candidate Keys*: `{Roll_No}` and `{Registration_No}` (minimal unique attributes).
*   *Primary Key*: Selected key (e.g., `{Roll_No}`).

---

## Lecture 38: Referential Integrity Constraints (Foreign Key)
*   **Concept**: Ensures relationships between tuples in two relations are valid.
*   **Rule**: A set of attributes $FK$ in relation $R_1$ is a foreign key referencing relation $R_2$ if:
    1.  The attributes in $FK$ have the same domain as the primary key $PK$ of $R_2$.
    2.  A value of $FK$ in $R_1$ either matches a $PK$ value in some tuple of $R_2$, or is `NULL`.

---

## Lecture 39: Referential Actions
What happens if you delete a tuple in $R_2$ referenced by $R_1$?
*   **Restrict / No Action**: Reject the delete operation.
*   **Cascade**: Automatically delete referencing tuples in $R_1$.
*   **Set Null**: Set referencing foreign key attributes in $R_1$ to `NULL`.
*   **Set Default**: Set referencing attributes to a default value.

---

## Lecture 40: Relational Algebra Overview
*   **Definition**: A procedural query language. It consists of a set of operations that take one or two relations as input and produce a new relation as output.
*   **Categories**: Unary operations (operate on one relation) and Binary/Set operations (operate on two relations).

---

## Lecture 41: Select Operation ($\sigma$)
*   **Concept**: Selects a subset of tuples from a relation that satisfy a specific selection condition.
*   **Notation**: \[\sigma_{P}(r)\]
    Where $P$ is the selection predicate (boolean formula) and $r$ is the relation.

**Input Relation (Employees):**
| Emp_ID | Name | Salary | Dept |
| :--- | :--- | :--- | :--- |
| E1 | Amit | 75000 | HR |
| E2 | Priya | 82000 | Engineering |
| E3 | Rahul | 45000 | HR |

**Operation**: \[\sigma_{Dept = 'HR'}(Employees)\]

**Output Result:**
| Emp_ID | Name | Salary | Dept |
| :--- | :--- | :--- | :--- |
| E1 | Amit | 75000 | HR |
| E3 | Rahul | 45000 | HR |

---

## Lecture 42: Project Operation ($\pi$)
*   **Concept**: Selects specific columns from a relation and discards the rest.
*   **Notation**: \[\pi_{A_1, A_2, ..., A_k}(r)\]
*   **Duplicate Elimination**: Since relations are mathematical sets, duplicates are automatically removed from the projected result.

**Operation**: \[\pi_{Dept}(Employees)\]

**Output Result (Duplicates removed):**
| Dept |
| :--- |
| HR |
| Engineering |

---

## Lecture 43: Rename Operation ($\rho$)
*   **Concept**: Renames the result of a relational algebra expression or a relation name.
*   **Notation**: \[\rho_{x}(E) \quad \text{or} \quad \rho_{x(A_1, A_2, ..., A_n)}(E)\]
    Where $x$ is the new name of the relation.

---

## Lecture 44: Set Union Operation ($\cup$)
*   **Concept**: Combines tuples from two relations.
*   **Notation**: \[r \cup s\]
*   **Compatibility Rules**:
    1.  Arity (number of attributes) of $r$ and $s$ must be the same.
    2.  Domains of corresponding attributes must be compatible.

---

## Lecture 45: Set Intersection Operation ($\cap$)
*   **Concept**: Returns tuples that exist in **both** relations.
*   **Notation**: \[r \cap s = r - (r - s)\]
*   **Requirements**: Must be union-compatible.

---

## Lecture 46: Set Difference Operation ($-$)
*   **Concept**: Returns tuples that exist in $r$ but **not** in $s$.
*   **Notation**: \[r - s\]
*   **Requirements**: Must be union-compatible. Note that $r - s \neq s - r$.

---

## Lecture 47: Cartesian Product Operation ($\times$)
*   **Concept**: Combines info from any two relations.
*   **Notation**: \[r \times s\]
*   **Math Rules**:
    *   If $r$ has $n_1$ tuples and degree $d_1$, and $s$ has $n_2$ tuples and degree $d_2$:
    *   $r \times s$ has $n_1 \times n_2$ tuples and degree $d_1 + d_2$.

---

## Lecture 48: Composition of Operations
*   **Concept**: Nesting relational algebra operations to write complex query constraints.
*   **Example**: Find names of employees earning more than 50000:
    \[\pi_{name}(\sigma_{salary > 50000}(Employees))\]

---

## Lecture 49: Relational Joins Overview
*   **Concept**: Used to combine related tuples from two relations into a single tuple. Joins are equivalent to a Cartesian Product followed by a Selection.

---

## Lecture 50: Theta Join ($\bowtie_{\theta}$)
*   **Concept**: General join that combines tuples from two relations based on a general condition $\theta$.
*   **Notation**: \[r \bowtie_{\theta} s = \sigma_{\theta}(r \times s)\]

---

## Lecture 51: Equi-Join
*   **Concept**: A specific case of Theta Join where the join condition consists of equality comparisons ($=$) only.

---

## Lecture 52: Natural Join ($\bowtie$)
*   **Concept**: Joins tuples based on common attribute names. The common attributes appear only once in the final relation.
*   **Math**: Automatically checks for equality on attributes with the same name.

**Relation R:**
| A | B |
| :--- | :--- |
| 1 | a |
| 2 | b |

**Relation S:**
| B | C |
| :--- | :--- |
| a | x |
| a | y |
| c | z |

**Operation**: \[R \bowtie S\]

**Output Result:**
| A | B | C |
| :--- | :--- | :--- |
| 1 | a | x |
| 1 | a | y |

---

## Lecture 53: Outer Joins (Left, Right, Full)
Keeps tuples even if they do not match in the join condition, padding unmatched fields with `NULL`.
*   **Left Outer Join ($\rtimes$)**: Keeps all tuples from the left relation.
*   **Right Outer Join ($\ltimes$)**: Keeps all tuples from the right relation.
*   **Full Outer Join ($\bowtie$)**: Keeps all tuples from both relations.

---

## Lecture 54: Division Operator in Relational Algebra
*   **Concept**: Used for queries containing the phrase "for all" or "every".
*   **Notation**: \[r \div s\]

**Relation R (Student-Course assignments):**
| Student | Course |
| :--- | :--- |
| Amit | Java |
| Amit | SQL |
| Priya | Java |
| Priya | Python |
| Rahul | Java |
| Rahul | SQL |

**Relation S (Required Courses):**
| Course |
| :--- |
| Java |
| SQL |

**Operation**: \[R \div S\]

**Output Result (Students who have taken both Java AND SQL):**
| Student |
| :--- |
| Amit |
| Rahul |

---

## Lectures 55 & 56: Solved Query Problems
*   **Problem**: Writing relational algebra queries for real-world scenarios.
*   *Example Query*: Names of projects worked on by employee 'Amit':
    \[\pi_{pname}(\sigma_{ename = 'Amit'}(Employees \bowtie Works\_on \bowtie Projects))\]

---

## Lecture 57: Relational Calculus Introduction
*   **Concept**: Non-procedural (declarative) query language. Describes *what* information is needed, not *how* to retrieve it.
*   **Types**: Tuple Relational Calculus (TRC) and Domain Relational Calculus (DRC).

---

## Lecture 58: Tuple Relational Calculus (TRC)
*   **Notation**: \[\{ t \mid P(t) \}\]
    Where $t$ is a tuple variable and $P(t)$ is a formula.
*   **Example**: Find details of employees earning > 50000:
    \[\{ t \mid t \in Employees \wedge t[salary] > 50000 \}\]

---

## Lecture 59: Domain Relational Calculus (DRC)
*   **Notation**: \[\{ \langle x_1, x_2, ..., x_n \rangle \mid P(x_1, x_2, ..., x_n) \}\]
    Where $x_i$ represent domain variables (column values) rather than entire tuples.

---

## Lecture 60: TRC vs DRC Solved Queries
*   **Equivalence**: Relational algebra, TRC, and DRC are equivalent in power for safe queries.
*   **Solved examples**: Converting relational algebra statements into TRC and DRC formulas.

---

## Lecture 61: Schema Diagrams
*   **Concept**: Graphical representation showing the structural schema of relations, including tables, attribute types, and primary key-to-foreign key referential links.
