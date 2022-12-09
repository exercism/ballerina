import ballerina/test;
import ballerina/io;

@test:Config {
    dataProvider: data
}
function addBatchTest(string dbFilePath, string paymentFilePath, int[] expected) returns error? {
    int[]|error returnedValues = addPayments(dbFilePath, paymentFilePath);
    if (returnedValues is int[]) {
        int index = 0;
        foreach int i in returnedValues {
            test:assertTrue(i >= expected[index]);
            index += 1;
        }
        test:assertEquals(returnedValues.length(), expected.length());
    } else {
        io:println("Returned values: ", returnedValues);
        test:assertFail(returnedValues.message());
    }
}

@test:Config {
    dataProvider: dataEmpty
}
function addBatchTestEmpty(string dbFilePath, string paymentFilePath) returns error? {
    int[]|error returnedValues = addPayments(dbFilePath, paymentFilePath);
    test:assertTrue(returnedValues is error);
}
