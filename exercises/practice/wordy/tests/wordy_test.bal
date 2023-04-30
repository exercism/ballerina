import ballerina/test;

@test:Config {
    enable: false
}
function justANumber() {
    test:assertEquals(5, Wordy.Answer("What is 5?"));
}

@test:Config {
    enable: false
}
function addition() {
    test:assertEquals(2, Wordy.Answer("What is 1 plus 1?"));
}

@test:Config {
    enable: false
}
function moreAddition() {
    test:assertEquals(55, Wordy.Answer("What is 53 plus 2?"));
}

@test:Config {
    enable: false
}
function additionWithNegativeNumbers() {
    test:assertEquals(-11, Wordy.Answer("What is -1 plus -10?"));
}

@test:Config {
    enable: false
}
function largeAddition() {
    test:assertEquals(45801, Wordy.Answer("What is 123 plus 45678?"));
}

@test:Config {
    enable: false
}
function subtraction() {
    test:assertEquals(16, Wordy.Answer("What is 4 minus -12?"));
}

@test:Config {
    enable: false
}
function multiplication() {
    test:assertEquals(-75, Wordy.Answer("What is -3 multiplied by 25?"));
}

@test:Config {
    enable: false
}
function division() {
    test:assertEquals(-11, Wordy.Answer("What is 33 divided by -3?"));
}

@test:Config {
    enable: false
}
function multipleAdditions() {
    test:assertEquals(3, Wordy.Answer("What is 1 plus 1 plus 1?"));
}

@test:Config {
    enable: false
}
function additionAndSubtraction() {
    test:assertEquals(8, Wordy.Answer("What is 1 plus 5 minus -2?"));
}

@test:Config {
    enable: false
}
function multipleSubtraction() {
    test:assertEquals(3, Wordy.Answer("What is 20 minus 4 minus 13?"));
}

@test:Config {
    enable: false
}
function subtractionThenAddition() {
    test:assertEquals(14, Wordy.Answer("What is 17 minus 6 plus 3?"));
}

@test:Config {
    enable: false
}
function multipleMultiplication() {
    test:assertEquals(-12, Wordy.Answer("What is 2 multiplied by -2 multiplied by 3?"));
}

@test:Config {
    enable: false
}
function additionAndMultiplication() {
    test:assertEquals(-8, Wordy.Answer("What is -3 plus 7 multiplied by -2?"));
}

@test:Config {
    enable: false
}
function multipleDivision() {
    test:assertEquals(2, Wordy.Answer("What is -12 divided by 2 divided by -3?"));
}

@test:Config {
    enable: false
}
function unknownOperation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 52 cubed?"));
}

@test:Config {
    enable: false
}
function nonMathQuestion() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("Who is the President of the United States?"));
}

@test:Config {
    enable: false
}
function rejectProblemMissingAnOperand() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus?"));
}

@test:Config {
    enable: false
}
function rejectProblemWithNoOperandsOrOperators() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is?"));
}

@test:Config {
    enable: false
}
function rejectTwoOperationsInARow() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus plus 2?"));
}

@test:Config {
    enable: false
}
function rejectTwoNumbersInARow() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus 2 1?"));
}

@test:Config {
    enable: false
}
function rejectPostfixNotation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 2 plus?"));
}

@test:Config {
    enable: false
}
function rejectPrefixNotation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is plus 1 2?"));
}
