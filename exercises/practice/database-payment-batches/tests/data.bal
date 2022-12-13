function data() returns map<[string, string, int[]]>|error {
    map<[string, string, int[]]> dataSet = {
        "Test1": ["./db/gofigure", "tests/resources/payments.json", [8, 9, 10]],
        "Test2": ["./db/gofigure", "tests/resources/payments_eval1.json", [8]]
    };
    return dataSet;
}

function dataEmpty() returns map<[string, string]>|error {
    map<[string, string]> dataSet = {
        "Test3": ["./db/gofigure", "tests/resources/payments_eval2.json"],
        "Test4": ["./db/gofigure", "tests/resources/payments_eval3.json"]
    };
    return dataSet;
}
