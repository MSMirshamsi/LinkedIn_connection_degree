# LinkedIn Connection Degree Finder (SQL Project)

## Project Description
This project demonstrates an advanced use of **Recursive CTE (Common Table Expressions)** in SQL to find the **connection degree between two users in a social network similar to LinkedIn**.

The main goal is to determine the **shortest connection path** between a source user and a target user. In other words, it calculates how many steps or "connections" are needed to reach from one user to another.

---

## Key Features
- Uses **Recursive CTE** to traverse user connections.
- Calculates the **minimum degree of connection** between two users.
- Checks for both direct and indirect connections.
- Returns `NULL` if there is no possible connection between the users.
- Limits unnecessary paths using a filtering condition (`WHERE`).

---

## Sample Table
The main table used in this project: `connections`  

| user_1 | user_2 |
|--------|--------|
| 256    | 300    |
| 300    | 400    |
| 400    | 512    |
| 256    | 350    |
| 350    | 512    |

- `user_1` → source user  
- `user_2` → target user  
- Each row represents a direct connection between two users.
