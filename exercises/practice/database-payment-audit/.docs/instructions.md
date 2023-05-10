# Database Payment Audit

## Problem Statement

ABC Corp needs you to load all the data from the SQL database into a [Ballerina table](https://ballerina.io/learn/by-example/table-syntax/) for further processing. Then you need to find the names of employees who have payment entries greater than a given amount (e.g., 3000.00) by querying the loaded Ballerina table.

**Step 1:**

Create a Ballerina table with the following columns. 

`payment_id` - integer

`amount` - decimal

`employee_name` - string

**Step 2:**

Populate above Ballerina table by loading the corresponding full data set in the H2 database. Use the `payment_id` as the primary key of the table.

**Step 3**

Query the Ballerina table using Ballerina query expressions to find the employee names who has payment entries greater than the given amount. Order the result by the name of employee in ascending order. Remove the duplicate name entries in the result before returning.

> NOTE : It is mandatory to use Balerina table to implement the solution.

## Database Details

Use the provided H2 database for this problem.

> The sample database file is `gofigure.mv.db`, and the database name is `gofigure`. It is given within the `db` folder.

The following tables are already in the sample H2 database with some sample data. The column names and data types are below.

**Table name** : `Employee`

| **Columns:**      | type |
| -----------       | ----------- |
| `employee_id`     | integer, auto-incremented primary key       |
| `name`            | string        |
| `city`            | string        |
| `department`      | string        |
| `age`             | integer        |

**Table Name**: `Payment`

| **Columns:**      | type |
| -----------       | ----------- |
| `payment_id`      | integer, auto-incremented primary key       |
| `date`            | date        |
| `amount`          | decimal        |
| `employee_id`     | integer        |
| `reason`          | string        |

* The database file is `gofigure.mv.db`. Use the JDBC URL as `jdbc:h2:file:/path/to/db/file`
* Username: `root`
* Password: `root`

## Constraints

* Use the H2 database file provided in the `db` folder to validate queries and the Ballerina sample
* Use the maven dependency params approach to add the H2 database driver as a platform dependency in your Ballerina.toml

## Test Environment

* You can run the tests with `bal test` and it will run tests against the given sample DB.

## Examples

### Example 1

**Input:** dbFilePath : `“/Path/to/file/gofigure”`, amount : `3000`

**Output:** `["Amanda Hug", "Anita Bath"]`

## Hints

* Use the [ballerinax/java.jdbc](https://central.ballerina.io/ballerinax/java.jdbc) module to work with the database
* Refer to the [Prerequisite](https://lib.ballerina.io/ballerinax/java.jdbc/latest) section for steps to add the JDBC driver as a dependency
* Use [query](https://lib.ballerina.io/ballerinax/java.jdbc/latest#Client-query)  remote method to query data from DB
* Refer the [Simple query](https://ballerina.io/learn/by-example/mysql-query-operation) example
* Refer the [Table syntax](https://ballerina.io/learn/by-example/table) example
* Use [Querying tables](https://ballerina.io/learn/by-example/querying-tables) to find the required data from the Ballerina table
