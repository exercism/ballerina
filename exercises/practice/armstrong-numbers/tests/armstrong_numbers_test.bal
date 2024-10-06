
import ballerina/test;

@test:Config
function testZeroIsArmstrongNumber() {
    test:assertTrue(isArmstrongNumber(0));
}

@test:Config {
    enable: false
}
function testSingleDigitIsArmstrongNumber() {
    test:assertTrue(isArmstrongNumber(5));
}

@test:Config {
    enable: false
}
function testTwoDigitIsNotArmstrongNumber() {
    test:assertFalse(isArmstrongNumber(10));
}

@test:Config {
    enable: false
}
function testThreeDigitIsArmstrongNumber() {
    test:assertTrue(isArmstrongNumber(153));
}

@test:Config {
    enable: false
}
function testThreeDigitIsNotArmstrongNumber() {
    test:assertFalse(isArmstrongNumber(100));
}

@test:Config {
    enable: false
}
function testFourDigitIsArmstrongNumber() {
    test:assertTrue(isArmstrongNumber(9474));
}

@test:Config {
    enable: false
}
function testFourDigitIsNotArmstrongNumber() {
    test:assertFalse(isArmstrongNumber(9475));
}

@test:Config {
    enable: false
}
function testSevenDigitIsArmstrongNumber() {
    test:assertTrue(isArmstrongNumber(9926315));
}

@test:Config {
    enable: false
}
function testSevenDigitIsNotArmstrongNumber() {
    test:assertFalse(isArmstrongNumber(9926314));
}
