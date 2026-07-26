# Chapter 8: DBMS Top High-Yield Interview Q&As

This chapter contains 40 top, high-yield Database Management Systems (DBMS) interview questions. Each question is thoroughly explained in English and accompanied by an **illustrative example table** to clarify the concept.

---

### Q1: What is the main difference between a File System and a DBMS?
*   **Answer**: A File System stores data in flat, isolated files managed by the OS, leading to data redundancy and inconsistency. A DBMS is a centralized software package that stores both data and metadata, ensuring consistency, concurrency safety (ACID), and robust query optimization.

**Illustrative Data Table (Redundancy in File System):**
| Student_ID | Name | Course_Enrolled | Hostel_Room |
| :--- | :--- | :--- | :--- |
| S101 | John | Java | Room 204 |
| S101 | John | Python | Room 204 (Redundant room data) |

---

### Q2: Explain the ACID properties in detail.
*   **Answer**: 
    *   **Atomicity**: "All or nothing." Either the entire transaction succeeds, or it is completely rolled back.
    *   **Consistency**: A transaction must transform the database from one valid state to another.
    *   **Isolation**: Concurrent execution of transactions must yield the same state as serial execution.
    *   **Durability**: Committed data survives system crashes.

**Illustrative Data Table (Transaction Failure requiring Atomicity):**
| Account_ID | Balance Before Tx | Tx Action (Transfer $100) | Balance After Tx (Abort state) |
| :--- | :--- | :--- | :--- |
| A (Sender) | $500 | -$100 (Success) | $500 (Restored via rollback) |
| B (Receiver) | $200 | +$100 (System crashed!) | $200 (Restored via rollback) |

---

### Q3: What is the difference between physical and logical data independence?
*   **Answer**:
    *   **Physical Data Independence**: The ability to modify the physical schema (like changing indexes or file block sizes) without changing the conceptual schema.
    *   **Logical Data Independence**: The ability to modify the logical schema (like adding columns or tables) without changing the external schemas (views) or application code.

**Illustrative Data Table (Logical Independence via View):**
*Original Table:*
| Emp_ID | Name | Salary (Sensitive) | Dept |
| :--- | :--- | :--- | :--- |
| E01 | Amit | 75000 | HR |

*Public View Schema (Unchanged even if Salary column is renamed/split in Original Table):*
| Emp_ID | Name | Dept |
| :--- | :--- | :--- |
| E01 | Amit | HR |

---

### Q4: Define Super Key, Candidate Key, and Primary Key.
*   **Answer**:
    *   **Super Key**: Any set of attributes that uniquely identifies a row in a table.
    *   **Candidate Key**: A minimal super key (no proper subset can identify a row).
    *   **Primary Key**: The specific candidate key chosen by the DBA to uniquely identify rows (cannot contain NULLs).

**Illustrative Data Table (Keys comparison):**
| Roll_No (PK) | Passport_No (CK) | Name | Phone |
| :--- | :--- | :--- | :--- |
| 1 | P8877 | John | 555-1234 |
| 2 | P9922 | Alice | 555-5678 |
*   *Candidate Keys*: `{Roll_No}`, `{Passport_No}`
*   *Super Keys*: `{Roll_No, Name}`, `{Passport_No, Phone}`, `{Roll_No, Passport_No, Name}`

---

### Q5: What is a Foreign Key and Referential Integrity?
*   **Answer**: A Foreign Key is a column (or set of columns) in one table that references the Primary Key of another table. Referential Integrity ensures that a foreign key value must always point to an existing primary key value in the referenced table, or be `NULL`.

**Illustrative Data Table (Referential Link):**
*Parent Table (departments):*
| Dept_ID (PK) | Dept_Name |
| :--- | :--- |
| D01 | Engineering |

*Child Table (employees):*
| Emp_ID | Name | Dept_ID (FK) |
| :--- | :--- | :--- |
| E101 | Amit | D01 (Valid reference) |
| E102 | Vikram | NULL (Allowed) |

---

### Q6: Explain cascading actions on delete.
*   **Answer**: When a row in the parent table is deleted, cascading actions define what happens to referencing child rows:
    *   `CASCADE`: Automatically deletes all referencing rows in the child table.
    *   `SET NULL`: Sets the foreign key values of referencing rows in the child table to `NULL`.
    *   `RESTRICT`: Prevents the deletion of the parent row if child rows refer to it.

**Illustrative Data Table (ON DELETE CASCADE):**
*Before Delete of D01:*
| Emp_ID | Name | Dept_ID (FK) |
| :--- | :--- | :--- |
| E101 | Amit | D01 |

*After Delete of D01 (Row containing E101 is automatically removed):*
| Emp_ID | Name | Dept_ID (FK) |
| :--- | :--- | :--- |
| (Empty) | | |

---

### Q7: What are Functional Dependencies (FDs)?
*   **Answer**: A constraint $\alpha \rightarrow \beta$ holds on a relation $R$ if, whenever two tuples have the same values on attributes $\alpha$, they must also have the same values on attributes $\beta$.

**Illustrative Data Table (Valid FD: Roll_No -> Name):**
| Roll_No | Name | Course |
| :--- | :--- | :--- |
| 1 | Amit | Java |
| 1 | Amit | SQL |
*   *Note*: Since Roll_No `1` always maps to `Amit`, the FD $Roll\_No \rightarrow Name$ holds.

---

### Q8: What is attribute closure ($\alpha^+$)?
*   **Answer**: The set of all attributes functionally determined by the attribute set $\alpha$ under a given set of functional dependencies $F$. It is used to identify candidate keys.

**Illustrative Data Table (FDs: A -> B, B -> C):**
| Attribute Set | Computed Closure | Determines entire table R(A,B,C)? |
| :--- | :--- | :--- |
| A | $A^+ = \{A, B, C\}$ | Yes (Candidate Key) |
| B | $B^+ = \{B, C\}$ | No |

---

### Q9: Explain First Normal Form (1NF).
*   **Answer**: A relation is in 1NF if and only if the domain of each attribute contains only atomic (indivisible) values, meaning no multi-valued or composite attributes are allowed.

**Illustrative Data Table (1NF Violation):**
| Student | Course |
| :--- | :--- |
| Amit | Java, SQL |

**Illustrative Data Table (1NF Resolved):**
| Student | Course |
| :--- | :--- |
| Amit | Java |
| Amit | SQL |

---

### Q10: Explain Second Normal Form (2NF) and Partial Dependency.
*   **Answer**: A relation is in 2NF if it is in 1NF and there is **no partial dependency**. A partial dependency occurs when a non-prime attribute is functionally determined by a proper subset of a candidate key.

**Illustrative Data Table (2NF Violation):**
*Key is {Emp_ID, Proj_ID}. FD is Proj_ID -> Proj_Name (Partial Dependency).*
| Emp_ID (Key) | Proj_ID (Key) | Proj_Name (Violates 2NF) |
| :--- | :--- | :--- |
| E1 | P1 | Alpha |
| E2 | P1 | Alpha |

---

### Q11: Explain Third Normal Form (3NF) and Transitive Dependency.
*   **Answer**: A relation is in 3NF if it is in 2NF and has **no transitive dependency**. Formally, for every non-trivial FD $\alpha \rightarrow \beta$: $\alpha$ must be a super key or $\beta$ must be a prime attribute.

**Illustrative Data Table (3NF Violation):**
*Key is Emp_ID. FDs: Emp_ID -> Dept_ID, Dept_ID -> Dept_Name (Transitive Dependency).*
| Emp_ID (Key) | Dept_ID | Dept_Name (Violates 3NF) |
| :--- | :--- | :--- |
| E1 | D01 | HR |

---

### Q12: Why is BCNF stricter than 3NF?
*   **Answer**: In 3NF, an FD $\alpha \rightarrow \beta$ is allowed if $\beta$ is a prime attribute even if $\alpha$ is not a super key. BCNF removes this exception: for every non-trivial FD $\alpha \rightarrow \beta$, $\alpha$ **must** be a super key.

**Illustrative Data Table (BCNF Violation but 3NF Valid):**
*Key is {Student, Subject}. FD is Advisor -> Subject (Advisor is not super key, but Subject is prime attribute).*
| Student (Key) | Subject (Key) | Advisor |
| :--- | :--- | :--- |
| John | Java | Mr. Smith |
| Alice | Java | Mr. Smith |

---

### Q13: What is the difference between 3NF and BCNF decompositions?
*   **Answer**: A 3NF decomposition is **always** guaranteed to be lossless and dependency-preserving. A BCNF decomposition is always lossless but **may not** preserve all functional dependencies.

**Illustrative Data Table (Decomposition properties):**
| Schema Property | 3NF Decomposition | BCNF Decomposition |
| :--- | :--- | :--- |
| **Lossless Join** | Always Guaranteed | Always Guaranteed |
| **Dependency Preservation** | Always Guaranteed | Not Always Guaranteed |

---

### Q14: Explain Lossless-Join Decomposition.
*   **Answer**: A decomposition of relation $R$ into $R_1$ and $R_2$ is lossless-join if $R_1 \bowtie R_2 = R$. Formally, $(R_1 \cap R_2) \rightarrow R_1$ or $(R_1 \cap R_2) \rightarrow R_2$ (the common attributes must form a key in at least one table).

**Illustrative Data Table (Lossless Join Verification):**
*Table 1: R1(ID, Name)*
| ID (Key) | Name |
| :--- | :--- |
| 1 | Amit |

*Table 2: R2(ID, Dept)*
| ID | Dept |
| :--- | :--- |
| 1 | HR |

*Common attribute ID is key in both, so joining R1 and R2 yields original R without spurious rows.*

---

### Q15: What is Dependency Preservation?
*   **Answer**: A decomposition of $R$ into $R_1, R_2, ..., R_n$ is dependency-preserving if the union of all functional dependencies on the individual tables is equivalent to the original set of functional dependencies.

**Illustrative Data Table (FD Mapping after Decomposition):**
| Original FDs | Decomposed Schema | Can check FDs locally? |
| :--- | :--- | :--- |
| $A \rightarrow B, B \rightarrow C$ | $R_1(A, B)$ and $R_2(B, C)$ | Yes (A->B in R1, B->C in R2) |

---

### Q16: What is a Transaction and its states?
*   **Answer**: A transaction is a logical unit of database work. Its states are: **Active** (executing), **Partially Committed** (final statement done, but not on disk), **Committed** (saved to disk), **Failed** (error hit), and **Aborted** (rolled back).

**Illustrative Data Table (Transaction states):**
| State | Database Disk status | Log status |
| :--- | :--- | :--- |
| Active | Uncommitted changes | In-memory log |
| Committed | Permanently saved | Log flushed to disk |

---

### Q17: What are serial, non-serial, and serializable schedules?
*   **Answer**:
    *   **Serial**: Transactions run one after another without overlap.
    *   **Non-Serial**: Operations of transactions are interleaved.
    *   **Serializable**: A non-serial schedule that is equivalent in effect to a serial schedule.

**Illustrative Data Table (Serial vs Interleaved Schedules):**
| Time | Serial Schedule | Interleaved Schedule |
| :--- | :--- | :--- |
| t1 | $T_1: Read(A)$ | $T_1: Read(A)$ |
| t2 | $T_1: Write(A)$ | $T_2: Read(A)$ (Interleaved) |

---

### Q18: Explain Conflict Serializability.
*   **Answer**: A schedule is conflict serializable if it is conflict equivalent to a serial schedule, which means we can transform it into a serial schedule by swapping non-conflicting operations.

**Illustrative Data Table (Conflict Swap Example):**
| Transaction 1 ($T_1$) | Transaction 2 ($T_2$) | Action |
| :--- | :--- | :--- |
| Read(A) | | Non-conflicting with T2's read |
| | Read(B) | Can be swapped safely |

---

### Q19: How do conflicting operations differ from non-conflicting ones?
*   **Answer**: Two operations conflict if they belong to different transactions, access the same data item, and at least one is a write operation (e.g., $R_1(A)$ and $W_2(A)$).

**Illustrative Data Table (Conflict vs Non-Conflict):**
| Operation Pair | Accesses same item? | Contains Write? | Status |
| :--- | :--- | :--- | :--- |
| $R_1(A), R_2(A)$ | Yes | No | **No Conflict** |
| $R_1(A), W_2(A)$ | Yes | Yes | **Conflict** |

---

### Q20: How does a precedence graph check for conflict serializability?
*   **Answer**: Create nodes for transactions. Draw an edge $T_i \rightarrow T_j$ if $T_i$ executes a conflicting operation before $T_j$. If the graph is **acyclic (no cycles)**, it is conflict serializable.

**Illustrative Data Table (Precedence Graph Conflict Mapping):**
| Time | Step | Conflicting Transactions | Resulting Edge |
| :--- | :--- | :--- | :--- |
| t1 | $W_1(A)$ then $R_2(A)$ | T1 writes, T2 reads | $T_1 \rightarrow T_2$ |

---

### Q21: Explain View Serializability.
*   **Answer**: A schedule is view serializable if it is view equivalent to some serial schedule. It checks initial read, dirty reads, and final writes. Every conflict serializable schedule is view serializable.

**Illustrative Data Table (View Equivalence Constraints):**
| Constraint | Schedule S | Serial Schedule S' |
| :--- | :--- | :--- |
| **Initial Read** | $T_1$ reads A first | $T_1$ must read A first |
| **Final Write** | $T_2$ writes A last | $T_2$ must write A last |

---

### Q22: What is a Dirty Read and cascading rollback?
*   **Answer**:
    *   **Dirty Read**: Reading data written by an uncommitted transaction.
    *   **Cascading Rollback**: If a transaction fails, all other transactions that read its dirty data must also be rolled back, causing a chain reaction.

**Illustrative Data Table (Cascading Rollback Scenario):**
| Transaction 1 ($T_1$) | Transaction 2 ($T_2$) | Status |
| :--- | :--- | :--- |
| Write(A) | | |
| | Read(A) | Dirty Read |
| Abort | | **T2 must also be aborted** |

---

### Q23: What is a recoverable schedule and a cascadeless schedule?
*   **Answer**:
    *   **Recoverable**: If $T_2$ reads from $T_1$, $T_1$ must commit before $T_2$ commits.
    *   **Cascadeless**: $T_2$ can only read $T_1$'s data after $T_1$ commits. Prevents cascading rollbacks.

**Illustrative Data Table (Cascadeless Schedule):**
| Transaction 1 ($T_1$) | Transaction 2 ($T_2$) | Status |
| :--- | :--- | :--- |
| Write(A) | | |
| Commit | | $T_1$ commits |
| | Read(A) | Read committed data (Safe) |

---

### Q24: Explain Two-Phase Locking (2PL).
*   **Answer**: A protocol ensuring serializability. Has two phases:
    1.  **Growing Phase**: Transaction acquires locks, cannot release any.
    2.  **Shrinking Phase**: Transaction releases locks, cannot acquire new ones.

**Illustrative Data Table (2PL Execution Phases):**
| Step | Transaction Action | Phase Type | Allowed? |
| :--- | :--- | :--- | :--- |
| 1 | Lock-S(A) | Growing | Yes |
| 2 | Unlock(A) | Shrinking | Yes |
| 3 | Lock-X(B) | Shrinking | **No (Violates 2PL)** |

---

### Q25: Difference between Strict 2PL and Rigorous 2PL?
*   **Answer**:
    *   **Strict 2PL**: Holds all exclusive ($X$) locks until the transaction commits/aborts.
    *   **Rigorous 2PL**: Holds all locks ($S$ and $X$) until the transaction commits/aborts.

**Illustrative Data Table (Rigorous 2PL Lock holding):**
| Lock Type | Release Time in Strict 2PL | Release Time in Rigorous 2PL |
| :--- | :--- | :--- |
| Shared Lock (Read) | Can release in Shrinking Phase | Only after Commit/Abort |
| Exclusive Lock (Write) | Only after Commit/Abort | Only after Commit/Abort |

---

### Q26: How are deadlocks handled in DBMS?
*   **Answer**:
    1.  **Prevention**: Using timestamp ordering schemes like Wait-Die or Wound-Wait.
    2.  **Detection & Recovery**: Maintaining a Wait-For Graph (WFG). If a cycle is detected, select a victim transaction and roll it back.

**Illustrative Data Table (Wait-Die vs Wound-Wait):**
*Assume T_old is older than T_young:*
| Protocol | T_old requests lock held by T_young | T_young requests lock held by T_old |
| :--- | :--- | :--- |
| **Wait-Die** | T_old Waits | T_young Dies (Aborts) |
| **Wound-Wait** | T_old Wounds T_young (Aborts) | T_young Waits |

---

### Q27: What is Write-Ahead Logging (WAL)?
*   **Answer**: A database security rule stating that any modification to a database record must first be written into a transaction log file on stable storage before the actual changes are written to the database files on disk.

**Illustrative Data Table (WAL order of operations):**
| Step | Action | Medium | Status |
| :--- | :--- | :--- | :--- |
| 1 | Write `<T1, A, 50, 100>` | Log file on disk | Completed |
| 2 | Write `A = 100` | Database file on disk | Completed |

---

### Q28: Explain Deferred vs. Immediate Database Modification.
*   **Answer**:
    *   **Deferred**: Database disk writes are postponed until commit. During recovery, only `REDO` is needed.
    *   **Immediate**: Updates are written to disk during active execution. During recovery, both `UNDO` and `REDO` are required.

**Illustrative Data Table (Recovery Action mapping):**
| Modification Type | Crash before Commit | Crash after Commit |
| :--- | :--- | :--- |
| **Deferred** | No Action (No disk change) | REDO |
| **Immediate** | UNDO | REDO |

---

### Q30: What is a Checkpoint in database recovery?
*   **Answer**: A checkpoint is a log record indicating that all modified data blocks in volatile memory have been successfully written to disk. During recovery, logging transactions prior to the checkpoint do not need to be processed, speeding up recovery times.

**Illustrative Data Table (Log scanning limit):**
| Transaction | Start / Commit Time | Status at Checkpoint | Recovery Action |
| :--- | :--- | :--- | :--- |
| $T_1$ | Completed before Checkpoint | Safely written to disk | **Skip (No Action)** |
| $T_2$ | Active during Checkpoint | Modified memory | **Scan and REDO/UNDO** |

---

### Q30: What is Dense Index vs. Sparse Index?
*   **Answer**:
    *   **Dense Index**: Contains an index record for every single search key value in the data file.
    *   **Sparse Index**: Contains index records for only some search key values (e.g., one entry per data block).

**Illustrative Data Table (Index Storage footprints):**
| Index Type | Entries for 1,000,000 Rows | Search Speed | Memory Footprint |
| :--- | :--- | :--- | :--- |
| **Dense** | 1,000,000 Entries | Fast | High |
| **Sparse** | 1,000 Entries (if block size=1000) | Slightly Slower | Low |

---

### Q31: Explain Primary, Clustering, and Secondary Indexes.
*   **Answer**:
    *   **Primary**: Created on ordered data files using the Primary Key. Sparse.
    *   **Clustering**: Created on ordered data files using a non-key attribute (duplicates). Sparse.
    *   **Secondary**: Created on unordered data files. Dense.

**Illustrative Data Table (Index properties):**
| Index Type | Data File Ordered? | Key Attribute? | Density |
| :--- | :--- | :--- | :--- |
| **Primary** | Yes | Yes | Sparse |
| **Clustering** | Yes | No | Sparse |
| **Secondary** | No | Yes / No | Dense |

---

### Q32: Why are B+ Trees preferred over B-Trees for database indexing?
*   **Answer**: In a B+ Tree, internal nodes do not store record/data pointers, only keys. This increases node fan-out, making the tree shallower. Additionally, all leaf nodes are linked via a linked list, allowing extremely fast range queries and sequential scans.

**Illustrative Data Table (B-Tree vs B+ Tree Node Fan-out):**
*Assume Block Size = 4096 Bytes, Key = 8 Bytes, Pointer = 8 Bytes:*
| Tree Type | Record Pointers in Internal Node? | Max Pointers per Node | Tree Height (10M records) |
| :--- | :--- | :--- | :--- |
| **B-Tree** | Yes (Stores data ptrs alongside keys) | ~120 Pointers | Higher (More disk I/O) |
| **B+ Tree** | No (Only keys and child pointers) | ~250 Pointers | Lower (Fewer disk I/O) |

---

### Q33: What is the difference between DELETE, TRUNCATE, and DROP?
*   **Answer**:
    *   **DELETE**: DML command. Deletes specific rows (using `WHERE`). Slower, logs each delete, can be rolled back.
    *   **TRUNCATE**: DDL command. Deletes all rows immediately, frees disk space. Faster, not logged row-by-row, cannot be rolled back.
    *   **DROP**: DDL command. Deletes the entire table structure along with its data from the database.

**Illustrative Data Table (Command comparison):**
| Command | Type | Removes Schema? | Rollback Allowed? |
| :--- | :--- | :--- | :--- |
| **DELETE** | DML | No | Yes |
| **TRUNCATE** | DDL | No | No |
| **DROP** | DDL | Yes | No |

---

### Q34: What is the Division Operator in Relational Algebra?
*   **Answer**: Used for queries containing the phrase "for all" or "every" (e.g., "Find customers who bought *all* products"). It returns tuples from relation $R$ that are associated with all tuples in relation $S$.

**Illustrative Data Table (R / S execution):**
*Relation R (Emp, Skill):*
| Emp | Skill |
| :--- | :--- |
| Amit | Java |
| Amit | SQL |
| Priya | Java |

*Relation S (Skills required):*
| Skill |
| :--- |
| Java |
| SQL |

*Result of R / S:*
| Emp |
| :--- |
| Amit |

---

### Q35: Difference between Relational Algebra and Relational Calculus?
*   **Answer**:
    *   **Relational Algebra**: Procedural query language; describes *how* to get the data step-by-step.
    *   **Relational Calculus**: Non-procedural (declarative) language; describes *what* data is needed without specifying the steps.

**Illustrative Data Table (Algebra vs Calculus Query styles):**
| Approach | Syntax Style | Example |
| :--- | :--- | :--- |
| **Relational Algebra** | Procedural Operators | $\sigma_{id=5}(Employees)$ |
| **Relational Calculus** | First-Order Logic formulas | $\{t \mid t \in Employees \wedge t[id]=5\}$ |

---

### Q36: What is a Weak Entity Set and how is it represented?
*   **Answer**: An entity set that does not have a primary key of its own and depends on an owner (strong) entity set for its existence. It is represented by a double rectangle, and its relationship is represented by a double diamond.

**Illustrative Data Table (Weak Entity Dependent table):**
| Owner PK (Emp_ID) | Dependent Name (Discriminator) | Relationship |
| :--- | :--- | :--- |
| E101 (FK) | Priya | Spouse |
| E101 (FK) | Rohan | Son |

---

### Q37: Difference between Generalization and Specialization in ER model?
*   **Answer**:
    *   **Generalization**: A bottom-up process combining lower-level entities with common features into a higher-level entity (e.g., Car, Truck $\rightarrow$ Vehicle).
    *   **Specialization**: A top-down process splitting a higher-level entity into lower-level entities based on distinct features (e.g., Employee $\rightarrow$ Engineer, Clerk).

**Illustrative Data Table (Design Approaches):**
| Property | Generalization | Specialization |
| :--- | :--- | :--- |
| **Design direction** | Bottom-up (synthesizing) | Top-down (splitting) |
| **Common attributes** | Moved to super-type | Inherited from super-type |

---

### Q38: How do you map a Many-to-Many (N:N) relationship into tables?
*   **Answer**: Create a separate table for the relationship. This table will contain the primary keys of both participating entities as foreign keys (forming a composite primary key) + any descriptive attributes of the relationship.

**Illustrative Data Table (Takes relation table):**
| Student_ID (FK) | Course_ID (FK) | Enrollment_Date |
| :--- | :--- | :--- |
| S101 | C50 | 2026-07-26 |
| S101 | C60 | 2026-07-26 |

---

### Q39: What is a View and is it stored on disk?
*   **Answer**: A View is a virtual table representing the result of a saved SQL query. It does not store physical data on disk; it dynamically runs the underlying query whenever accessed.

**Illustrative Data Table (Virtual view vs Physical table):**
| Table Type | Disk Space occupied | Data Updated? |
| :--- | :--- | :--- |
| **Physical Table** | Stored on disk blocks | Only when modified |
| **View (Virtual)** | 0 Bytes (stores SQL only) | Real-time when queries run |

---

### Q40: What is a Database Trigger?
*   **Answer**: A trigger is a stored database program that automatically executes (fires) in response to a specific event (like `INSERT`, `UPDATE`, or `DELETE`) occurring on a table.

**Illustrative Data Table (Trigger Event Action map):**
| Table | Event | Action triggered |
| :--- | :--- | :--- |
| `employees` | `AFTER UPDATE` of salary | Insert change logs into `employee_audit` table |
