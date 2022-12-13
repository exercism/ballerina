function data() returns map<[string, string, int[]]>|error {
    map<[string, string, int[]]> dataSet = {
        "Test1": ["./db/gofigure", "tests/resources/payments.json", [8, 9, 10]]

    };
    return dataSet;
}
