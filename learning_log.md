## 26/11/26

Floating Point numbers are stored in binary format, some of the information is lost as some decimals like 0.1 cannot be represented in binary format. This is done for faster access but it costs in accuracy, so it is recommended to use DECIMAL/NUMERIC for exact decimals.

Check Column constraint - negative number violates the constraint for amount column 
ERROR:  new row for relation "fuel_types" violates check constraint "fuel_types_price_per_litre_check"

Foreign key constaint - nozzle refers to tank number that doesn't exists which is not allowed as this might lead to false data
ERROR:  insert or update on table "nozzles" violates foreign key constraint "nozzles_tank_id_fkey"

Unique Column Contraint - name must be unique for fuel types as duplicate fuel types should not exist
ERROR:  duplicate key value violates unique constraint "fuel_types_name_key"

Delete Foreign key Constraint - Deleting a row in tanks should not be allowed as another table is dependent on this table, as deleting can lead to empty columns in the nozzles table
ERROR:  update or delete on table "tanks" violates foreign key constraint "nozzles_tank_id_fkey" on table "nozzles"

Normalization: Organizing tables and columns in relational database to reduce data redundancy and prevent insertion, deletion, and update anomolies.

### Core Normal Forms
1NF (First Normal Form) - Every row must have atomic values and should be uniquely identifiable.
Eliminates multi-valued cells and repeating columns (e.g., Phone1, Phone2).

2NF (Second Normal Form) - 1NF and every non-key attribute depends on the primary key, no partial dependency.
Removes duplication when there is composite primary key.

3NF (Third Normal Form)	- 2NF and every non-key attribute depends only on the primary ke, no transitive dependency.	
Prevents update anomalies.

BCNF (Boyce–Codd Normal Form) - 3NF and for every functional dependency X -> Y, X must be a superkey.
Fixes edge cases in 3NF involving overlapping candidate keys.

### Notes:

Surrogate keys are system-generated identifiers (like auto-incrementing IDs or UUIDs) with no actual business meaning
Natural keys come from real-world attributes (like an email or passport number) that uniquely identify a row. 

Referential Integrity is rule for foreign keys such that it prevents NULL or orpaned records, and that primary key must be existing before data is entered.

Using a surrogate key as the primary key keeps foreign keys small and stable, so updates to business attributes don't ripple across child tables.We can still add UNIQUE constraint on a natural key to stop duplicates without making it the foreign key target