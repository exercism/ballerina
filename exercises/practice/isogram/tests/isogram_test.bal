import ballerina/test;

@test:Config {
    enable: false
}
function emptyString() {
    test:assertTrue(isIsogram(""));
}

@test:Config {
    enable: false
}
function isogramWithOnlyLowerCaseCharacters() {
    test:assertTrue(isIsogram("isogram"));
}

@test:Config {
    enable: false
}
function wordWithOneDuplicatedCharacter() {
    test:assertFalse(isIsogram("eleven"));
}

@test:Config {
    enable: false
}
function wordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() {
    test:assertFalse(isIsogram("zzyzx"));
}

@test:Config {
    enable: false
}
function longestReportedEnglishIsogram() {
    test:assertTrue(isIsogram("subdermatoglyphic"));
}

@test:Config {
    enable: false
}
function wordWithDuplicatedCharacterInMixedCase() {
    test:assertFalse(isIsogram("Alphabet"));
}

@test:Config {
    enable: false
}
function wordWithDuplicatedCharacterInMixedCaseLowercaseFirst() {
    test:assertFalse(isIsogram("alphAbet"));
}

@test:Config {
    enable: false
}
function hypotheticalIsogrammicWordWithHyphen() {
    test:assertTrue(isIsogram("thumbscrew-japingly"));
}

@test:Config {
    enable: false
}
function hypotheticalWordWithDuplicatedCharacterFollowingHyphen() {
    test:assertFalse(isIsogram("thumbscrew-jappingly"));
}

@test:Config {
    enable: false
}
function isogramWithDuplicatedHyphen() {
    test:assertTrue(isIsogram("six-year-old"));
}

@test:Config {
    enable: false
}
function madeUpNameThatIsAnIsogram() {
    test:assertTrue(isIsogram("Emily Jung Schwartzkopf"));
}

@test:Config {
    enable: false
}
function duplicatedCharacterInTheMiddle() {
    test:assertFalse(isIsogram("accentor"));
}

@test:Config {
    enable: false
}
function sameFirstAndLastCharacters() {
    test:assertFalse(isIsogram("angola"));
}

@test:Config {
    enable: false
}
function wordWithDuplicatedCharacterAndWithTwoHyphens() {
    test:assertFalse(isIsogram("up-to-date"));
}
