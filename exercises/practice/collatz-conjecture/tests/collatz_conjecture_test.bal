import ballerina/test;

@test:Config {
    enable: false
}
function zeroStepsForOne() {
    test:assertEquals(0, CollatzConjecture.Steps(1));
}

@test:Config {
    enable: false
}
function divideIfEven() {
    test:assertEquals(4, CollatzConjecture.Steps(16));
}

@test:Config {
    enable: false
}
function evenAndOddSteps() {
    test:assertEquals(9, CollatzConjecture.Steps(12));
}

@test:Config {
    enable: false
}
function largeNumberOfEvenAndOddSteps() {
    test:assertEquals(152, CollatzConjecture.Steps(1000000));
}

@test:Config {
    enable: false
}
function zeroIsAnError() {
    Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(0));
}

@test:Config {
    enable: false
}
function negativeValueIsAnError() {
    Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(-15));
}
