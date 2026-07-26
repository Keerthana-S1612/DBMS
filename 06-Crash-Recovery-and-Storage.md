# Chapter 6: Crash Recovery & File Storage structures (Lectures 88 - 91)

This chapter explains the physical storage layer of DBMS, focusing on file organization, dense/sparse/multi-level indexing types, B+ Trees structure, and log-based database recovery techniques.

---

## Video 88: File Organization & Indexing Concepts
### English
*   **Physical Storage**: Data is stored as blocks on disks. Indexing is a structure designed to minimize the number of disk block accesses (Disk I/O) required to fetch a record.
*   **Index Entry**: Consists of a `<Key, Pointer>` pair.
*   **Dense Index**: Contains an index record/entry for **every search key value** in the data file.
*   **Sparse Index**: Contains index records for only **some of the search key values** (usually one entry per data block/anchor record). Saves index storage space, but requires sequential scanning within data blocks.

### Tamil (தமிழ்)
*   **கோப்பு சேமிப்பு மற்றும் குறியீட்டு முறை (Indexing)**:
  * டிஸ்க்கிலிருந்து தரவை மிக வேகமாகத் தேடி எடுப்பதற்காக உருவாக்கப்படும் ஒரு தேடல் பட்டியல் (பக்க எண் கொண்ட புத்தகப் பொருளடக்கம் போன்றது).
  * **அடர்த்தியான குறியீடு (Dense Index)**: டேபிளில் உள்ள ஒவ்வொரு வரியின் சாவிக்கும் தனியாக ஒரு இன்டெக்ஸ் பதிவு இருக்கும்.
  * **அரிதான குறியீடு (Sparse Index)**: ஒவ்வொரு பிளாக்கிற்கும் (Data Block) ஒரு இன்டெக்ஸ் பதிவு மட்டுமே இருக்கும். இது மெமரியை மிச்சப்படுத்தும்.

---

## Video 89: Index Types: Primary, Clustering, Secondary
### English
1.  **Primary Index**: Created on an ordered data file. The search key is the **Primary Key** (or candidate key) of the relation. Since the data file is physically sorted by this key, it is a sparse index (one entry per block).
2.  **Clustering Index**: Created on an ordered data file where the search key is a **non-key attribute** (contains duplicate values, e.g., Department ID). Records with the same key are clustered together in blocks. It is a sparse index with one entry for each distinct key value pointing to the first block containing that value.
3.  **Secondary Index**: Created on an unordered data file. The search key can be a key or non-key attribute. Because the data file is not physically ordered, the secondary index **must be a dense index** pointing to individual record addresses (using buckets for duplicate values).

### Tamil (தமிழ்)
*   **இன்டெக்ஸ் வகைகள் (முக்கிய நேர்காணல் கேள்வி)**:
  1. **Primary Index**: தரவுகள் ஏற்கனவே வரிசைப்படுத்தப்பட்ட கோப்பில் (Ordered file), முதன்மை சாவியை (Primary Key) வைத்து உருவாக்கப்படுவது. இது ஒரு Sparse Index ஆகும்.
  2. **Clustering Index**: தரவுகள் வரிசைப்படுத்தப்பட்ட கோப்பில், சாவி அல்லாத நகல் மதிப்புகள் கொண்ட பண்பை (உதாரணம்: துறை வாரியாக ஊழியர்கள்) வைத்து உருவாக்கப்படுவது.
  3. **Secondary Index (துணை குறியீடு)**: தரவுகள் கலைந்து கிடக்கும் கோப்பில் (Unordered file) உருவாக்கப்படுவது. இது கட்டாயமாக ஒரு **Dense Index** ஆக மட்டுமே இருக்க முடியும்.

---

## Video 90: B-Trees and B+ Trees Index Architecture
### English
*   **B-Tree**: A self-balancing search tree. It stores key values, record pointers, and child node pointers in all nodes (both internal and leaf nodes).
*   **B+ Tree**: An optimization over B-Trees designed specifically for database storage systems.
    *   **Internal Nodes**: Only store search key values and child pointers (no data/record pointers). This allows for higher fan-out (more pointers per node, leading to a shallower tree).
    *   **Leaf Nodes**: Store the search keys and the actual data/record pointers. All leaf nodes are linked together as a **doubly linked list** to allow fast range-based sequential queries.
*   **Complexity**: Insertion and deletion operations run in $O(\log N)$ time, keeping search times constant.

```text
               [ 20 | 50 ]                   <-- Internal Node (No Data Pointers)
              /     |     \
    [ 10 | 15 ]  [ 30 | 40 ]  [ 60 | 70 ]    <-- Internal Node
    /    \       /    \       /    \
 [Leaf] <-> [Leaf] <-> [Leaf] <-> [Leaf]     <-- Leaf Nodes (Keys + Data Pointers + Linked List)
```

### Tamil (தமிழ்)
*   **B+ Tree கட்டமைப்பு (ஏன் DBMS-ல் B+ Tree பயன்படுத்தப்படுகிறது?)**:
  * B+ Tree என்பது சமச்சீராக வளரும் ஒரு தேடல் மரம் (Balanced Tree).
  * **உள் முனைகள் (Internal Nodes)**: இவை தரவு பாயிண்டர்களைச் சேமிக்காது, சாவிகளையும் கிளைப் பாயிண்டர்களையும் மட்டுமே சேமிக்கும். இதனால் ஒரு நோடில் அதிக கிளைகளை வைக்க முடியும் (High Fan-out). மரத்தின் உயரம் குறையும்.
  * **இலை முனைகள் (Leaf Nodes)**: சாவிகள் மற்றும் உண்மையான தரவு பாயிண்டர்களைச் சேமிக்கும். அனைத்து இலை முனைகளும் ஒரு சங்கிலித் தொடர் போல இணைக்கப்பட்டிருக்கும் (Linked List). இதனால் வரிசையாகத் தேடுவது (Range Query) மிக எளிது.

---

## Video 91: Crash Recovery (Log-Based Recovery)
### English
*   **Log-Based Recovery**: The DBMS maintains a log file on stable storage (Write-Ahead Logging - WAL). Every update operation is recorded in the log before being applied to the actual database files on disk.
*   **Log Record Format**: `<T_i, Start>`, `<T_i, X, Old_Val, New_Val>`, `<T_i, Commit>`.
*   **Recovery Operations**:
    *   **Redo**: Re-applies the new values of committed transactions.
    *   **Undo**: Restores the old values of uncommitted/failed transactions.
*   **Variants**:
    1.  **Deferred Database Modification**: Database updates are postponed until the transaction commits. Only `REDO` is required during recovery; `UNDO` is not needed because disk data was never modified before commit.
    2.  **Immediate Database Modification**: Database updates are written to disk immediately during active execution. Both `UNDO` and `REDO` are required during recovery.
*   **Checkpoint**: A log record indicating that all dirty memory blocks have been safely written to disk. During recovery, the DBMS only needs to scan the log back to the last checkpoint, drastically reducing recovery time.

### Tamil (தமிழ்)
*   **சிதைவு மீட்பு (Crash Recovery - Log file)**:
  * கம்ப்யூட்டர் திடீரென நின்றால், தரவை மீட்கப் பயன்படும் முறை.
  * **Write-Ahead Logging (WAL)**: எந்த ஒரு மாற்றத்தையும் டேபிளில் எழுதும் முன், டைரி போன்ற ஒரு லாக் ஃபைலில் (Log file) எழுதி வைக்க வேண்டும்.
  * **மீட்புச் செயல்கள்**:
    * **Redo (மீண்டும் செய்)**: கமிட் ஆன பரிவர்த்தனைகளின் புதிய மதிப்பை மீண்டும் எழுதும்.
    * **Undo (பழையபடி செய்)**: பாதியில் நின்ற பரிவர்த்தனைகளின் பழைய மதிப்பை மீண்டும் கொண்டு வரும் (இடைநிறுத்தம்).
  * **செக்பாயிண்ட் (Checkpoint)**: குறிப்பிட்ட கால இடைவெளியில் நினைவகத்தில் உள்ள அனைத்து மாற்றங்களும் வட்டில் பத்திரமாகச் சேமிக்கப்பட்டுவிட்டதைக் குறிக்கும் புள்ளி. மீட்பு செய்யும்போது செக்பாயிண்டிற்கு முந்தைய லாக் கோப்புகளைப் படிக்கத் தேவையில்லை.
