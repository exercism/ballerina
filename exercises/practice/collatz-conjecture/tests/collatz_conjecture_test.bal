import ballerina/test;

@test:Config {
    dataProvider: happyCases
}
function testCollatzOK(int number, int expected) returns error? {
    test:assertEquals(collatzSteps(number), expected);
}

function happyCases() returns map<[int, int]>|error {
    // a tuple of: [input value, expected result]
    map<[int, int]> cases = {
        "zero steps for one": [1, 0],
        "divide if even": [16, 4],
        "even and odd steps": [12, 9],
        "large number of even and odd steps": [1000000, 152]
    };
    return cases;
}

@test:Config {
    dataProvider: errorCases
}
function testCollatzErrors(int number, string errMsg) returns error? {
    int|error e = collatzSteps(number);
    if e is error {
        test:assertEquals(e.message().toString(), errMsg);
    } else {
        test:assertFail(msg = "Expecting an error");
    }
}

function errorCases() returns map<[int, string]>|error {
    // a tuple of: [input value, expected error message]
    map<[int, string]> cases = {
        "zero is an error": [0, "Only positive integers are allowed"],
        "negative value is an error": [-15, "Only positive integers are allowed"]
    };
    return cases;
}
