import ballerina/sql;
import ballerinax/java.jdbc;

function addEmployee(string dbFilePath, string name, string city, string department, int age) returns int|error {
    int id = -1;
    jdbc:Client dbClient = check new ("jdbc:h2:file:" + dbFilePath, "root", "root");
    sql:ExecutionResult result = check dbClient->execute(`INSERT INTO EMPLOYEE(name, city, department, age) 
        VALUES (${name},${city},${department},${age})`);
    id = <int>result.lastInsertId;
    return id;
}
