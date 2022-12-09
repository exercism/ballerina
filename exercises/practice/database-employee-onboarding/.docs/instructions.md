# Database Employee Onboarding

## Problem Statement
Go Figure is planning to maintain all petty cash payment information to employees in a database. You are helping the finance department of Go Figure to implement these functionalities. Since Go Figure is expanding its operations, adding new employees to the system is a common requirement due to new hires.

Your task is to add the provided new employee details to the `Employee` table of the database and return the value of the auto-generated `employee_id` column without issuing another query to the database to find it. If an error occurs during the execution, `-1` should be returned.

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
* Do not issue another query to the database to find the auto-generated id

## Definition

You have to write your code inside the following function.

```ballerina
function addEmployee(string dbFilePath, string name, string city, string department, int age) returns int {
    // TODO: Write your code here
}
```

## Test Environment

* You can run the tests with `bal test`, and it will run tests against the given sample DB.

## Examples

### Example 1

**Input** : dbFilePath: `"./db/gofigure"`, name : `“John Doe”`, city: `“Omaha”`, department : `“Sales”`, age: `24`

**Output** : `4`

### Example 2

**Input** : dbFilePath: `"./db/invalidDB"`, name : `“John"`, city: `"Colombo"`, department : `"HR"`, age: `25`

**Output** : `-1`

## Hints

* Use the [ballerinax/java.jdbc](https://central.ballerina.io/ballerinax/java.jdbc) module to work with the database
* Refer to the [Prerequisite](https://lib.ballerina.io/ballerinax/java.jdbc/latest) section for steps to add the JDBC driver as a dependency
* Use the [execute](https://lib.ballerina.io/ballerinax/java.jdbc/latest/clients/Client#execute) remote method to insert data
* Refer the [DML and DDL operations](https://ballerina.io/learn/by-example/jdbc-execute-operation) examples
