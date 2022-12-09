import ballerina/sql;
import ballerinax/java.jdbc;

function addEmployee(string dbFilePath, string name, string city, string department, int age) returns int {
    int id = -1;
    jdbc:Client|sql:Error dbClient = new ("jdbc:h2:file:" + dbFilePath, "root", "root");
    if (dbClient is jdbc:Client) {
        sql:ExecutionResult|error result = dbClient->execute(`INSERT INTO EMPLOYEE(name, city, department, age) 
            VALUES (${name},${city},${department},${age})`);
        if (result is sql:ExecutionResult) {
            id = <int>result.lastInsertId;
        }
    }
    return id;
}
