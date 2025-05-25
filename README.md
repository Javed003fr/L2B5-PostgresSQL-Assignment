1. What is PostgresSQL?
   => PostgresSQL is an extremely powerful piece of software with open-source object-relational database system. it's widely used for enterprise-level perofrmance and reliability. PostgresSQL is fast. In benchmarks, PostgresSQL either exceeds or matches the performance of many other databses, both open source and proprietary.

   PostgresSQL known for its robust features, flexibility and standards complicance. it supports both SQL (relational) and JSON(non-relational) querying, making it suitable for a wide range of applications. PostgresSQL gives opportunity to write stored procedures and functions in numerous programming languages. In addition to the prepackaged languages of C, SQL, and PL/pgSQL, you can easily eanble support for additional languages such as PL/Perl, PL/Python, PL/V8 (know as PL/JavaScript), PL/Ruby, and PL/R. This support for a wide variety of languages allows to choose the language with constructs that can best solve the problem at hand.

   PostgresSQL is used as a primary database for many web applications as well as mobile and analytics applications.

   The PostgresSQL project statred in 1986 at Berkeley Computer Science Department, University of California. The project was originally named POSTGRES.
   In 1996, the PostgresSQL project was renamed to PostgresSQL to clearly illustrate its support for SQL. Since then, the PostgreSQL Global Development Group, a dedicated community of contributors continues to make the releases of the open-source and free database project.


2. What is the purpose of a database schema in PostgresSQL?
   => A schema is a folder within a PostgreSQL database that organizes tables, views, functions, sequences and other objects. Its primary purpose is to provide a structured and logical way to manage complex databses, enabling better organization, access control and data isolation.
   When we create a new database, PostgreSQL automatically creates a schema _public_ to store bojects that is created.

   **Purpose of a schema in PostgreSQL**

   - schema help separate and categorize table, views etc based on purpose of function.
   - It can avoid name confilicts, ex: you can have multiple tables with tha same name in different schemas
   - PostgreSQL group objects locially for better manageability.
   - By creating separate shcemas one can isolate data from different clients or modules.
   - Developers or teams can work in separate schemas without interfering with each other.
   - PostgreSQL can grant or restrict access at the schema level.
   - PostgreSQL uses the 'serch_path' to determine which schema to look in when an object is referenced without a schema.


3. Explain the Primary Key and Foreign Key concepts in PostgresSQL?
   => Keys are one of the most important elements in a relational database to maintain the realtionship between the tables.

   **Primary Key in PostgreSQL**
   A primary key uniquely identifies each row in a table. It ensures that not two rows have the same identifier and it cannot contain null values.

   Characteristics of Primary Key:

   - Must be unique - Ensures no duplicate values.
   - Cannot be NULL - Guarantees that every row has a valid indentifier.
   - Only one primary key is allowed in a table.

   Syntex Example:
   CREATE TABLE rangers (
   ranger_id SERIAL PRIMARY KEY,
   full_name VARCHAR(50),
   region VARCHAR(50)
   )

   **Foreign Key in PostgreSQL:**
   A foreign key is column or group of columns that creates a link between two tables. Foreign key is a column or columns in one table that references the Primary Key of another table.

   Characteristics of Foreign Key:

   - Enforces referential integrity - ensures data consistency across tables
   - Ensures relationships between datasets.
   - Prevent invalid entries by enforcing constraints.
   - Can be configured to cascade updates/deletes.

   Syntex Example:
   CREATE TABLE sightings (
   sighting_id SERIAL PRIMARY KEY,
   ranger_id INTEGER REFERENCES rangers(ranger_id),
   species_id INTEGER REFERENCES species(species_id),
   sighting_time TIMESTAMP,
   location VARCHAR(50)
   )


4. What is the difference between the 'VARCHAR'and 'CHAR'data types?
   => VARCHAR and CHAR are two essential character storage types in relational database management system. Refer to the difference between VARCHAR and CHAR for elaborate one-on-one difference between them -

   **VARCHAR(n) data type**

   - VARCHAR stands for "Variable Characters".
   - VARCHAR is a variable-length data type. Defining a column as VARCHAR(n) allows storage of strings up to n characters, using only as much space as needed for each entry. The (n) is referred to as the maximum limit of characters to be stored.
   - VARCHAR is used when the length of data is unknown.
   - VARCHAR considers a space of 1 byte for each character and it also considers some more bytes to store information about length.
   - VARCHAR has the concept of dynamic memory allocation.
   - VARCHAR can store data up to 65,535 characters.
   - It does not pad values, it sotres only the acutal data without adding extra spaces.

   _Example :_
   CREATE TABLE rangers (
   email VARCHAR(50)
   )

   **CHAR(n) data type**

   - CHAR stands for "Character".
   - CHAR data type is used to store characters of fixed length. The (n) is referred to as the length specified at the time of creating the field where the characters will be stored.
   - It stores characters of fixed length.
   - CHAR is used when the length of data is known so that we declare the field with same length.
   - CHAR is considers a space of 1 byte for storing each character.
   - CHAR has the concept of static memory allocation.
   - CHAR can store data up to 255 characters.

   _Example :_
   CREATE TABLE rangers (
   name CHAR(20)
   )

   The main difference between VARCHAR and CHAR is how they store character data in a database.

5. Explain the purpose of the 'WHERE' Clause in a 'SELECT' statement.
   => "WHERE" clause in a "SELECT" statement is one of the most important parts of SQL, It's used to filter data that is, to return only the column that meet specific conditions.

   - It apply conditions to columns (ex: match, compare, check, null)
   - It work with logical operatior (AND, OR, NOT)
   - It use pattern matching (LIKE, ILIKE)
   - WHERE clause use for filter joined tables, aggregate data or subqueries

   _Basic Syntex :_

   ```sql
   SELECT column1, column2
   FROM table_name
   WHERE condition;
   ```

   - To Filter by value:

   ```sql
   SELECT * FROM rangers
   WHERE region = 'Coastal Plains';
   ```

   - To shows sighting on or after May-1, 2024.

   ```sql
   SELECT * FROM sightings
   WHERE sighting_time >= '2024-05-01';
   ```

   - Filter species that are endangered and discovered before 1800.

   ```sql
   SELECT * FROM species
   WHERE conservation_status = 'Endangered' AND discovery_date < '1800-01-01';
   ```

   - Finds sightings where the location ends with 'Pass'.

   ```sql
   SELECT * FROM  sightings
   WHERE location LIKE '%Pass';
   ```

6. What are the LIMIT and OFFSET clauses used for ?
   => LIMIT and OFFSET are SQL clauses used for efficeint data retrival. LIMIT restricts the number of rows return from a query, useful for displaying specific results.

   _Example :_

```sql
SELECT * FROM sightings LIMIT 5;
```

It will return the first 5 rows from the sightings table.

OFFSET skips a certain number of rows, enabling pagination and efficient navigation through large datasets. Together, they optimize query performance and enhance use experience by managing data effectively.

_Example :_

```sql
SELECT * FROM sightings OFFSET 5;
```

It will skips the first 5 rows, then return the rest.



