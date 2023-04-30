import ballerina/test;

@test:Config {
    enable: false
}
function firstPrime() {
    test:assertEquals(2, NthPrime.Prime(1));
}

@test:Config {
    enable: false
}
function secondPrime() {
    test:assertEquals(3, NthPrime.Prime(2));
}

@test:Config {
    enable: false
}
function sixthPrime() {
    test:assertEquals(13, NthPrime.Prime(6));
}

@test:Config {
    enable: false
}
function bigPrime() {
    test:assertEquals(104743, NthPrime.Prime(10001));
}

@test:Config {
    enable: false
}
function thereIsNoZerothPrime() {
    Assert.Throws<ArgumentOutOfRangeException>(() => NthPrime.Prime(0));
}
