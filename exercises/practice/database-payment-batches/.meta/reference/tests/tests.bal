import ballerina/test;
import ballerina/io;
@test:Config {
    dataProvider: data
}
function addBatchTest(string dbFilePath, string paymentFilePath, int[] expected) returns error? {
    int[]|error returnedValues  = addPayments(dbFilePath, paymentFilePath);
    if(returnedValues is int[]) {
        test:assertTrue(returnedValues[0] >=  expected[0]);
        test:assertTrue(returnedValues[1] >=  expected[1]);
        test:assertTrue(returnedValues[2] >=  expected[2]);
    } else {
        io:println("Returned values: ", returnedValues);
        test:assertFail(returnedValues.message());
    }
}
