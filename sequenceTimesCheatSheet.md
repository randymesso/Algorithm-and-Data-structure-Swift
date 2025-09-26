# Swift Collection Time & Space Complexity

This document summarizes the iteration, lookup, and mutation complexities for common Swift collection types.

---

## 1. Array

- **Iteration**: `O(n)` — goes through elements linearly.  
- **Lookup by index** (`array[i]`): `O(1)` — random access.  
- **Search by value** (`array.contains(x)`): `O(n)` — must check each element until found.  
- **Append at end**:  
  - Amortized: `O(1)` (buffer grows in chunks)  
  - Worst-case: `O(n)` (when resizing happens)  
- **Insert/remove at arbitrary index**: `O(n)` — must shift elements.  
- **Update at index** (`array[i] = val`): `O(1)`  

---

## 2. Set

- **Iteration**: `O(n)` — each element is visited once.  
- **Lookup** (`set.contains(x)`):  
  - Average: `O(1)` (hash-based)  
  - Worst-case: `O(n)` (hash collisions)  
- **Insert**:  
  - Average: `O(1)`  
  - Worst-case: `O(n)` (collisions / resize)  
- **Remove**:  
  - Average: `O(1)`  
  - Worst-case: `O(n)`  
- **Update (re-insert)**: Same as insert, usually `O(1)`  

---

## 3. Dictionary

- **Iteration**: `O(n)` — iterates over all key-value pairs.  
- **Lookup by key** (`dict[key]`):  
  - Average: `O(1)`  
  - Worst-case: `O(n)` (hash collisions)  
- **Insert (new key)**:  
  - Average: `O(1)`  
  - Worst-case: `O(n)`  
- **Update (existing key)**:  
  - Average: `O(1)`  
- **Remove (by key)**:  
  - Average: `O(1)`  
  - Worst-case: `O(n)`  

---

## 4. String

Swift `String` is a collection of `Character`s, but since it’s **Unicode-correct**, indexing isn’t constant-time like in `Array`.

- **Iteration**: `O(n)` — where `n` = number of characters.  
- **Lookup by index** (`string[string.index(...)]`): `O(k)` — `k` is distance from the start (traverses grapheme clusters).  
- **Search by value** (`string.contains("abc")`): `O(n * m)` — `m` = substring length.  
- **Append (to end)**:  
  - Amortized: `O(1)` (like `Array`, buffer grows in chunks)  
  - Worst-case: `O(n)` (when resizing happens)  
- **Insert/remove at arbitrary index**: `O(n)` — must traverse and shift characters, plus handle Unicode boundaries.  
- **Update character at index**: `O(n)` — must traverse from start to the index.  

---

## 📊 Comparison Summary Table

| Operation                  | Array                  | Set                    | Dictionary             | String                   |
|----------------------------|------------------------|------------------------|------------------------|--------------------------|
| **Iteration**              | `O(n)`                | `O(n)`                | `O(n)`                | `O(n)` (chars)          |
| **Lookup by index/key**    | `O(1)`                | `O(1)` avg, `O(n)` wc  | `O(1)` avg, `O(n)` wc  | `O(k)` (distance-based) |
| **Search by value**        | `O(n)`                | `O(1)` avg, `O(n)` wc  | `O(1)` avg, `O(n)` wc  | `O(n*m)` (substring)    |
| **Append**                 | Amortized `O(1)`       | `O(1)` avg, `O(n)` wc  | `O(1)` avg, `O(n)` wc  | Amortized `O(1)`        |
| **Insert/remove (anywhere)** | `O(n)`                | `O(1)` avg, `O(n)` wc  | `O(1)` avg, `O(n)` wc  | `O(n)`                  |
| **Update**                 | `O(1)` (by index)     | `O(1)` avg, `O(n)` wc  | `O(1)` avg, `O(n)` wc  | `O(n)` (must traverse)  |

> wc = worst-case (hash collisions or buffer resize)

---
