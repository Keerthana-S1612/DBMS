# Chapter 3: Relational Model & Relational Algebra (Lectures 32 - 61)

This chapter covers the mathematical structure of Relational Databases, defining tables, integrity constraints, and query languages (Relational Algebra and Calculus).

---

## Video 32: Introduction to Relational Model
### English
*   **Concept**: Introduced by Edgar F. Codd (E.F. Codd) in 1970. Represents database data as a collection of relations (tables).
*   **Term mapping**:
    *   Relation = Table
    *   Tuple = Row / Record
    *   Attribute = Column / Field
    *   Cardinality = Number of tuples
    *   Degree (Arity) = Number of attributes

### Tamil (தமிழ்)
*   **விளக்கம்**: 1970-ல் E.F. Codd என்பவரால் அறிமுகப்படுத்தப்பட்டது. இதில் தரவுகள் உறவுகள் (Relations - அதாவது அட்டவணைகள்) வடிவில் சேமிக்கப்படும்.
    *   Relation = அட்டவணை
    *   Tuple = வரிசை (Row)
    *   Attribute = நெடுவரிசை (Column)

---

## Video 33: Domains, Attributes, Tuples, Relations
### English
*   **Domain**: A set of atomic/indivisible values of a specific data type (e.g., Domain of `Age` is positive integers between 1 and 120).
*   **Relation Schema**: $R(A_1, A_2, ..., A_n)$ where $R$ is the relation name and $A_i$ are attributes.
*   **Relation Instance**: $r(R)$ is a set of tuples $t = \langle v_1, v_2, ..., v_n \rangle$ where each $v_i \in Domain(A_i)$.

### Tamil (தமிழ்)
*   **விளக்கம்**:
    *   **டொமைன் (Domain)**: ஒரு நெடுவரிசைக்கு அனுமதிக்கப்பட்ட மதிப்புகளின் தொகுப்பு (எ.கா: மார்க் என்பது 0 முதல் 100 வரை மட்டுமே இருக்க வேண்டும்).
    *   **Relation Schema**: அட்டவணையின் ப்ளூபிரிண்ட்.

---

## Video 34: Characteristics of Relations
### English
1.  **Ordering of tuples**: Order of rows does not matter.
2.  **Ordering of attributes**: Order of columns does not matter.
3.  **Uniqueness of tuples**: All rows must be distinct (mathematically, a relation is a *set* of tuples, and sets cannot contain duplicate elements).
4.  **Atomic values**: Each cell must contain exactly one value (1st Normal Form constraint).

### Tamil (தமிழ்)
*   **உறவுகளின் பண்புகள்**:
  1. வரிகளின் வரிசை முக்கியமல்ல.
  2. நெடுவரிசைகளின் வரிசை முக்கியமல்ல.
  3. இரட்டை வரிகள் (Duplicates) இருக்கக் கூடாது.
  4. ஒவ்வொரு கட்டத்திலும் (Cell) ஒரே ஒரு மதிப்பு மட்டுமே இருக்க வேண்டும்.

---

## Video 35: Relational Integrity Constraints
### English
Integrity constraints are rules defined to ensure data validity and consistency.
*   **Types**: Domain constraints, Key constraints, Referential integrity constraints.

### Tamil (தமிழ்)
*   **ஒருமைப்பாடு எல்லைகள் (Integrity Constraints)**:
  * தரவுகளின் நம்பகத்தன்மையை உறுதி செய்ய டேபிள்களில் விதிக்கப்படும் விதிகள்.

---

## Video 36: Domain Constraints
### English
*   **Concept**: Specifies that the value of each attribute $A$ must be an atomic value from the domain $Dom(A)$.
*   **Enforcement**: Handled via data types (e.g., `INT`, `VARCHAR`) and checking rules (e.g., `CHECK (salary > 0)`).

### Tamil (தமிழ்)
*   **டொமைன் கட்டுப்பாடு**:
  * ஒவ்வொரு நெடுவரிசையிலும் அதன் டொமைன் சார்ந்த சரியான தரவுகள் மட்டுமே நுழைய முடியும்.

---

## Video 37: Keys: Super Key, Candidate Key, Primary Key
### English
*   **Super Key**: A set of one or more attributes that, taken collectively, allows us to identify uniquely a tuple in the relation.
*   **Candidate Key**: A **minimal** super key. A set of attributes that uniquely identifies tuples, such that no proper subset of it can identify tuples.
*   **Primary Key**: The candidate key selected by the database designer to uniquely identify tuples in a relation. Cannot contain null values.

### Tamil (தமிழ்)
*   **திறவுகோல் வகைகள் (Super vs Candidate vs Primary)**:
  * **Super Key**: தனித்துவமாக அடையாளம் காணும் ஏதேனும் ஒரு பண்புகளின் தொகுப்பு.
  * **Candidate Key (வேட்பாளர் கீ)**: மிகக் குறைந்த அளவிலான பண்புகளைக் கொண்ட Super Key. இதன் எந்த ஒரு பகுதியும் தனித்து ஒரு வரியைக் கண்டறிய முடியாது (Minimal Super Key).
  * **Primary Key (முதன்மை கீ)**: Candidate Key-களில் இருந்து நிர்வாகியால் தேர்ந்தெடுக்கப்படும் முக்கிய திறவுகோல். இதில் NULL மதிப்புகள் இருக்கக் கூடாது.

---

## Video 38: Referential Integrity Constraints (Foreign Key)
### English
*   **Concept**: Ensures relationships between tuples in two relations are valid.
*   **Rule**: A set of attributes $FK$ in relation $R_1$ is a foreign key referencing relation $R_2$ if:
    1.  The attributes in $FK$ have the same domain as the primary key $PK$ of $R_2$.
    2.  A value of $FK$ in $R_1$ either matches a $PK$ value in some tuple of $R_2$, or is `NULL`.

### Tamil (தமிழ்)
*   **வெளித் திறவுகோல் (Foreign Key)**:
  * இரண்டு டேபிள்களுக்கு இடையே உள்ள தொடர்பை உறுதி செய்யும் விதி. $R_1$-ல் இருக்கும் Foreign Key-ன் மதிப்பு கண்டிப்பாக $R_2$-ன் Primary Key-ல் இருக்க வேண்டும் அல்லது `NULL` ஆக இருக்க வேண்டும்.

---

## Video 39: Referential Actions (On Delete Cascade/Set Null)
### English
What happens if you delete a tuple in $R_2$ referenced by $R_1$?
*   **Restrict**: Reject the delete operation.
*   **Cascade**: Automatically delete referencing tuples in $R_1$.
*   **Set Null**: Set referencing foreign key attributes in $R_1$ to `NULL`.
*   **Set Default**: Set referencing attributes to a default value.

### Tamil (தமிழ்)
*   **வெளிவிசை செயல்கள்**:
  * முதன்மை டேபிளில் ஒரு வரியை அழிக்கும்போது:
    * **Cascade**: சார்ந்திருக்கும் மற்ற டேபிள் வரிகளையும் தானாகவே அழித்துவிடும்.
    * **Set Null**: சார்ந்திருக்கும் வரிகளின் மதிப்பை `NULL` என்று மாற்றும்.

---

## Video 40: Relational Algebra Overview
### English
*   **Definition**: A procedural query language. It consists of a set of operations that take one or two relations as input and produce a new relation as output.
*   **Categories**: Unary operations (operate on one relation) and Binary/Set operations (operate on two relations).

### Tamil (தமிழ்)
*   **ரிலேஷனல் அல்ஜிப்ரா அறிமுகம்**:
  * டேபிள்களில் இருந்து நமக்குத் தேவையான தரவை எவ்வாறு எடுக்க வேண்டும் என்று கணித வடிவில் எழுதும் ஒரு வழிமுறை மொழி (Procedural Query Language).

---

## Video 41: Select Operation ($\sigma$)
### English
*   **Concept**: Selects a subset of tuples from a relation that satisfy a specific selection condition.
*   **Notation**: \[\sigma_{P}(r)\]
    Where $P$ is the selection predicate (boolean formula) and $r$ is the relation.
*   **Example**: Select employees from HR department: \[\sigma_{department = 'HR'}(Employee)\]

### Tamil (தமிழ்)
*   **தேர்வு செயல்முறை ($\sigma$)**:
  * குறிப்பிட்ட நிபந்தனைக்குட்பட்ட வரிகளை (Rows) மட்டும் வடிகட்டி எடுக்கும் செயல்முறை.

---

## Video 42: Project Operation ($\pi$)
### English
*   **Concept**: Selects specific columns from a relation and discards the rest.
*   **Notation**: \[\pi_{A_1, A_2, ..., A_k}(r)\]
*   **Duplicate Elimination**: Since relations are mathematical sets, duplicates are automatically removed from the projected result.
*   **Example**: Project Names of all employees: \[\pi_{name}(Employee)\]

### Tamil (தமிழ்)
*   **நெடுவரிசை தேர்வு ($\pi$)**:
  * நமக்குத் தேவையான நெடுவரிசைகளை (Columns) மட்டும் தனியாக எடுத்துத் தரும். இதில் டூப்ளிகேட் மதிப்புகள் தானாகவே நீக்கப்படும்.

---

## Video 43: Rename Operation ($\rho$)
### English
*   **Concept**: Renames the result of a relational algebra expression or a relation name.
*   **Notation**: \[\rho_{x}(E) \quad \text{or} \quad \rho_{x(A_1, A_2, ..., A_n)}(E)\]
    Where $x$ is the new name of the relation.

### Tamil (தமிழ்)
*   **பெயர் மாற்றம் ($\rho$)**:
  * ஒரு அட்டவணைக்கோ அல்லது நெடுவரிசைக்கோ தற்காலிகமாகப் புதிய பெயர் சூட்டப் பயன்படுகிறது.

---

## Video 44: Set Union Operation ($\cup$)
### English
*   **Concept**: Combines tuples from two relations.
*   **Notation**: \[r \cup s\]
*   **Compatibility Rules**:
    1.  Arity (number of attributes) of $r$ and $s$ must be the same.
    2.  Domains of corresponding attributes must be compatible (type-compatible).

### Tamil (தமிழ்)
*   **யூனியன் ($\cup$)**:
  * இரண்டு டேபிள்களில் உள்ள வரிகளையும் ஒன்றிணைக்கும்.
  * **விதி**: இரண்டு டேபிள்களும் ஒரே எண்ணிக்கையிலான நெடுவரிசைகளையும், அவற்றின் தரவு வகைகளும் (Data Types) ஒன்றாக இருக்க வேண்டும்.

---

## Video 45: Set Intersection Operation ($\cap$)
### English
*   **Concept**: Returns tuples that exist in **both** relations.
*   **Notation**: \[r \cap s = r - (r - s)\]
*   **Requirements**: Must be union-compatible.

### Tamil (தமிழ்)
*   **வெட்டுதல் ($\cap$)**:
  * இரண்டு டேபிள்களிலும் பொதுவாக (Common) இருக்கும் வரிகளை மட்டும் எடுத்துத் தரும்.

---

## Video 46: Set Difference Operation ($-$)
### English
*   **Concept**: Returns tuples that exist in $r$ but **not** in $s$.
*   **Notation**: \[r - s\]
*   **Requirements**: Must be union-compatible. Note that $r - s \neq s - r$.

### Tamil (தமிழ்)
*   **வேறுபாடு ($-$)**:
  * முதல் டேபிளில் இருந்து இரண்டாவது டேபிளில் இருக்கும் வரிகளை நீக்கிவிட்டு மீதமுள்ள வரிகளைத் தரும்.

---

## Video 47: Cartesian Product Operation ($\times$)
### English
*   **Concept**: Combines info from any two relations.
*   **Notation**: \[r \times s\]
*   **Math Rules**:
    *   If $r$ has $n_1$ tuples and degree $d_1$, and $s$ has $n_2$ tuples and degree $d_2$:
    *   $r \times s$ has $n_1 \times n_2$ tuples and degree $d_1 + d_2$.

### Tamil (தமிழ்)
*   **கார்ட்டீசியன் பெருக்கல் ($\times$)**:
  * இரண்டு டேபிள்களில் உள்ள அனைத்து வரிகளையும் சாத்தியமான அனைத்து வழிகளிலும் இணைக்கும்.
  * **கணிதம்**: முதல் டேபிளில் 3 வரிகள், இரண்டாவது டேபிளில் 4 வரிகள் இருந்தால், முடிவில் $3 \times 4 = 12$ வரிகள் கிடைக்கும். நெடுவரிசைகள் கூட்டப்படும் ($d_1 + d_2$).

---

## Video 48: Composition of Operations
### English
*   **Concept**: Nesting relational algebra operations to write complex query constraints.
*   **Example**: Find names of employees earning more than 50000:
    \[\pi_{name}(\sigma_{salary > 50000}(Employee))\]

### Tamil (தமிழ்)
*   **செயல்பாடுகளின் கூட்டு**:
  * பல ரிலேஷனல் அல்ஜிப்ரா குறியீடுகளை ஒன்றாக இணைத்து சிக்கலான குவரிகளை எழுதுவது (உதாரணம்: சம்பளம் 50000-க்கு மேல் உள்ள ஊழியர்களின் பெயர்களை மட்டும் எடுப்பது).

---

## Video 49: Relational Joins Overview
### English
*   **Concept**: Used to combine related tuples from two relations into a single tuple. Joins are equivalent to a Cartesian Product followed by a Selection.

### Tamil (தமிழ்)
*   **ஜாயின் (Join) அறிமுகம்**:
  * தொடர்புடைய இரு வேறு டேபிள் தரவுகளை கார்ட்டீசியன் பெருக்கல் மற்றும் ஃபில்டர் மூலம் இணைத்து ஒரே டேபிளாகத் தரும் செயல்முறை.

---

## Video 50: Theta Join ($\bowtie_{\theta}$)
### English
*   **Concept**: General join that combines tuples from two relations based on a general condition $\theta$.
*   **Notation**: \[r \bowtie_{\theta} s = \sigma_{\theta}(r \times s)\]

### Tamil (தமிழ்)
*   **தீட்டா ஜாயின் ($\bowtie_{\theta}$)**:
  * எந்தவொரு நிபந்தனையின் அடிப்படையிலும் (உதாரணம்: $>$, $<$, $\ne$) வரிகளை இணைப்பது.

---

## Video 51: Equi-Join
### English
*   **Concept**: A specific case of Theta Join where the join condition consists of equality comparisons ($=$) only.

### Tamil (தமிழ்)
*   **ஈக்வி ஜாயின்**:
  * சமநிலை நிபந்தனையை ($=$) மட்டுமே கொண்டு வரிகளை இணைக்கும் ஜாயின்.

---

## Video 52: Natural Join ($\bowtie$)
### English
*   **Concept**: Joins tuples based on common attribute names. The common attributes appear only once in the final relation.
*   **Math**: Automatically checks for equality on attributes with the same name.

### Tamil (தமிழ்)
*   **இயற்கை ஜாயின் ($\bowtie$)**:
  * இரு டேபிள்களிலும் ஒரே பெயர் கொண்ட நெடுவரிசைகளைத் தானாகவே கண்டறிந்து சமப்படுத்தி இணைக்கும். பொதுவான நெடுவரிசை முடிவில் ஒரு முறை மட்டுமே காட்டப்படும்.

---

## Video 53: Outer Joins (Left, Right, Full)
### English
Keeps tuples even if they do not match in the join condition, padding unmatched fields with `NULL`.
*   **Left Outer Join ($\rtimes$)**: Keeps all tuples from the left relation.
*   **Right Outer Join ($\ltimes$)**: Keeps all tuples from the right relation.
*   **Full Outer Join ($\bowtie$)**: Keeps all tuples from both relations.

### Tamil (தமிழ்)
*   **வெளிப்புற ஜாயின் (Outer Join)**:
  * மேட்ச் ஆகாத வரிகளையும் டேபிளில் வைத்துக்கொண்டு, இல்லாத மதிப்புகளுக்கு `NULL` என நிரப்பும்.
  * **Left Outer**: இடது டேபிளில் உள்ள அனைத்து வரிகளையும் அப்படியே வைக்கும்.

---

## Video 54: Division Operator in Relational Algebra
### English
*   **Concept**: Used for queries containing the phrase "for all" or "every".
*   **Notation**: \[r \div s\]
*   **Example**: Find students who have taken *all* courses offered by the CS department.

### Tamil (தமிழ்)
*   **வகுத்தல் செயல்முறை ($\div$)**:
  * "அனைத்து" (For all / Every) என்ற நிபந்தனை கொண்ட குவரிகளுக்கு இது பயன்படும் (உதாரணம்: அனைத்து பாடங்களையும் படித்த மாணவர்களைக் கண்டறிவது).

---

## Videos 55 & 56: Solved Query Problems
### English
*   **Problem**: Writing relational algebra queries for real-world scenarios.
*   *Example Query*: Names of projects worked on by employee 'Amit':
    \[\pi_{pname}(\sigma_{ename = 'Amit'}(Employee \bowtie Works\_on \bowtie Project))\]

### Tamil (தமிழ்)
*   **தீர்க்கப்பட்ட கணக்குகள்**:
  * நிஜ உலக டேபிள் அமைப்புகளை வைத்து குவரிகளை ரிலேஷனல் அல்ஜிப்ரா வடிவில் எழுதுவது.

---

## Video 57: Relational Calculus Introduction
### English
*   **Concept**: Non-procedural (declarative) query language. Describes *what* information is needed, not *how* to retrieve it.
*   **Types**: Tuple Relational Calculus (TRC) and Domain Relational Calculus (DRC).

### Tamil (தமிழ்)
*   **ரிலேஷனல் கால்குலஸ்**:
  * இது வழிமுறையற்ற (Declarative) மொழி. தரவை *எப்படி* எடுக்க வேண்டும் என்று கூறாமல், *என்ன* தரவு தேவை என்பதை மட்டும் சூத்திர வடிவில் எழுதும் முறை.

---

## Video 58: Tuple Relational Calculus (TRC)
### English
*   **Notation**: \[\{ t \mid P(t) \}\]
    Where $t$ is a tuple variable and $P(t)$ is a formula.
*   **Example**: Find details of employees earning > 50000:
    \[\{ t \mid t \in Employee \wedge t[salary] > 50000 \}\]

### Tamil (தமிழ்)
*   **டியூப்பிள் கால்குலஸ் (TRC)**:
  * வரிகளை (Tuples) வேரியபிளாகக் கொண்டு சூத்திரங்களை எழுதுவது.

---

## Video 59: Domain Relational Calculus (DRC)
### English
*   **Notation**: \[\{ \langle x_1, x_2, ..., x_n \rangle \mid P(x_1, x_2, ..., x_n) \}\]
    Where $x_i$ represent domain variables (column values) rather than entire tuples.

### Tamil (தமிழ்)
*   **டொமைன் கால்குலஸ் (DRC)**:
  * நெடுவரிசை மதிப்புகளை (Domain Variables) அடிப்படையாகக் கொண்டு சூத்திரங்களை அமைப்பது.

---

## Video 60: TRC vs DRC Solved Queries
### English
*   **Equivalence**: Relational algebra, TRC, and DRC are equivalent in power for safe queries.
*   **Solved examples**: Converting relational algebra statements into TRC and DRC formulas.

### Tamil (தமிழ்)
*   **ஒப்பீட்டு கணக்குகள்**:
  * ரிலேஷனல் அல்ஜிப்ரா மற்றும் கால்குலஸ் சூத்திரங்களை ஒன்றுக்கொன்று மாற்றி அமைக்கும் கணக்குகள்.

---

## Video 61: Schema Diagrams
### English
*   **Concept**: Graphical representation showing the structural schema of relations, including tables, attribute types, and primary key-to-foreign key referential links.

### Tamil (தமிழ்)
*   **ஸ்கீமா வரைபடம்**:
  * தரவுத்தளத்தின் அனைத்து அட்டவணைகளையும், அவற்றின் சாவித் தொடர்புகளையும் (PK-FK Links) பட வடிவில் காட்டும் வரைபடம்.
