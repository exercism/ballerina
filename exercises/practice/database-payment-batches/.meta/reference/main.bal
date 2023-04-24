import ballerina/io;
import ballerina/sql;
import ballerinax/java.jdbc;

type Payment record {
    int employee_id;
    decimal amount;
    string date;
    string reason;

};

function addPayments(string dbFilePath, string paymentFilePath) returns error|int[] {
    json inputJson = check io:fileReadJson(paymentFilePath);
    Payment[] convertedInput = check inputJson.cloneWithType();

    sql:ParameterizedQuery[] insertQueries =
        from var data in convertedInput
        select `INSERT INTO PAYMENT(date, amount, employee_id, reason)
                        VALUES (${data.date}, ${data.amount},
                        ${data.employee_id}, ${data.reason})`;

    jdbc:Client dbClient = check new ("jdbc:h2:file:" + dbFilePath, "root", "root");

    sql:ExecutionResult[] result =
                            check dbClient->batchExecute(insertQueries);

    int[] generatedIds = [];
    foreach var summary in result {
        generatedIds.push(<int>summary.lastInsertId);
    }
    io:println("\nInsert success, generated IDs are: ", generatedIds, "\n");

    return generatedIds;
}
