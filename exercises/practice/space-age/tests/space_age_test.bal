import ballerina/test;

@test:Config {
    dataProvider: happyTestCases
}
function testFunction(string planet, int seconds, float expected) {
    test:assertEquals(age(planet, seconds), expected);
}

function happyTestCases() returns map<[string, int, float]>|error {
    return {
        "age on Earth": ["Earth", 1000000000, 31.69],
        "age on Mercury": ["Mercury", 2134835688, 280.88],
        "age on Venus": ["Venus", 189839836, 9.78],
        "age on Mars": ["Mars", 2129871239, 35.88],
        "age on Jupiter": ["Jupiter", 901876382, 2.41],
        "age on Saturn": ["Saturn", 2000000000, 2.15],
        "age on Uranus": ["Uranus", 1210123456, 0.46],
        "age on Neptune": ["Neptune", 1821023456, 0.35]
    };
}

@test:Config {}
function negativeTestFunction() {
    float|error result = age("Sun", 680804807);
    if result is error {
        test:assertEquals(result.message(), "not a planet");
    } else {
        test:assertFail("Expected an error");
    }
}
