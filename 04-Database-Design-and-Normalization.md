# Chapter 4: Database Design & Normalization theory (Lectures 62 - 77)

This chapter explains how to design optimal relational databases using Normalization theory. It covers data anomalies, functional dependencies, candidate keys, canonical covers, decompositions, and normal forms from 1NF to 4NF.

---

## Lecture 62: Introduction to Database Design & Anomalies
*   **Goal**: Minimize data redundancy and prevent database update anomalies.
*   **Insertion Anomaly**: We cannot insert details of a new project unless we assign at least one employee to it.
*   **Deletion Anomaly**: If we fire the only employee working on a project, we accidentally delete all information about that project.
*   **Update Anomaly**: If a project's budget changes, we must update this budget in every employee's row who works on it. Failure to do so leads to inconsistency.

**Unnormalized Table containing Anomalies:**
| Emp_ID | Name | Proj_ID | Proj_Name | Budget |
| :--- | :--- | :--- | :--- | :--- |
| E1 | Amit | P1 | Alpha | 50000 |
| E2 | Priya | P1 | Alpha | 50000 |
| E3 | Rahul | P2 | Beta | 120000 |

*   *Update Anomaly*: Changing budget of P1 requires updating 2 rows.
*   *Insertion Anomaly*: Cannot add a new project `Gamma` if no employee is assigned yet.
*   *Deletion Anomaly*: Deleting Rahul (E3) removes project P2 entirely.

---

## Lecture 63: Functional Dependency (FD) Definition
*   **Concept**: A constraint that specifies the relationship between two sets of attributes in a relation.
*   **Definition**: Let $R$ be a relation schema, and $\alpha \subseteq R$, $\beta \subseteq R$. The functional dependency
    \[\alpha \rightarrow \beta\]
    holds on $R$ if, in any legal relation instance $r(R)$, for all pairs of tuples $t_1$ and $t_2$ in $r$ such that $t_1[\alpha] = t_2[\alpha]$, it is also true that $t_1[\beta] = t_2[\beta]$.
    *   *Meaning*: If two rows have the same value for column $\alpha$, they must have the same value for column $\beta$. We say $\alpha$ functionally determines $\beta$.

---

## Lecture 64: Trivial vs. Non-Trivial Functional Dependencies
Let $\alpha \rightarrow \beta$ be an FD.
*   **Trivial FD**: If $\beta \subseteq \alpha$. It is always satisfied (e.g., $\{Roll\_No, Name\} \rightarrow Roll\_No$).
*   **Non-Trivial FD**: If $\beta \not\subseteq \alpha$.
*   **Completely Non-Trivial FD**: If $\alpha \cap \beta = \emptyset$ (no common attributes, e.g., $ID \rightarrow Name$).

---

## Lecture 65: Inference Rules (Armstrong's Axioms)
Rules to find all functional dependencies logically implied by a set of FDs $F$.
1.  **Reflexivity**: If $\beta \subseteq \alpha$, then $\alpha \rightarrow \beta$.
2.  **Augmentation**: If $\alpha \rightarrow \beta$, then $\gamma\alpha \rightarrow \gamma\beta$ for any $\gamma$.
3.  **Transitivity**: If $\alpha \rightarrow \beta$ and $\beta \rightarrow \gamma$, then $\alpha \rightarrow \gamma$.
*   **Secondary Rules**:
    *   **Union**: If $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$, then $\alpha \rightarrow \beta\gamma$.
    *   **Decomposition**: If $\alpha \rightarrow \beta\gamma$, then $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$.
    *   **Pseudo-transitivity**: If $\alpha \rightarrow \beta$ and $\gamma\beta \rightarrow \delta$, then $\alpha\gamma \rightarrow \delta$.

---

## Lecture 66: Attribute Closure and Finding Candidate Keys
*   **Attribute Closure ($\alpha^+$)**: The set of all attributes functionally determined by attribute set $\alpha$ under a set of FDs $F$.
*   **Algorithm**:
    1.  Initialize $Closure = \alpha$.
    2.  Repeat until no changes: If there is an FD $Y \rightarrow Z$ in $F$ such that $Y \subseteq Closure$, then add $Z$ to $Closure$.
*   **Finding Candidate Keys**: An attribute set $K$ is a candidate key for relation $R$ if:
    1.  $K^+ = R$ (K determines all attributes in the relation).
    2.  No proper subset of $K$ has a closure equal to $R$ (minimality constraint).

---

## Lectures 67 & 68: Candidate Keys Identification: Solved Problems
Let $R(A, B, C, D, E)$ with FDs $F = \{A \rightarrow BC, CD \rightarrow E, B \rightarrow D, E \rightarrow A\}$.
Find all candidate keys:
1.  Identify essential attributes (never appear on the right side of any FD). Here, $C$ never appears on the right. Thus, $C$ must be part of every candidate key.
2.  Test closures of combinations containing $C$:
    *   Test $\{A, C\}^+$: $\{A, C\}^+ \rightarrow \{A, C, B\} \text{ (since } A \rightarrow BC) \rightarrow \{A, B, C, D\} \text{ (since } B \rightarrow D) \rightarrow \{A, B, C, D, E\} \text{ (since } CD \rightarrow E)$.
    *   Since $\{A, C\}^+ = R$, $\{A, C\}$ is a candidate key.
    *   Since $E \rightarrow A$, we replace $A$ with $E$: $\{E, C\}$ is also a candidate key.
    *   Since $A \rightarrow BC$, let's check $\{B, C\}^+$: $\{B, C\}^+ \rightarrow \{B, C, D\} \rightarrow \{B, C, D, E\} \rightarrow \{A, B, C, D, E\}$. So $\{B, C\}$ is a candidate key.
    *   Since $B \rightarrow D$, we check $\{CD\}^+ \rightarrow \{C, D, E\} \rightarrow \{C, D, E, A\} \rightarrow \{A, B, C, D, E\}$. So $\{CD\}$ is a candidate key.
*   **Candidate Keys**: $\{AC\}, \{EC\}, \{BC\}, \{CD\}$.

---

## Lecture 69: Equivalence of FDs & Canonical Cover
*   **Canonical Cover ($F_c$)**: A simplified, minimal set of functional dependencies equivalent to $F$, containing no redundant FDs or extraneous attributes.
*   **Rules for Extraneous Attributes**:
    *   In $A \rightarrow B$, attribute $x$ in $A$ is extraneous if $F$ logically implies $(A - \{x\}) \rightarrow B$.
    *   Attribute $y$ in $B$ is extraneous if the set $(F - \{A \rightarrow B\}) \cup \{A \rightarrow (B - \{y\})\}$ logically implies $A \rightarrow B$.

---

## Lecture 70: Lossless Join Decomposition
*   **Concept**: Decomposing relation $R$ into $R_1$ and $R_2$ is **lossless** if we can reconstruct the original relation $R$ by joining $R_1$ and $R_2$ without producing spurious/fake tuples.
*   **Checking Rule**: A decomposition of $R$ into $R_1$ and $R_2$ is lossless-join if at least one of these FDs is in $F^+$:
    1.  $(R_1 \cap R_2) \rightarrow R_1$
    2.  $(R_1 \cap R_2) \rightarrow R_2$
    *(The common attribute between tables must be a candidate key for at least one of the tables).*

---

## Lecture 71: Dependency Preserving Decomposition
*   **Concept**: Ensures that all functional dependencies in $F$ can be checked inside the decomposed tables individually without doing joins.
*   **Rule**: If $R$ is decomposed into $R_1, R_2, ..., R_n$, let $F_i$ be the projection of $F$ on $R_i$. The decomposition is dependency-preserving if:
    \[(F_1 \cup F_2 \cup ... \cup F_n)^+ = F^+\]

---

## Lecture 72: First Normal Form (1NF)
*   **Rule**: A relation is in 1NF if and only if the domain of each attribute contains only **atomic (indivisible) values**, and there are no multi-valued or composite attributes.

**1NF Violation Table (Multi-valued attribute):**
| Student | Phone_Numbers |
| :--- | :--- |
| Amit | 99887766, 88776655 |

**Resolved 1NF Schema Table:**
| Student | Phone_Number |
| :--- | :--- |
| Amit | 99887766 |
| Amit | 88776655 |

---

## Lecture 73: Second Normal Form (2NF)
*   **Rule**: A relation is in 2NF if:
    1.  It is in 1NF.
    2.  There is **no partial dependency**.
*   **Partial Dependency**: A non-prime attribute depends on a proper subset of a candidate key.
    \[\text{Proper Subset of Candidate Key} \rightarrow \text{Non-prime Attribute} \quad (\text{Not Allowed})\]

**2NF Violation Table:**
*   Candidate Key: `{Emp_ID, Proj_ID}`
*   FD: `Proj_ID -> Proj_Name` (Partial Dependency because Proj_Name depends on a subset of the key).
| Emp_ID (Key) | Proj_ID (Key) | Hours_Worked | Proj_Name |
| :--- | :--- | :--- | :--- |
| E1 | P1 | 40 | Alpha |
| E2 | P1 | 20 | Alpha |

**Resolved 2NF Schema (Decomposed):**

*Table 1: works_on*
| Emp_ID | Proj_ID | Hours_Worked |
| :--- | :--- | :--- |
| E1 | P1 | 40 |
| E2 | P1 | 20 |

*Table 2: projects*
| Proj_ID | Proj_Name |
| :--- | :--- |
| P1 | Alpha |

---

## Lecture 74: Third Normal Form (3NF)
*   **Rule**: A relation $R$ is in 3NF if it is in 2NF and has **no transitive dependency**. Formally, for every non-trivial FD $\alpha \rightarrow \beta$:
    1.  $\alpha$ is a super key of $R$, OR
    2.  $\beta$ is a prime attribute (member of a candidate key).

**3NF Violation Table:**
*   Candidate Key: `{Emp_ID}`
*   FDs: `Emp_ID -> Dept_ID` and `Dept_ID -> Dept_Name`.
*   *Violation*: `Dept_ID -> Dept_Name` violates 3NF because `Dept_ID` is not a super key, and `Dept_Name` is not a prime attribute (Transitive Dependency).
| Emp_ID (Key) | Salary | Dept_ID | Dept_Name |
| :--- | :--- | :--- | :--- |
| E1 | 75000 | D01 | HR |

**Resolved 3NF Schema (Decomposed):**

*Table 1: employees*
| Emp_ID | Salary | Dept_ID |
| :--- | :--- | :--- |
| E1 | 75000 | D01 |

*Table 2: departments*
| Dept_ID | Dept_Name |
| :--- | :--- |
| D01 | HR |

---

## Lecture 75: Boyce-Codd Normal Form (BCNF)
*   **Rule**: A relation $R$ is in BCNF if, for every non-trivial FD $\alpha \rightarrow \beta$ in $F$:
    1.  $\alpha$ is a super key of $R$.
*   **Note**: BCNF does not allow the second condition of 3NF (where $\beta$ is a prime attribute).

---

## Lecture 76: Comparison of 3NF vs BCNF
*   **BCNF**: Stronger, guarantees no redundancy due to functional dependencies. However, BCNF decomposition is **not always dependency-preserving**.
*   **3NF**: Slightly weaker, may allow minor redundancy. However, 3NF decomposition is **always lossless and dependency-preserving**.

---

## Lecture 77: Fourth Normal Form (4NF)
*   **Multi-valued Dependency (MVD)**: Denoted by $\alpha \twoheadrightarrow \beta$. Holds when the presence of one value in a row implies the presence of other values.
*   **Rule**: A relation is in 4NF if, for every non-trivial MVD $\alpha \twoheadrightarrow \beta$ in $R$:
    1.  $\alpha$ is a super key.
