# Database Payment Batches

## Problem Statement

You have to insert a batch of payment data into the `Payment` table. Your task is to read the payment data from the given input JSON file and use the `batchExecute` operation of the JDBC Client to insert the payment data into the `Payment` table. The sample input file is given as `payments.json`.

Input JSON file content is based on the following JSON schema.

```json
{
  "type": "array",
  "items": [
    {
      "type": "object",
      "properties": {
        "employee_id": {
          "type": "integer"
        },
        "amount": {
          "type": "number"
        },
        "reason": {
          "type": "string"
        },
        "date": {
          "type": "string"
        }
      },
      "required": [
        "employee_id",
        "amount",
        "reason",
        "date"
      ]
    }
  ]
}

```

You need to return the auto-generated payment IDs for the inserted payment data in the batch as the output without issuing another query to the database.

You can assume the `employee_id` given in the `payments.json` file are valid and already contained in the `Employee` table.

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
* You need to find the auto-generated payment IDs without issuing another query to the database.

## Test Environment

* You can run the tests with `bal test`, and it will run tests against the given sample DB.

## Examples

### Example 1

**Input:** dbFilePath: `"/path/to/file/gofigure"`, paymentFilePath: `"/path/to/file/payments.json"`

Sample `payments.json` file data:

```json
[{
        "employee_id": 4,
        "amount": 12500.50,
        "reason": "Fuel for the month January",
        "date": "2022-02-03"
    },
    {
        "employee_id": 1,
        "amount": 10500.50,
        "reason": "Medical Expenses for the month January",
        "date": "2022-02-04"
    },
    {
        "employee_id": 4,
        "amount": 500.50,
        "reason": "Fuel for the month February",
        "date": "2022-03-03"
    }
]

```

**Output:** `[1,2,3]`

## Hints

* Use the [ballerinax/java.jdbc](https://central.ballerina.io/ballerinax/java.jdbc) module to work with the database
* Refer to the [Prerequisite](https://lib.ballerina.io/ballerinax/java.jdbc/latest) section for steps to add the JDBC driver as a dependency
* Use [io:fileReadJson](https://lib.ballerina.io/ballerina/io/latest/functions#fileReadJson) to read the JSON input file
* Convert the JSON values to application-specific types to work with data in a type-safe manner. Refer the [Converting to user defined type](https://ballerina.io/learn/by-example/convert-from-json-to-user-defined-type/) example
* Use [sql:ParameterizedQuery](https://lib.ballerina.io/ballerina/sql/latest#ParameterizedQuery) and the [batchExecute](https://lib.ballerina.io/ballerinax/java.jdbc/latest#Client-batchExecute) remote method to work with the database
* Refer the [batch execute](https://ballerina.io/learn/by-example/mysql-batch-execute-operation/) example
