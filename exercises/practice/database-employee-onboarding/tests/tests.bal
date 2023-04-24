import ballerina/test;
import ballerina/sql;
import ballerinax/java.jdbc;

@test:Config {
    dataProvider: validInsertionTestData
}
function addEmployeeTest(string dbFilePath, string name, string city, string department, int age, int expected) returns error? {
    test:assertTrue(addEmployee(dbFilePath, name, city, department, age) > expected);
}

@test:Config {
    dataProvider: invalidInsertionTestData
}
function addEmployeeTestInvalid(string dbFilePath, string name, string city, string department, int age, int expected) returns error? {
    test:assertEquals(addEmployee(dbFilePath, name, city, department, age), expected);
}

@test:Config {
}
function checkExactInsertValue() returns error? {
    int employeeIDActual = addEmployee("./db/gofigure", "PeterTest125", "Kandy", "Sales", 54);
    string employeeNameInDB = "";
    jdbc:Client|sql:Error dbClient = new ("jdbc:h2:file:" + "./db/gofigure", "root", "root");
    if (dbClient is jdbc:Client) {
        stream<record {}, error?> resultStream2 = dbClient->query(`SELECT name FROM EMPLOYEE where employee_id = ${employeeIDActual}`);
        record {|record {} value;|}|error? result = resultStream2.next();
        if result is record {|record {} value;|} {
            employeeNameInDB = <string>result.value["NAME"];
        }
        check resultStream2.close();
    }
    test:assertEquals(employeeNameInDB, "PeterTest125");
}
