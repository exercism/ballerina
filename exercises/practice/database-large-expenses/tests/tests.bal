import ballerina/test;

@test:Config {
    dataProvider: data
}
function addHighPaymentTest(string dbFilePath, decimal amount, HighPayment[] expected) returns error? {
    HighPayment[]|error returnedValues = getHighPaymentDetails(dbFilePath, amount);
    if (returnedValues is HighPayment[]) {
        test:assertEquals(expected, returnedValues);
    } else {
        test:assertFail(returnedValues.message());
    }
}

@test:Config {
    dataProvider: data
}
function addHighPaymentTestFull(string dbFilePath, decimal amount, HighPayment[] expected) returns error? {
    HighPayment[]|error returnedValues = getHighPaymentDetails(dbFilePath, amount);
    if (returnedValues is HighPayment[]) {
        test:assertEquals(expected, returnedValues);
    } else {
        test:assertFail(returnedValues.message());
    }
}
