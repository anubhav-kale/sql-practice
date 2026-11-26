26/11/26

**floating-point numbers are stored in binary, and many decimals, like 0.1, can't be represented exactly in binary.** They get stored as a very close approximation. One tiny error doesn't matter, but across thousands of sales the errors add up, and your totals stop matching the cash register. `numeric`/`DECIMAL` stores decimals exactly.

Check Column constraint
ERROR:  new row for relation "fuel_types" violates check constraint "fuel_types_price_per_litre_check"

Foreign key constaint
ERROR:  insert or update on table "nozzles" violates foreign key constraint "nozzles_tank_id_fkey"

Unique Column Contraint
ERROR:  duplicate key value violates unique constraint "fuel_types_name_key"

Delete Foreign key Constraint
ERROR:  update or delete on table "tanks" violates foreign key constraint "nozzles_tank_id_fkey" on table "nozzles"

Normalization: Organizing tables and columns in relational database to reduce data redundancy and prevent insertion, deletion, and update anomolies.

Core Normal Forms
1NF (First Normal Form) - Every column holds atomic (indivisible) values, each row is unique, and there are no repeating groups.	
Eliminates multi-valued cells and repeating columns (e.g., Phone1, Phone2).

2NF (Second Normal Form) - Meets 1NF, and every non-key attribute depends on the entire primary key (no partial dependency).	Removes duplication when a table uses a composite primary key.

3NF (Third Normal Form)	- Meets 2NF, and every non-key attribute depends only on the primary key—not on other non-key attributes (no transitive dependency).	
Prevents update anomalies caused by derived or indirectly related columns.

BCNF (Boyce–Codd Normal Form) - A stricter version of 3NF: for every functional dependency X -> Y, X must be a superkey.	Fixes edge cases in 3NF involving overlapping candidate keys.


Surrogate keys are system-generated identifiers (like auto-incrementing IDs or UUIDs) with no business meaning, whereas natural keys come from real-world attributes (like an email or passport number) that uniquely identify a row. 

Referential integrity is the rule that foreign keys in a child table must match an existing primary (or unique) key in a parent table—or be NULL—so you don't end up with orphaned records
