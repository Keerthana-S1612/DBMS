# Chapter 8: DBMS Top High-Yield Interview Q&As (Bilingual)

This chapter contains 40 top, high-yield Database Management Systems (DBMS) interview questions with comprehensive answers in English and Tamil.

---

### Q1: What is the main difference between a File System and a DBMS? / ஃபைல் சிஸ்டத்திற்கும் DBMS-க்கும் உள்ள முக்கிய வேறுபாடு என்ன?
*   **English**: A File System stores data in flat, isolated files managed by the OS, leading to data redundancy, inconsistency, and lack of concurrent control. A DBMS is a centralized software package that stores both data and metadata, ensuring consistency, sharing, safety (ACID), and robust query optimization.
*   **Tamil**: ஃபைல் சிஸ்டத்தில் தரவுகள் ஆப்பரேட்டிங் சிஸ்டத்தின் தனித்தனி கோப்புகளில் சேமிக்கப்படும், இதனால் ஒரே தரவு பல இடங்களில் சேமிக்கப்பட்டு (Redundancy) குழப்பங்கள் (Inconsistency) ஏற்படும். DBMS என்பது மையப்படுத்தப்பட்ட மென்பொருள் ஆகும், இது தரவுகளையும் அதன் அமைப்பையும் ஒரே இடத்தில் சேமித்து, பாதுகாப்பு, விரைவான தேடல் மற்றும் சீரான தன்மையை உறுதி செய்யும்.

---

### Q2: Explain the ACID properties in detail. / ACID பண்புகளைப் பற்றி விரிவாக விளக்குக.
*   **English**: 
    *   **Atomicity**: Either all operations of a transaction succeed, or none do (rolled back).
    *   **Consistency**: A transaction must take the database from one valid state to another.
    *   **Isolation**: Concurrent execution of transactions must yield the same state as serial execution.
    *   **Durability**: Committed data survives system crashes.
*   **Tamil**:
    *   **Atomicity (அணுத்தன்மை)**: ஒரு பரிவர்த்தனையின் அனைத்து வேலைகளும் நடக்க வேண்டும் அல்லது எதுவுமே நடக்காமல் பழைய நிலைக்குத் திரும்ப வேண்டும்.
    *   **Consistency (சீரான தன்மை)**: பரிவர்த்தனை முடிந்த பிறகும் கணக்கின் மொத்த தொகைகள் மாறாமல் சரியாக இருக்க வேண்டும்.
    *   **Isolation (தனிமைப்படுத்தல்)**: ஒரே நேரத்தில் பல பரிவர்த்தனைகள் நடந்தாலும் அவை ஒன்றுக்கொன்று குறுக்கிடக் கூடாது.
    *   **Durability (நீடித்த தன்மை)**: சேமிக்கப்பட்ட தரவுகள் சிஸ்டம் கிராஷ் ஆனாலும் அழியாமல் இருக்கும்.

---

### Q3: What is the difference between physical and logical data independence? / இயற்பியல் மற்றும் தர்க்கரீதியான தரவுச் சுதந்திரத்திற்கு என்ன வேறுபாடு?
*   **English**:
    *   **Physical Data Independence**: The ability to modify the physical schema (like changing indexes, file locations) without changing the logical/conceptual schema.
    *   **Logical Data Independence**: The ability to modify the logical schema (like adding columns, tables) without changing the user views (external schemas) or application code.
*   **Tamil**:
    *   **Physical Independence**: ஹார்ட் டிஸ்க்கில் தரவு சேமிக்கப்படும் முறையை (Indexes) மாற்றினாலும், டேபிளின் அமைப்பை மாற்றத் தேவையில்லை.
    *   **Logical Independence**: டேபிளின் அமைப்பில் (Columns/Tables) மாற்றங்கள் செய்தாலும், பயனர் பார்க்கும் திரையையோ (UI Views) அல்லது கோடிங்கையோ மாற்றத் தேவையில்லை.

---

### Q4: Define Super Key, Candidate Key, and Primary Key. / Super Key, Candidate Key, மற்றும் Primary Key-க்கு உள்ள வேறுபாடுகளை வரையறு.
*   **English**:
    *   **Super Key**: Any set of attributes that uniquely identifies a row in a table.
    *   **Candidate Key**: A minimal super key (no proper subset can identify a row).
    *   **Primary Key**: The specific candidate key chosen by the DBA to uniquely identify rows (cannot contain NULLs).
*   **Tamil**:
    *   **Super Key**: அட்டவணையின் ஒரு வரியைத் தனித்துவமாகக் கண்டறிய உதவும் பண்புகளின் தொகுப்பு.
    *   **Candidate Key**: மிகக் குறைந்த அளவிலான பண்புகளைக் கொண்ட Super Key. இதிலிருந்து எந்த ஒரு பண்பையும் நீக்க முடியாது.
    *   **Primary Key**: Candidate Key-களில் இருந்து நிர்வாகியால் தேர்ந்தெடுக்கப்படும் பிரதான திறவுகோல். இதில் NULL இருக்கக் கூடாது.

---

### Q5: What is a Foreign Key and Referential Integrity? / வெளித் திறவுகோல் (Foreign Key) மற்றும் ரிலேஷனல் ஒருமைப்பாடு என்றால் என்ன?
*   **English**: A Foreign Key is a column (or set of columns) in one table that references the Primary Key of another table. Referential Integrity ensures that a foreign key value must always point to an existing primary key value in the referenced table, or be `NULL`.
*   **Tamil**: ஒரு டேபிளில் இருக்கும் நெடுவரிசையின் மதிப்பு, மற்றொரு டேபிளின் Primary Key-ஐக் குறிப்பதாக இருந்தால் அது Foreign Key ஆகும். Foreign Key-ன் மதிப்பு எப்போதும் தாய் அட்டவணையில் (Parent Table) இருக்கும் மதிப்பாக மட்டுமே இருக்க வேண்டும் என்பதை இது உறுதி செய்கிறது.

---

### Q6: Explain cascading actions on delete. / ON DELETE CASCADE என்றால் என்ன?
*   **English**: When a row in the parent table is deleted:
    *   `CASCADE`: Automatically deletes all referencing rows in the child table.
    *   `SET NULL`: Sets the foreign key values of referencing rows in the child table to `NULL`.
    *   `RESTRICT / NO ACTION`: Prevents the deletion of the parent row if child rows refer to it.
*   **Tamil**: தாய் அட்டவணையில் ஒரு வரியை நீக்கும்போது:
    *   `CASCADE`: சார்ந்திருக்கும் பிள்ளை அட்டவணையின் (Child Table) அனைத்து வரிகளையும் தானாகவே நீக்கிவிடும்.
    *   `SET NULL`: சார்ந்திருக்கும் பிள்ளை அட்டவணையின் மதிப்புகளை `NULL` என்று மாற்றும்.
    *   `RESTRICT`: குழந்தை அட்டவணையில் தரவு இருக்கும்வரை தாய் அட்டவணை வரியை நீக்க அனுமதிக்காது.

---

### Q7: What are Functional Dependencies (FDs)? / செயல்பாட்டுச் சார்புகள் (FDs) என்றால் என்ன?
*   **English**: A constraint $\alpha \rightarrow \beta$ holds on a relation $R$ if, whenever two tuples have the same values on attributes $\alpha$, they must also have the same values on attributes $\beta$.
*   **Tamil**: $\alpha \rightarrow \beta$ என்பது $\alpha$-வின் மதிப்பு தெரிந்தால் $\beta$-வின் மதிப்பைத் துல்லியமாகக் கண்டறியலாம் என்ற விதியைக் குறிக்கும் (எ.கா: ஆதார் எண் $\rightarrow$ பெயர்).

---

### Q8: What is attribute closure ($\alpha^+$)? / பண்புக் குளோஷர் ($\alpha^+$) என்றால் என்ன?
*   **English**: The set of all attributes functionally determined by the attribute set $\alpha$ under a given set of functional dependencies $F$. It is used to identify candidate keys.
*   **Tamil**: ஒரு குறிப்பிட்ட பண்பின் மூலம் அட்டவணையில் உள்ள வேறு எந்தெந்த பண்புகளை எல்லாம் கண்டறிய முடியும் என்ற பட்டியல். இது Candidate Key-களைக் கண்டறிய உதவும்.

---

### Q9: Explain First Normal Form (1NF). / முதல் நார்மல் ஃபார்ம் (1NF) விளக்குக.
*   **English**: A relation is in 1NF if and only if the domain of each attribute contains only atomic (indivisible) values, meaning no multi-valued or composite attributes are allowed.
*   **Tamil**: அட்டவணையின் ஒவ்வொரு செல்லிலும் (Cell) ஒரே ஒரு தனி மதிப்பு மட்டுமே இருக்க வேண்டும். பல மதிப்புகளோ அல்லது கூட்டுப் பண்புகளோ இருக்கக் கூடாது.

---

### Q10: Explain Second Normal Form (2NF) and Partial Dependency. / 2NF மற்றும் பகுதிச் சார்பு (Partial Dependency) விளக்குக.
*   **English**: A relation is in 2NF if it is in 1NF and there is **no partial dependency**. A partial dependency occurs when a non-prime attribute is functionally determined by a proper subset of a candidate key.
*   **Tamil**: 1NF-ல் இருக்க வேண்டும் மற்றும் பகுதிச் சார்பு இருக்கக் கூடாது. பகுதிச் சார்பு என்பது ஒரு சாவி அல்லாத நெடுவரிசை, சாவியின் ஒரு பகுதியை மட்டும் சார்ந்து இருப்பது (எ.கா: $\{Roll\_No, Course\_ID\} \rightarrow Student\_Name$ என்பதில் பெயர் ரோல் நம்பரை மட்டும் சார்ந்து இருப்பதால் இது பகுதிச் சார்பு).

---

### Q11: Explain Third Normal Form (3NF) and Transitive Dependency. / 3NF மற்றும் இடைமாற்றுச் சார்பு (Transitive Dependency) விளக்குக.
*   **English**: A relation is in 3NF if it is in 2NF and has **no transitive dependency**. Formally, for every non-trivial FD $\alpha \rightarrow \beta$: $\alpha$ must be a super key or $\beta$ must be a prime attribute.
*   **Tamil**: 2NF-ல் இருக்க வேண்டும் மற்றும் இடைமாற்றுச் சார்பு இருக்கக் கூடாது (அதாவது, ஒரு சாவி அல்லாத நெடுவரிசை மற்றொரு சாவி அல்லாத நெடுவரிசையைத் தீர்மானிக்கக் கூடாது).

---

### Q12: Why is BCNF stricter than 3NF? / BCNF ஏன் 3NF-ஐ விடக் கடுமையானது?
*   **English**: In 3NF, an FD $\alpha \rightarrow \beta$ is allowed if $\beta$ is a prime attribute even if $\alpha$ is not a super key. BCNF removes this exception: for every non-trivial FD $\alpha \rightarrow \beta$, $\alpha$ **must** be a super key.
*   **Tamil**: 3NF-ல் வலது பக்கத்தில் சாவியின் பகுதி (Prime Attribute) இருந்தால் இடது பக்கம் சாவி இல்லாவிட்டாலும் அனுமதிக்கப்படும். ஆனால் BCNF-ல் இடது பக்கத்தில் இருப்பவர் கண்டிப்பாக Super Key ஆக மட்டுமே இருக்க வேண்டும் என்ற விதி இருப்பதால் இது கடுமையானது.

---

### Q13: What is the difference between 3NF and BCNF decompositions? / 3NF மற்றும் BCNF பிரிப்புகளுக்கு உள்ள வேறுபாடு என்ன?
*   **English**: A 3NF decomposition is **always** guaranteed to be lossless and dependency-preserving. A BCNF decomposition is always lossless but **may not** preserve all functional dependencies.
*   **Tamil**: 3NF பிரிப்பு எப்போதும் இழப்பில்லாதது மற்றும் அனைத்து விதிகளையும் பாதுகாக்கும் (Dependency Preserving). BCNF பிரிப்பில் விதிகளைப் பாதுகாக்க முடியாமல் போகலாம்.

---

### Q14: Explain Lossless-Join Decomposition. / இழப்பில்லா சிதைவு (Lossless Join) என்றால் என்ன?
*   **English**: A decomposition of relation $R$ into $R_1$ and $R_2$ is lossless-join if $R_1 \bowtie R_2 = R$. Formally, $(R_1 \cap R_2) \rightarrow R_1$ or $(R_1 \cap R_2) \rightarrow R_2$ (the common attributes must form a key in at least one table).
*   **Tamil**: ஒரு டேபிளை இரண்டாக உடைத்து மீண்டும் ஜாயின் செய்தால், போலி வரிகள் (Spurious Tuples) ஏதுமின்றி அசல் அட்டவணை அப்படியே கிடைக்க வேண்டும். இதற்குப் பொதுவான நெடுவரிசை ஏதேனும் ஒரு டேபிளுக்குச் சாவியாக இருக்க வேண்டும்.

---

### Q15: What is Dependency Preservation? / சார்புப் பாதுகாப்பு (Dependency Preservation) என்றால் என்ன?
*   **English**: A decomposition of $R$ into $R_1, R_2, ..., R_n$ is dependency-preserving if the union of all functional dependencies on the individual tables is equivalent to the original set of functional dependencies.
*   **Tamil**: டேபிள்களைப் பிரித்த பிறகும், அசல் விதிகளையெல்லாம் டேபிள்களை இணைக்காமலேயே தனித்தனியாகச் சரிபார்க்க முடியும் என்பதை உறுதி செய்வது.

---

### Q16: What is a Transaction and its states? / பரிவர்த்தனை மற்றும் அதன் நிலைகள் என்னென்ன?
*   **English**: A transaction is a logical unit of work. Its states are: **Active** (executing), **Partially Committed** (final statement done, but not on disk), **Committed** (saved to disk), **Failed** (error hit), and **Aborted** (rolled back).
*   **Tamil**: பரிவர்த்தனை என்பது ஒரு தொகுதி வேலை. அதன் நிலைகள்: **Active** (இயங்குகிறது), **Partially Committed** (முடிந்தது, வட்டில் சேமிக்கப்படவில்லை), **Committed** (சேமிக்கப்பட்டது), **Failed** (பிழை), **Aborted** (ரத்து செய்யப்பட்டது).

---

### Q17: What are serial, non-serial, and serializable schedules? / தொடர், தொடரற்ற மற்றும் தொடராக்க அட்டவணைகள் என்றால் என்ன?
*   **English**:
    *   **Serial**: Transactions run one after another.
    *   **Non-Serial**: Operations of transactions are interleaved.
    *   **Serializable**: A non-serial schedule that is equivalent in effect to a serial schedule.
*   **Tamil**:
    *   **Serial**: ஒன்று முடிந்த பின் அடுத்தது இயங்குவது.
    *   **Non-serial**: மாறி மாறி இயங்குவது.
    *   **Serializable**: மாறி மாறி இயங்கினாலும், ஒரு தொடர் அட்டவணை தரும் அதே சரியான முடிவைத் தருவது.

---

### Q18: Explain Conflict Serializability. / முரண்பாடு தொடராக்கம் என்றால் என்ன?
*   **English**: A schedule is conflict serializable if it is conflict equivalent to a serial schedule, which means we can transform it into a serial schedule by swapping non-conflicting operations.
*   **Tamil**: ஒரு அட்டவணையின் முரண்படாத கட்டளைகளை இடம் மாற்றுவதன் (Swapping) மூலம் அதை ஒரு தொடர் அட்டவணையாக மாற்ற முடிந்தால் அது Conflict Serializable ஆகும்.

---

### Q19: How do conflicting operations differ from non-conflicting ones? / முரண்படும் கட்டளைகள் எவை?
*   **English**: Two operations conflict if they belong to different transactions, access the same data item, and at least one is a write operation (e.g., $R_1(A)$ and $W_2(A)$).
*   **Tamil**: வெவ்வேறு பரிவர்த்தனைகள், ஒரே டேட்டா ஐட்டத்தை அணுகி, அதில் ஒன்று எழுதப்படும் (Write) செயலாக இருந்தால் முரண்படும் கட்டளைகள் ஆகும் (எ.கா: $W_1(A)$ மற்றும் $R_2(A)$).

---

### Q20: How does a precedence graph check for conflict serializability? / Precedence Graph மூலம் எவ்வாறு சீரியலைசபிலிட்டியைச் சரிபார்ப்பது?
*   **English**: Create nodes for transactions. Draw an edge $T_i \rightarrow T_j$ if $T_i$ executes a conflicting operation before $T_j$. If the graph is **acyclic (no cycles)**, it is conflict serializable.
*   **Tamil**: பரிவர்த்தனைகளை புள்ளிகளாகக் கொண்டு, முரண்பாடுகளுக்கு ஏற்ப அம்புக்குறி வரைய வேண்டும். வரைபடத்தில் **வளையம் (Cycle) இல்லை என்றால்** அது Serializable ஆகும்.

---

### Q21: Explain View Serializability. / பார்வை தொடராக்கம் (View Serializability) என்றால் என்ன?
*   **English**: A schedule is view serializable if it is view equivalent to some serial schedule. It checks initial read, dirty reads, and final writes. Every conflict serializable schedule is view serializable.
*   **Tamil**: ஒரு தொடரற்ற அட்டவணை, ஏதேனும் ஒரு தொடர் அட்டவணைக்கு ஆரம்ப வாசிப்பு, இடைவாசிப்பு, மற்றும் இறுதி எழுத்து ஆகியவற்றில் சமமாக இருந்தால் அது View Serializable ஆகும்.

---

### Q22: What is a Dirty Read and cascading rollback? / Dirty Read மற்றும் cascading rollback என்றால் என்ன?
*   **English**:
    *   **Dirty Read**: Reading data written by an uncommitted transaction.
    *   **Cascading Rollback**: If a transaction fails, all other transactions that read its dirty data must also be rolled back, causing a chain reaction.
*   **Tamil**:
    *   **Dirty Read**: கமிட் செய்யப்படாத ஒரு பரிவர்த்தனை எழுதிய தரவை மற்றொரு பரிவர்த்தனை வாசிப்பது.
    *   **Cascading Rollback**: ஒரு பரிவர்த்தனை தோல்வியடையும் போது, அது எழுதிய தற்காலிகத் தரவை வாசித்த மற்ற அனைத்து பரிவர்த்தனைகளும் தொடர்ச்சியாக ரத்து செய்யப்பட வேண்டிய கட்டாயம் ஏற்படுவது.

---

### Q23: What is a recoverable schedule and a cascadeless schedule? / Recoverable மற்றும் Cascadeless அட்டவணைகளுக்கு என்ன வேறுபாடு?
*   **English**:
    *   **Recoverable**: If $T_2$ reads from $T_1$, $T_1$ must commit before $T_2$ commits.
    *   **Cascadeless**: $T_2$ can only read $T_1$'s data after $T_1$ commits. Prevents cascading rollbacks.
*   **Tamil**:
    *   **Recoverable**: $T_2$ என்பது $T_1$ எழுதியதை வாசித்தால், $T_1$ முதலில் கமிட் செய்ய வேண்டும்.
    *   **Cascadeless**: ஒரு பரிவர்த்தனை கமிட் செய்த பிறகே அதன் மதிப்பை அடுத்தவர் வாசிக்க அனுமதிக்க வேண்டும். இதுவே பாதுகாப்பானது.

---

### Q24: Explain Two-Phase Locking (2PL). / 2-Phase Locking (2PL) விளக்குக.
*   **English**: A protocol ensuring serializability. Has two phases:
    1.  **Growing Phase**: Transaction acquires locks, cannot release any.
    2.  **Shrinking Phase**: Transaction releases locks, cannot acquire new ones.
*   **Tamil**: தொடராக்கத்தை உறுதி செய்யும் விதி. இரு நிலைகள்:
    1. **Growing Phase**: பூட்டுகளைப் பெறலாம், ரிலீஸ் செய்யக் கூடாது.
    2. **Shrinking Phase**: பூட்டுகளை ரிலீஸ் செய்யலாம், புதிய பூட்டுகளைப் பெறக் கூடாது.

---

### Q25: Difference between Strict 2PL and Rigorous 2PL? / Strict 2PL மற்றும் Rigorous 2PL-க்கு என்ன வேறுபாடு?
*   **English**:
    *   **Strict 2PL**: Holds all exclusive ($X$) locks until the transaction commits/aborts.
    *   **Rigorous 2PL**: Holds all locks ($S$ and $X$) until the transaction commits/aborts.
*   **Tamil**:
    *   **Strict 2PL**: எழுதும் பூட்டுகளை (X locks) கமிட் ஆகும் வரை வைத்திருக்க வேண்டும்.
    *   **Rigorous 2PL**: அனைத்துப் பூட்டுகளையும் (S மற்றும் X) கமிட் ஆகும் வரை வைத்திருக்க வேண்டும்.

---

### Q26: How are deadlocks handled in DBMS? / Deadlocks எவ்வாறு கையாளப்படுகின்றன?
*   **English**:
    1.  **Prevention**: Using timestamp ordering schemes like Wait-Die or Wound-Wait.
    2.  **Detection & Recovery**: Maintaining a Wait-For Graph (WFG). If a cycle is detected, select a victim transaction and roll it back.
*   **Tamil**:
    1. **தடுத்தல் (Prevention)**: Wait-Die அல்லது Wound-Wait போன்ற நேர முத்திரை விதிகளைப் பயன்படுத்துவது.
    2. **கண்டறிந்து மீட்டல்**: Wait-For Graph வரைபடத்தில் வளையம் (Cycle) இருந்தால், ஒரு பரிவர்த்தனையைத் தேர்ந்தெடுத்து அதை ரத்து (Rollback) செய்வது.

---

### Q27: What is Write-Ahead Logging (WAL)? / Write-Ahead Logging (WAL) என்றால் என்ன?
*   **English**: A database security rule stating that any modification to a database record must first be written into a transaction log file on stable storage before the actual changes are written to the database files on disk.
*   **Tamil**: தரவை வட்டில் (Disk) மாற்றி எழுதும் முன், அந்த மாற்றங்களை லாக் ஃபைலில் (Log file) எழுதி வைக்க வேண்டும் என்ற விதி.

---

### Q28: Explain Deferred vs. Immediate Database Modification. / Deferred vs. Immediate மாற்றங்கள் என்றால் என்ன?
*   **English**:
    *   **Deferred**: Database disk writes are postponed until commit. During recovery, only `REDO` is needed.
    *   **Immediate**: Updates are written to disk during active execution. During recovery, both `UNDO` and `REDO` are required.
*   **Tamil**:
    *   **Deferred (தள்ளிப்போடுதல்)**: பரிவர்த்தனை முடியும் வரை வட்டில் எழுதாது. மீட்பின் போது `REDO` மட்டும் போதும்.
    *   **Immediate (உடனடி)**: பரிவர்த்தனை நடக்கும்போதே வட்டில் எழுதும். மீட்பின் போது `UNDO` மற்றும் `REDO` இரண்டும் தேவை.

---

### Q29: What is a Checkpoint in database recovery? / செக்பாயிண்ட் (Checkpoint) என்றால் என்ன?
*   **English**: A checkpoint is a log record indicating that all modified data blocks in volatile memory have been successfully written to disk. During recovery, logging transactions prior to the checkpoint do not need to be processed, speeding up recovery times.
*   **Tamil**: நினைவகத்தில் உள்ள அனைத்து மாற்றங்களும் வட்டில் பத்திரமாகச் சேமிக்கப்பட்டுவிட்டதைக் குறிக்கும் புள்ளி. சிஸ்டம் கிராஷ் ஆனால், செக்பாயிண்டிற்கு முந்தைய லாக் கோப்புகளைப் படிக்க வேண்டியதில்லை.

---

### Q30: What is Dense Index vs. Sparse Index? / Dense Index மற்றும் Sparse Index-க்கு என்ன வேறுபாடு?
*   **English**:
    *   **Dense Index**: Contains an index record for every single search key value in the data file.
    *   **Sparse Index**: Contains index records for only some search key values (e.g., one entry per data block).
*   **Tamil**:
    *   **Dense Index**: அட்டவணையின் ஒவ்வொரு வரியின் சாவிக்கும் ஒரு குறியீட்டுப் பதிவு இருக்கும்.
    *   **Sparse Index**: ஒவ்வொரு பிளாக்கிற்கும் (Data Block) ஒரு குறியீடு மட்டுமே இருக்கும் (மெமரியைச் சேமிக்கும்).

---

### Q31: Explain Primary, Clustering, and Secondary Indexes. / Primary, Clustering, மற்றும் Secondary இன்டெக்ஸ்கள் விளக்குக.
*   **English**:
    *   **Primary**: Created on ordered data files using the Primary Key. Sparse.
    *   **Clustering**: Created on ordered data files using a non-key attribute (duplicates). Sparse.
    *   **Secondary**: Created on unordered data files. Dense.
*   **Tamil**:
    *   **Primary**: வரிசைப்படுத்தப்பட்ட கோப்பில் Primary Key-ஐ வைத்து உருவாக்கப்படும் Sparse இன்டெக்ஸ்.
    *   **Clustering**: வரிசைப்படுத்தப்பட்ட கோப்பில் நகல் மதிப்புகள் கொண்ட பண்பை வைத்து உருவாக்கப்படும் Sparse இன்டெக்ஸ்.
    *   **Secondary**: கலைந்து கிடக்கும் கோப்பில் (Unordered file) உருவாக்கப்படும் Dense இன்டெக்ஸ்.

---

### Q32: Why are B+ Trees preferred over B-Trees for database indexing? / பிளஸ் மரங்கள் (B+ Trees) ஏன் பி-மரங்களை விடச் சிறந்தவை?
*   **English**: In a B+ Tree, internal nodes do not store record/data pointers, only keys. This increases node fan-out, making the tree shallower. Additionally, all leaf nodes are linked via a linked list, allowing extremely fast range queries and sequential scans.
*   **Tamil**: B+ மரத்தின் உள் முனைகளில் தரவு பாயிண்டர்கள் இருக்காது, சாவிகள் மட்டுமே இருக்கும். இதனால் மரத்தின் உயரம் குறையும். மேலும் இலை முனைகள் (Leaf Nodes) அனைத்தும் சங்கிலித் தொடராக இணைக்கப்பட்டிருப்பதால் தொடர்ச்சியான தேடல்கள் (Range queries) மிக வேகமாக நடக்கும்.

---

### Q33: What is the difference between DELETE, TRUNCATE, and DROP? / DELETE, TRUNCATE, மற்றும் DROP-க்கு உள்ள வேறுபாடுகள் என்ன?
*   **English**:
    *   **DELETE**: DML command. Deletes specific rows (using `WHERE`). Slower, logs each delete, can be rolled back.
    *   **TRUNCATE**: DDL command. Deletes all rows immediately, frees disk space. Faster, not logged row-by-row, cannot be rolled back.
    *   **DROP**: DDL command. Deletes the entire table structure along with its data from the database.
*   **Tamil**:
    *   **DELETE (DML)**: நிபந்தனைக்குட்பட்ட வரிகளை மட்டும் நீக்கும். மெதுவானது, திரும்பப் பெற முடியும் (Rollback).
    *   **TRUNCATE (DDL)**: அட்டவணையின் வரிகள் அனைத்தையும் துடைத்து இடத்தை மீட்கும். வேகமானது, திரும்பப் பெற முடியாது.
    *   **DROP (DDL)**: அட்டவணையின் கட்டமைப்பையும் (Structure) சேர்த்துத் தரவுத்தளத்தில் இருந்து முழுமையாக நீக்கிவிடும்.

---

### Q34: What is the Division Operator in Relational Algebra? / ரிலேஷனல் அல்ஜிப்ராவில் வகுத்தல் செயல்முறை ($\div$) எப்போது பயன்படும்?
*   **English**: Used for queries containing the phrase "for all" or "every" (e.g., "Find customers who bought *all* products"). It returns tuples from relation $R$ that are associated with all tuples in relation $S$.
*   **Tamil**: "அனைத்து" (For all / Every) என்ற நிபந்தனையைக் கொண்ட குவரிகளுக்கு இது பயன்படும் (எ.கா: அனைத்து தேர்வுகளையும் எழுதிய மாணவர்களைக் கண்டறிவது).

---

### Q35: Difference between Relational Algebra and Relational Calculus? / ரிலேஷனல் அல்ஜிப்ரா மற்றும் கால்குலஸ்க்கு என்ன வேறுபாடு?
*   **English**:
    *   **Relational Algebra**: Procedural query language; describes *how* to get the data step-by-step.
    *   **Relational Calculus**: Non-procedural (declarative) language; describes *what* data is needed without specifying the steps.
*   **Tamil**:
    *   **Relational Algebra**: வழிமுறை மொழி (Procedural). தரவை *எப்படி* எடுக்க வேண்டும் என்று படிநிலைகளாகக் கூறும்.
    *   **Relational Calculus**: அறிவிப்பு மொழி (Declarative). என்ன தரவு தேவை என்று மட்டும் கணித சூத்திர வடிவில் கூறும்.

---

### Q36: What is a Weak Entity Set and how is it represented? / பலவீனமான தொகுதி என்றால் என்ன?
*   **English**: An entity set that does not have a primary key of its own and depends on an owner (strong) entity set for its existence. It is represented by a double rectangle, and its relationship is represented by a double diamond.
*   **Tamil**: தனக்கென்று ஒரு Primary Key இல்லாத தொகுதி. இது ஒரு வலுவான தொகுதியைச் சார்ந்து மட்டுமே இருக்க முடியும். இது இரட்டை செவ்வகத்திலும் (Double Rectangle), அதன் உறவு இரட்டை வைரம் (Double Diamond) வடிவிலும் குறிக்கப்படும்.

---

### Q37: Difference between Generalization and Specialization in ER model? / Generalization மற்றும் Specialization-க்கு என்ன வேறுபாடு?
*   **English**:
    *   **Generalization**: A bottom-up process combining lower-level entities with common features into a higher-level entity (e.g., Car, Truck $\rightarrow$ Vehicle).
    *   **Specialization**: A top-down process splitting a higher-level entity into lower-level entities based on distinct features (e.g., Employee $\rightarrow$ Engineer, Clerk).
*   **Tamil**:
    *   **Generalization**: கீழ் மட்டத் தொகுதிகளின் பொதுவான பண்புகளைக் கொண்டு ஒரு மேல் மட்டத் தொகுதியை உருவாக்கும் கீழ்-மேல் (Bottom-up) முறை.
    *   **Specialization**: ஒரு மேல் மட்டத் தொகுதியை மேலும் பிரித்து கீழ் மட்டத் தொகுதிகளை உருவாக்கும் மேல்-கீழ் (Top-down) முறை.

---

### Q38: How do you map a Many-to-Many (N:N) relationship into tables? / N:N உறவை எவ்வாறு அட்டவணையாக மாற்றுவது?
*   **English**: Create a separate table for the relationship. This table will contain the primary keys of both participating entities as foreign keys (forming a composite primary key) + any descriptive attributes of the relationship.
*   **Tamil**: N:N உறவுக்கு என்று தனி அட்டவணை (Table) கண்டிப்பாகப் போட வேண்டும். அதில் இரு அட்டவணைகளின் Primary Key-களும் வெளிவிசைகளாகவும் (Foreign Keys), இணைந்து ஒரு கூட்டு Primary Key ஆகவும் செயல்படும்.

---

### Q39: What is a View and is it stored on disk? / பார்வை (View) என்றால் என்ன? அது வட்டில் சேமிக்கப்படுமா?
*   **English**: A View is a virtual table representing the result of a saved SQL query. It does not store physical data on disk (unless it is a Materialized View); it dynamically runs the underlying query whenever accessed.
*   **Tamil**: வியூ என்பது ஒரு தற்காலிக மெய்நிகர் அட்டவணை (Virtual Table). இது வட்டில் தரவுகளைச் சேமிக்காது. நாம் இதை இயக்கும்போது இதன் பின்னணியில் உள்ள குவரி இயங்கித் தரவைக் காட்டும்.

---

### Q40: What is a Database Trigger? / டிரிகர் (Trigger) என்றால் என்ன?
*   **English**: A trigger is a stored database program that automatically executes (fires) in response to a specific event (like `INSERT`, `UPDATE`, or `DELETE`) occurring on a table.
*   **Tamil**: ஒரு அட்டவணையில் `INSERT`, `UPDATE` அல்லது `DELETE` போன்ற மாற்றங்கள் நடக்கும்போது, நமது உதவி ஏதுமின்றித் தானாகவே இயங்கும் ஒரு தானியங்கி மென்பொருள் நிரல்.
