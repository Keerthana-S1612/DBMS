# Chapter 6: Crash Recovery & File Storage structures (Lectures 88 - 91)

This chapter explains the physical storage layer of DBMS, focusing on file organization, dense/sparse/multi-level indexing types, B+ Trees structure, and log-based database recovery techniques.

---

## Lecture 88: File Organization & Indexing Concepts
*   **Physical Storage**: Data is stored as blocks on disk. Indexing is a database structure designed to minimize the number of disk block accesses (Disk I/O) required to retrieve records.
*   **Index Entry**: Consists of a `<Search_Key, Block_Pointer>` pair.
*   **Dense Index**: Contains an index record/entry for **every single search key value** in the data file.
*   **Sparse Index**: Contains index records for only **some of the search key values** (typically one entry per data block/anchor record). Saves index storage space, but requires sequential scanning within data blocks to locate records.

**Dense vs Sparse Index Lookup Tables:**

*Data File (Sorted by ID):*
| Block ID | Student_ID | Name |
| :--- | :--- | :--- |
| Block 1 | 10 | Amit |
| Block 1 | 20 | Priya |
| Block 2 | 30 | Rahul |
| Block 2 | 40 | Vikram |

*Dense Index (One entry per record key):*
| Key | Pointer |
| :--- | :--- |
| 10 | Pointer to Block 1, Row 1 |
| 20 | Pointer to Block 1, Row 2 |
| 30 | Pointer to Block 2, Row 1 |
| 40 | Pointer to Block 2, Row 2 |

*Sparse Index (One entry per Block/Anchor):*
| Key | Pointer |
| :--- | :--- |
| 10 | Pointer to Block 1 |
| 30 | Pointer to Block 2 |

---

## Lecture 89: Index Types: Primary, Clustering, Secondary
1.  **Primary Index**: Created on an ordered data file where the search key is the **Primary Key** (or candidate key) of the relation. Since the data file is physically sorted by this key, the primary index is a sparse index.
2.  **Clustering Index**: Created on an ordered data file where the search key is a **non-key attribute** (contains duplicate values, e.g., Dept_ID). Records with the same key are clustered together in adjacent blocks. It is a sparse index with one entry for each distinct key value pointing to the first block containing that value.
3.  **Secondary Index**: Created on an unordered data file. The search key can be a key or non-key attribute. Because the data file is not physically ordered, the secondary index **must be a dense index** pointing to individual record addresses (using buckets for duplicate values).

---

## Lecture 90: B-Trees and B+ Trees Index Architecture
*   **B-Tree**: A self-balancing search tree. It stores key values, record pointers, and child node pointers in all nodes (both internal and leaf nodes).
*   **B+ Tree**: An optimization over B-Trees designed specifically for database storage systems.
    *   **Internal Nodes**: Only store search key values and child pointers (no data/record pointers). This allows for higher fan-out (more pointers per node, leading to a shallower tree).
    *   **Leaf Nodes**: Store the search keys and the actual data/record pointers. All leaf nodes are linked together as a **doubly linked list** to allow fast range-based sequential queries.
*   **Complexity**: Insertion and deletion operations run in $O(\log N)$ time, keeping search times constant.

**B+ Tree Leaf Node Layout:**
| Prev_Leaf_Ptr | Key 1 | Data_Ptr 1 | Key 2 | Data_Ptr 2 | Next_Leaf_Ptr |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Pointer to Left | 10 | Record Address A | 20 | Record Address B | Pointer to Right |

---

## Lecture 91: Crash Recovery (Log-Based Recovery)
*   **Log-Based Recovery**: The DBMS maintains a log file on stable storage (Write-Ahead Logging - WAL). Every update operation is recorded in the log before being applied to the actual database files on disk.
*   **Log Record Format**: `<T_i, Start>`, `<T_i, X, Old_Val, New_Val>`, `<T_i, Commit>`.
*   **Recovery Operations**:
    *   **Redo**: Re-applies the new values of committed transactions.
    *   **Undo**: Restores the old values of uncommitted/failed transactions.
*   **Variants**:
    1.  **Deferred Database Modification**: Database updates are postponed until the transaction commits. Only `REDO` is required during recovery; `UNDO` is not needed because disk data was never modified before commit.
    2.  **Immediate Database Modification**: Database updates are written to disk immediately during active execution. Both `UNDO` and `REDO` are required during recovery.
*   **Checkpoint**: A log record indicating that all dirty memory blocks have been safely written to disk. During recovery, the DBMS only needs to scan the log back to the last checkpoint, drastically reducing recovery time.
