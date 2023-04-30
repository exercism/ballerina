import ballerina/test;

@test:Config {
    enable: false
}
function smallestPerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(6));
}

@test:Config {
    enable: false
}
function mediumPerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(28));
}

@test:Config {
    enable: false
}
function largePerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(33550336));
}

@test:Config {
    enable: false
}
function smallestAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(12));
}

@test:Config {
    enable: false
}
function mediumAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(30));
}

@test:Config {
    enable: false
}
function largeAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(33550335));
}

@test:Config {
    enable: false
}
function smallestPrimeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(2));
}

@test:Config {
    enable: false
}
function smallestNonPrimeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(4));
}

@test:Config {
    enable: false
}
function mediumDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(32));
}

@test:Config {
    enable: false
}
function largeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(33550337));
}

@test:Config {
    enable: false
}
function edgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(1));
}

@test:Config {
    enable: false
}
function zeroIsRejectedAsItIsNotAPositiveInteger_() {
    Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(0));
}

@test:Config {
    enable: false
}
function negativeIntegerIsRejectedAsItIsNotAPositiveInteger_() {
    Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(-1));
}
