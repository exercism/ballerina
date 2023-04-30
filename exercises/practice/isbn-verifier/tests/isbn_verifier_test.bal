import ballerina/test;

@test:Config {
    enable: false
}
function validIsbn() {
    test:assertTrue(IsbnVerifier.IsValid("3-598-21508-8"));
}

@test:Config {
    enable: false
}
function invalidIsbnCheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21508-9"));
}

@test:Config {
    enable: false
}
function validIsbnWithACheckDigitOf_10() {
    test:assertTrue(IsbnVerifier.IsValid("3-598-21507-X"));
}

@test:Config {
    enable: false
}
function checkDigitIsACharacterOtherThanX() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21507-A"));
}

@test:Config {
    enable: false
}
function invalidCheckDigitInIsbnIsNotTreatedAsZero() {
    test:assertFalse(IsbnVerifier.IsValid("4-598-21507-B"));
}

@test:Config {
    enable: false
}
function invalidCharacterInIsbnIsNotTreatedAsZero() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-P1581-X"));
}

@test:Config {
    enable: false
}
function xIsOnlyValidAsACheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-2X507-9"));
}

@test:Config {
    enable: false
}
function validIsbnWithoutSeparatingDashes() {
    test:assertTrue(IsbnVerifier.IsValid("3598215088"));
}

@test:Config {
    enable: false
}
function isbnWithoutSeparatingDashesAndXAsCheckDigit() {
    test:assertTrue(IsbnVerifier.IsValid("359821507X"));
}

@test:Config {
    enable: false
}
function isbnWithoutCheckDigitAndDashes() {
    test:assertFalse(IsbnVerifier.IsValid("359821507"));
}

@test:Config {
    enable: false
}
function tooLongIsbnAndNoDashes() {
    test:assertFalse(IsbnVerifier.IsValid("3598215078X"));
}

@test:Config {
    enable: false
}
function tooShortIsbn() {
    test:assertFalse(IsbnVerifier.IsValid("00"));
}

@test:Config {
    enable: false
}
function isbnWithoutCheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21507"));
}

@test:Config {
    enable: false
}
function checkDigitOfXShouldNotBeUsedFor_0() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21515-X"));
}

@test:Config {
    enable: false
}
function emptyIsbn() {
    test:assertFalse(IsbnVerifier.IsValid(""));
}

@test:Config {
    enable: false
}
function inputIs_9Characters() {
    test:assertFalse(IsbnVerifier.IsValid("134456729"));
}

@test:Config {
    enable: false
}
function invalidCharactersAreNotIgnoredAfterCheckingLength() {
    test:assertFalse(IsbnVerifier.IsValid("3132P34035"));
}

@test:Config {
    enable: false
}
function invalidCharactersAreNotIgnoredBeforeCheckingLength() {
    test:assertFalse(IsbnVerifier.IsValid("3598P215088"));
}

@test:Config {
    enable: false
}
function inputIsTooLongButContainsAValidIsbn() {
    test:assertFalse(IsbnVerifier.IsValid("98245726788"));
}
