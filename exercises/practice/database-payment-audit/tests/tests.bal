import ballerina/test;
@test:Config {
    dataProvider: data
}
function getHighValuesTest(string dbFilePath, decimal amount, string[] expected) returns error? {
    string[]|error returnedValues  = getHighPaymentEmployees(dbFilePath, amount);
    if(returnedValues is string[]) {
        test:assertEquals(returnedValues, expected);
    } else {
        test:assertFail(returnedValues.message());
    }
}
