import ballerina/test;

@test:Config {}
function testZeroStepsForOne() {
    test:assertEquals(collatzSteps(1), 0);
}

@test:Config {}
function testDivideIfEven() {
    test:assertEquals(collatzSteps(16), 4);
}

@test:Config {}
function testEvenAndOddSteps() {
    test:assertEquals(collatzSteps(12), 9);
}

@test:Config {}
function testLargeNumberOfEvenAndOddSteps() {
    test:assertEquals(collatzSteps(1000000), 152);
}

@test:Config {}
function errorTestZero() {
    int|error e = collatzSteps(0);
    if e is error {
        test:assertEquals(e.message().toString(), "Only positive integers are allowed");
    } else {
        test:assertFail(msg = "Expecting an error");
    }
}

@test:Config {}
function errorTestNegative() {
    int|error e = collatzSteps(-15);
    if e is error {
        test:assertEquals(e.message().toString(), "Only positive integers are allowed");
    } else {
        test:assertFail(msg = "Expecting an error");
    }
}
