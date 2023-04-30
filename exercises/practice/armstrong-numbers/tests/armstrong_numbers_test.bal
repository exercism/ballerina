import ballerina/test;

@test:Config {
    enable: false
}
function zeroIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(0));
}

@test:Config {
    enable: false
}
function singleDigitNumbersAreArmstrongNumbers() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(5));
}

@test:Config {
    enable: false
}
function thereAreNoTwoDigitArmstrongNumbers() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(10));
}

@test:Config {
    enable: false
}
function threeDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(153));
}

@test:Config {
    enable: false
}
function threeDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(100));
}

@test:Config {
    enable: false
}
function fourDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(9474));
}

@test:Config {
    enable: false
}
function fourDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(9475));
}

@test:Config {
    enable: false
}
function sevenDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(9926315));
}

@test:Config {
    enable: false
}
function sevenDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(9926314));
}
