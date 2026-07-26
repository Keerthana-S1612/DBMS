# Chapter 4: Database Design & Normalization theory (Lectures 62 - 77)

This chapter explains how to design optimal relational databases using Normalization theory. It covers data anomalies, functional dependencies, finding candidate keys, canonical covers, lossless decompositions, and normal forms from 1NF to 4NF.

---

## Video 62: Introduction to Database Design & Anomalies
### English
*   **Goal of Good Design**: Minimize data redundancy and prevent data anomalies.
*   **Database Anomalies**:
    1.  **Insertion Anomaly**: Cannot insert details of a new department unless at least one employee is hired (due to composite key constraints or empty fields).
    2.  **Deletion Anomaly**: If you delete the only employee in a department, you accidentally lose all information about that department.
    3.  **Update (Modification) Anomaly**: If a department manager changes, you must update this name in all employee rows, otherwise data becomes inconsistent.

### Tamil (தமிழ்)
*   **விளக்கம்**: தரவுத்தள வடிவமைப்பு மற்றும் முரண்பாடுகள் (Anomalies):
  1. **செருகல் முரண்பாடு (Insertion Anomaly)**: ஒரு மாணவர் சேராதவரை ஒரு புதிய வகுப்பை நாம் டேபிளில் சேர்க்க முடியாமல் போவது.
  2. **நீக்குதல் முரண்பாடு (Deletion Anomaly)**: ஒரு ஊழியரை நீக்கும்போது, அவர் சார்ந்த துறையின் விவரங்களும் தானாக அழிந்து போவது.
  3. **புதுப்பித்தல் முரண்பாடு (Update Anomaly)**: ஒரு விவரத்தை மாற்றும்போது, பல வரிகளில் மாற்ற வேண்டிய கட்டாயம் இருப்பது (ஒன்றில் மாறாவிட்டாலும் குழப்பம் ஏற்படும்).

---

## Video 63: Functional Dependency (FD) Definition
### English
*   **Concept**: A constraint that specifies the relationship between two sets of attributes in a relation.
*   **Mathematical Definition**: Let $R$ be a relation schema, and $\alpha \subseteq R$, $\beta \subseteq R$. The functional dependency \[\alpha \rightarrow \beta\]
    holds on $R$ if, in any legal relation instance $r(R)$, for all pairs of tuples $t_1$ and $t_2$ in $r$ such that $t_1[\alpha] = t_2[\alpha]$, it is also true that $t_1[\beta] = t_2[\beta]$.
    *   *Translation*: If two rows have the same value for column $\alpha$, they must have the same value for column $\beta$. We say $\alpha$ functionally determines $\beta$.

### Tamil (தமிழ்)
*   **செயல்பாட்டு சார்பு (Functional Dependency - FD)**:
  * டேபிளில் உள்ள நெடுவரிசைகளுக்கு இடையே உள்ள தொடர்பு. $\alpha \rightarrow \beta$ என்றால், $\alpha$-வின் மதிப்பு தெரிந்தால், $\beta$-வின் மதிப்பைத் துல்லியமாகக் கண்டறியலாம் என்று அர்த்தம் (எ.கா: ரோல் நம்பர் $\rightarrow$ பெயர்).

---

## Video 64: Trivial vs. Non-Trivial Functional Dependencies
### English
Let $\alpha \rightarrow \beta$ be an FD.
*   **Trivial FD**: If $\beta \subseteq \alpha$. It is always satisfied (e.g., $\{Roll\_No, Name\} \rightarrow Roll\_No$).
*   **Non-Trivial FD**: If $\beta \not\subseteq \alpha$.
*   **Completely Non-Trivial FD**: If $\alpha \cap \beta = \emptyset$ (no common attributes).

### Tamil (தமிழ்)
*   **டிரிவியல் vs நான்-டிரிவியல்**:
  * **டிரிவியல் (Trivial)**: வலது பக்கத்தில் உள்ள பண்பு, இடது பக்கத்தின் ஒரு பகுதியாக இருப்பது (எ.கா: $\{ID, Name\} \rightarrow ID$). இது எப்போதும் உண்மையாகவே இருக்கும்.
  * **நான்-டிரிவியல் (Non-Trivial)**: வலது பக்கத்தில் புதிய பண்பு இருப்பது (எ.கா: $ID \rightarrow Name$).

---

## Video 65: Inference Rules (Armstrong's Axioms)
### English
Rules to find all functional dependencies logically implied by a set of FDs $F$.
1.  **Reflexivity**: If $\beta \subseteq \alpha$, then $\alpha \rightarrow \beta$.
2.  **Augmentation**: If $\alpha \rightarrow \beta$, then $\gamma\alpha \rightarrow \gamma\beta$ for any $\gamma$.
3.  **Transitivity**: If $\alpha \rightarrow \beta$ and $\beta \rightarrow \gamma$, then $\alpha \rightarrow \gamma$.
*   **Secondary Rules**:
    *   **Union**: If $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$, then $\alpha \rightarrow \beta\gamma$.
    *   **Decomposition**: If $\alpha \rightarrow \beta\gamma$, then $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$.
    *   **Pseudo-transitivity**: If $\alpha \rightarrow \beta$ and $\gamma\beta \rightarrow \delta$, then $\alpha\gamma \rightarrow \delta$.

### Tamil (தமிழ்)
*   **ஆம்ஸ்ட்ராங்கின் விதிகள் (Armstrong's Axioms)**:
  1. **பிரதிபலிப்பு (Reflexivity)**: $\beta$ என்பது $\alpha$-வின் பகுதி எனில், $\alpha \rightarrow \beta$.
  2. **பெருக்குதல் (Augmentation)**: $\alpha \rightarrow \beta$ எனில், $\gamma\alpha \rightarrow \gamma\beta$.
  3. **கடத்துகை (Transitivity)**: $\alpha \rightarrow \beta$ மற்றும் $\beta \rightarrow \gamma$ எனில், $\alpha \rightarrow \gamma$.

---

## Video 66: Attribute Closure and Finding Candidate Keys
### English
*   **Attribute Closure ($\alpha^+$)**: The set of all attributes functionally determined by attribute set $\alpha$ under a set of FDs $F$.
*   **Algorithm**:
    1.  Initialize $Closure = \alpha$.
    2.  Repeat until no changes: If there is an FD $Y \rightarrow Z$ in $F$ such that $Y \subseteq Closure$, then add $Z$ to $Closure$.
*   **Finding Candidate Keys**: An attribute set $K$ is a candidate key for relation $R$ if:
    1.  $K^+ = R$ (K determines all attributes in the relation).
    2.  No proper subset of $K$ has a closure equal to $R$ (minimality constraint).

### Tamil (தமிழ்)
*   **பண்புக் குளோஷர் ($\alpha^+$) மற்றும் சாவி கண்டறிதல்**:
  * **குளோஷர்**: ஒரு குறிப்பிட்ட பண்பின் மூலம் டேபிளில் உள்ள வேறு எந்தெந்த பண்புகளை எல்லாம் கண்டறிய முடியும் என்ற பட்டியல்.
  * **Candidate Key கண்டறியும் முறை**:
    1. ஒரு வேரியபிளின் குளோஷர் முழு அட்டவணையையும் ($R$) தர வேண்டும் ($\alpha^+ = R$).
    2. அதிலிருந்து எந்த ஒரு பகுதியையும் நீக்க முடியாது (Minimality).

---

## Videos 67 & 68: Candidate Key Solved Problems
### English
*   **Example Problem**: Let $R(A, B, C, D, E)$ with FDs $F = \{A \rightarrow BC, CD \rightarrow E, B \rightarrow D, E \rightarrow A\}$.
    *   Check closure of $A$: $A^+ = \{A\} \rightarrow \{A, B, C\} \text{ (since } A \rightarrow BC) \rightarrow \{A, B, C, D\} \text{ (since } B \rightarrow D) \rightarrow \{A, B, C, D, E\} \text{ (since } CD \rightarrow E)$.
    *   Since $A^+ = R$, and $A$ is a single attribute, $A$ is a **Candidate Key**.
    *   Similarly, we check other closures to find all keys: $\{A\}, \{E\}, \{CD\}, \{BC\}$ are candidate keys.

### Tamil (தமிழ்)
*   **சாவி கண்டறிதல் - தீர்க்கப்பட்ட கணக்குகள்**:
  * தாள்களில் கணக்கிட்டு FDs தொகுதியிலிருந்து Candidate Key-களைக் கண்டறியும் பயிற்சி கணக்குகள்.

---

## Video 69: Equivalence of FDs & Canonical Cover
### English
*   **Canonical Cover ($F_c$)**: A simplified, minimal set of functional dependencies equivalent to $F$, containing no redundant FDs or extraneous attributes.
*   **Rules for Extraneous Attributes**:
    *   In $A \rightarrow B$, attribute $x$ in $A$ is extraneous if $F$ logically implies $(A - \{x\}) \rightarrow B$.
    *   Attribute $y$ in $B$ is extraneous if the set $(F - \{A \rightarrow B\}) \cup \{A \rightarrow (B - \{y\})\}$ logically implies $A \rightarrow B$.

### Tamil (தமிழ்)
*   **கனானிக்கல் கவர் (Canonical Cover - $F_c$)**:
  * ஒரு FDs தொகுதியில் உள்ள தேவையற்ற அல்லது டூப்ளிகேட் விதிகளை நீக்கிவிட்டு உருவாக்கப்படும் மிகச் சிறிய எளிய விதிகளின் தொகுப்பு.

---

## Video 70: Lossless Join Decomposition
### English
*   **Concept**: Decomposing relation $R$ into $R_1$ and $R_2$ is **lossless** if we can reconstruct the original relation $R$ by joining $R_1$ and $R_2$ without producing spurious/fake tuples.
*   **Checking Rule**: A decomposition of $R$ into $R_1$ and $R_2$ is lossless-join if at least one of these FDs is in $F^+$:
    1.  $(R_1 \cap R_2) \rightarrow R_1$
    2.  $(R_1 \cap R_2) \rightarrow R_2$
    *(Translation: The common attribute between tables must be a candidate key for at least one of the tables).*

### Tamil (தமிழ்)
*   **இழப்பில்லா சிதைவு (Lossless Join Decomposition)**:
  * ஒரு பெரிய அட்டவணையை இரண்டாக உடைக்கும்போது, அவற்றை மீண்டும் ஜாயின் (Join) செய்தால் அசல் அட்டவணை எவ்வித கூடுதல் போலி வரிகளும் இன்றி அப்படியே கிடைக்க வேண்டும்.
  * **விதி**: இரண்டு அட்டவணைகளுக்கும் பொதுவான நெடுவரிசை, ஏதாவது ஒரு அட்டவணைக்கு முதன்மை சாவியாக (Candidate Key) இருக்க வேண்டும்.

---

## Video 71: Dependency Preserving Decomposition
### English
*   **Concept**: Ensures that all functional dependencies in $F$ can be checked inside the decomposed tables individually without doing joins.
*   **Rule**: If $R$ is decomposed into $R_1, R_2, ..., R_n$, let $F_i$ be the projection of $F$ on $R_i$. The decomposition is dependency-preserving if:
    \[(F_1 \cup F_2 \cup ... \cup F_n)^+ = F^+\]

### Tamil (தமிழ்)
*   **சார்புப் பாதுகாப்புச் சிதைவு (Dependency Preserving)**:
  * அட்டவணையைப் பிரித்த பிறகும், அசல் எஃப்டி (FD) விதிகளை டேபிள்களை இணைக்காமலேயே தனித்தனியாகச் சரிபார்க்க முடியும் என்பதை உறுதி செய்வது.

---

## Video 72: First Normal Form (1NF)
### English
*   **Rule**: A relation is in 1NF if and only if the domain of each attribute contains only **atomic (indivisible) values**, and there are no multi-valued or composite attributes.
*   **Fix**: Split multi-valued fields into multiple rows.

### Tamil (தமிழ்)
*   **முதல் நார்மல் ஃபார்ம் (1NF)**:
  * அட்டவணையின் ஒவ்வொரு செல்லிலும் ஒரே ஒரு தனி மதிப்பு மட்டுமே இருக்க வேண்டும். கூட்டுப் பண்புகளோ (Composite) அல்லது பல மதிப்புகளோ (Multi-valued) இருக்கக் கூடாது.

---

## Video 73: Second Normal Form (2NF)
### English
*   **Rule**: A relation is in 2NF if:
    1.  It is in 1NF.
    2.  There is **no partial dependency**.
*   **Partial Dependency**: A non-prime attribute depends on a proper subset of a candidate key.
    \[\text{Proper Subset of Candidate Key} \rightarrow \text{Non-prime Attribute} \quad (\text{Not Allowed})\]
    *(A non-prime attribute is an attribute not belonging to any candidate key).*

### Tamil (தமிழ்)
*   **இரண்டாவது நார்மல் ஃபார்ம் (2NF)**:
  * 1NF-ல் இருக்க வேண்டும் மற்றும் **பகுதிச் சார்பு (Partial Dependency) இருக்கக் கூடாது**.
  * **பகுதிச் சார்பு**: ஒரு சாவி அல்லாத நெடுவரிசை, சாவியின் ஒரு பகுதியை மட்டும் சார்ந்து இருப்பது (எ.கா: $\{Roll\_No, Course\_ID\} \rightarrow Student\_Name$ என்பதில் பெயர் என்பது ரோல் நம்பரை மட்டும் சார்ந்து இருப்பதால் இது பகுதிச் சார்பு. இதை பிரிக்க வேண்டும்).

---

## Video 74: Third Normal Form (3NF)
### English
*   **Rule**: A relation $R$ is in 3NF if, for every non-trivial FD $\alpha \rightarrow \beta$ in $F$:
    1.  $\alpha$ is a super key of $R$, OR
    2.  $\beta$ is a prime attribute (member of a candidate key).
*   **Eliminates**: Transitive Dependencies. (Non-prime attribute determining another non-prime attribute).

### Tamil (தமிழ்)
*   **மூன்றாவது நார்மல் ஃபார்ம் (3NF)**:
  * 2NF-ல் இருக்க வேண்டும் மற்றும் **இடைமாற்றுச் சார்பு (Transitive Dependency) இருக்கக் கூடாது**.
  * **விதி**: $\alpha \rightarrow \beta$ என்ற விதியில், $\alpha$ என்பது Super Key ஆக இருக்க வேண்டும் அல்லது $\beta$ என்பது Prime Attribute (சாவியின் பகுதி) ஆக இருக்க வேண்டும்.

---

## Video 75: Boyce-Codd Normal Form (BCNF)
### English
*   **Rule**: A relation $R$ is in BCNF if, for every non-trivial FD $\alpha \rightarrow \beta$ in $F$:
    1.  $\alpha$ is a super key of $R$.
*   **Note**: BCNF is stricter than 3NF. It does not allow the second condition of 3NF (where $\beta$ is a prime attribute).

### Tamil (தமிழ்)
*   **BCNF (Boyce-Codd Normal Form)**:
  * 3NF-ஐ விடக் கடுமையானது.
  * **விதி**: $\alpha \rightarrow \beta$ என்ற அனைத்து விதிகளிலும், இடது பக்கம் இருக்கும் $\alpha$ கண்டிப்பாக ஒரு Super Key ஆக மட்டுமே இருக்க வேண்டும்.

---

## Video 76: Comparison of 3NF vs BCNF
### English
*   **BCNF**: Stronger, guarantees no redundancy due to functional dependencies. However, BCNF decomposition is **not always dependency-preserving**.
*   **3NF**: Slightly weaker, may allow minor redundancy. However, 3NF decomposition is **always lossless and dependency-preserving**.

### Tamil (தமிழ்)
*   **3NF vs BCNF ஒப்பிடுதல்**:
  * BCNF மிகச் சிறந்தது ஆனால் சில சமயங்களில் அசல் விதியைப் பாதுகாக்க முடியாமல் போகலாம். 3NF-ல் எப்போதுமே விதிகளைப் பாதுகாக்க முடியும் (Dependency Preserving).

---

## Video 77: Fourth Normal Form (4NF)
### English
*   **Multi-valued Dependency (MVD)**: Denoted by $\alpha \twoheadrightarrow \beta$. Holds when the presence of one value in a row implies the presence of other values (independent multi-valued facts, e.g., a teacher teaching multiple subjects and having multiple hobbies).
*   **Rule**: A relation is in 4NF if, for every non-trivial MVD $\alpha \twoheadrightarrow \beta$, $\alpha$ is a super key.

### Tamil (தமிழ்)
*   **நான்காவது நார்மல் ஃபார்ம் (4NF)**:
  * பல மதிப்புடைய சார்பு (Multi-valued Dependency) இருக்கக் கூடாது. ஒரு ஆசிரியருக்குப் பல பொழுதுபோக்குகளும், பல பாடங்களும் இருக்கும்போது, அவை ஒன்றுக்கொன்று தொடர்பில்லாமல் இருந்தால் அட்டவணைப் பெருக்கம் ஏற்படும். அதைத் தவிர்க்கத் தனித்தனியாகப் பிரிக்க வேண்டும்.
