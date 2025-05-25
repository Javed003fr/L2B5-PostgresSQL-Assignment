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
