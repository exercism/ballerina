import ballerina/test;

@test:Config {
    enable: false
}
function cleansTheNumber() {
    var phrase = "(223) 456-7890";
    test:assertEquals("2234567890", PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function cleansNumbersWithDots() {
    var phrase = "223.456.7890";
    test:assertEquals("2234567890", PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function cleansNumbersWithMultipleSpaces() {
    var phrase = "223 456   7890   ";
    test:assertEquals("2234567890", PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidWhen_9Digits() {
    var phrase = "123456789";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidWhen_11DigitsDoesNotStartWithA_1() {
    var phrase = "22234567890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function validWhen_11DigitsAndStartingWith_1() {
    var phrase = "12234567890";
    test:assertEquals("2234567890", PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function validWhen_11DigitsAndStartingWith_1EvenWithPunctuation() {
    var phrase = "+1 (223) 456-7890";
    test:assertEquals("2234567890", PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidWhenMoreThan_11Digits() {
    var phrase = "321234567890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidWithLetters() {
    var phrase = "523-abc-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidWithPunctuations() {
    var phrase = "523-@:!-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfAreaCodeStartsWith_0() {
    var phrase = "(023) 456-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfAreaCodeStartsWith_1() {
    var phrase = "(123) 456-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfExchangeCodeStartsWith_0() {
    var phrase = "(223) 056-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfExchangeCodeStartsWith_1() {
    var phrase = "(223) 156-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfAreaCodeStartsWith_0OnValid_11DigitNumber() {
    var phrase = "1 (023) 456-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfAreaCodeStartsWith_1OnValid_11DigitNumber() {
    var phrase = "1 (123) 456-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfExchangeCodeStartsWith_0OnValid_11DigitNumber() {
    var phrase = "1 (223) 056-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}

@test:Config {
    enable: false
}
function invalidIfExchangeCodeStartsWith_1OnValid_11DigitNumber() {
    var phrase = "1 (223) 156-7890";
    Assert.Throws<ArgumentException>(() => PhoneNumber.Clean(phrase));
}
