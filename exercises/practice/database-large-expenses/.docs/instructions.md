# Database Large Expenses

## Problem Statement

ABC Corp needs you to find the name and department of employees with payment entries greater than a  given amount (e.g., `3000.00`).

Create a record named `HighPayment` to return the required data. The definition of the record is as follows.

```ballerina
type HighPayment record {
    string name;
    string department;
    decimal amount;
    string reason;
};
```

Use the `query` operation of the JDBC client to get the required data from the database.

> NOTE: Order the result by the `payment_id` in ascending order.

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

* You can run the tests with `bal test`, which will run against the given sample DB.

## Examples

### Example 1

**Input:** dbFilePath : `“/Path/to/file/gofigure”`, amount : `3000`

**Output:** `[{"name":"Anita Bath","department":"Marketing", "amount":3400, "reason": "Stationary"}, {"name":"Amanda Hug","department":"Engineering", "amount":4400, "reason": "Travel expenses"}]`

## Hints

* Use the [ballerinax/java.jdbc](https://central.ballerina.io/ballerinax/java.jdbc) module to work with the database
* Refer to the [Prerequisite](https://lib.ballerina.io/ballerinax/java.jdbc/latest) section for steps to add the JDBC driver as a dependency
* Use [query](https://lib.ballerina.io/ballerinax/java.jdbc/latest#Client-query) remote method to query data from DB
* Refer the [Simple query](https://ballerina.io/learn/by-example/mysql-query-operation) example
* Use the Ballerina [stream](https://ballerina.io/learn/by-example/stream-type) type to access the data
* Use SQL joins to find the required dataset from the DB
