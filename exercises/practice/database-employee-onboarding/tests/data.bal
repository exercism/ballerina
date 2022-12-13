function validInsertionTestData() returns map<[string, string, string, string, int, int]>|error {
    map<[string, string, string, string, int, int]> dataSet = {
        "Test1": ["./db/gofigure", "Alex", "Colombo", "Sales", 24, 12]

    };
    return dataSet;
}

function invalidInsertionTestData() returns map<[string, string, string, string, int, int]>|error {
    map<[string, string, string, string, int, int]> dataSet = {
        "Test2": ["./db/invalidDB", "John", "Colombo", "HR", 25, -1],
        "Test3": ["./db/gofigure", "John", "Colombo", "HR", 2147483649, -1]
    };
    return dataSet;
}
