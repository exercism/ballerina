import ballerina/test;

@test:Config {}
function testLowercaseLetter() {
    test:assertEquals(score("a"), 1);
}

@test:Config {
    enable: false
}
function testUppercaseLetter() {
    test:assertEquals(score("A"), 1);
}

@test:Config {
    enable: false
}
function testValuableLetter() {
    test:assertEquals(score("f"), 4);
}

@test:Config {
    enable: false
}
function testShortWord() {
    test:assertEquals(score("at"), 2);
}

@test:Config {
    enable: false
}
function testShortValuableWord() {
    test:assertEquals(score("zoo"), 12);
}

@test:Config {
    enable: false
}
function testMediumWord() {
    test:assertEquals(score("street"), 6);
}

@test:Config {
    enable: false
}
function testMediumValuableWord() {
    test:assertEquals(score("quirky"), 22);
}

@test:Config {
    enable: false
}
function testLongMixedCaseWord() {
    test:assertEquals(score("OxyphenButazone"), 41);
}

@test:Config {
    enable: false
}
function testEnglishLikeWord() {
    test:assertEquals(score("pinata"), 8);
}

@test:Config {
    enable: false
}
function testEmptyInput() {
    test:assertEquals(score(""), 0);
}

@test:Config {
    enable: false
}
function testEntireAlphabetAvailable() {
    test:assertEquals(score("abcdefghijklmnopqrstuvwxyz"), 87);
}
