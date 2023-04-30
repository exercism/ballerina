import ballerina/test;

@test:Config {
    enable: false
}
function lowercaseLetter() {
    test:assertEquals(1, ScrabbleScore.Score("a"));
}

@test:Config {
    enable: false
}
function uppercaseLetter() {
    test:assertEquals(1, ScrabbleScore.Score("A"));
}

@test:Config {
    enable: false
}
function valuableLetter() {
    test:assertEquals(4, ScrabbleScore.Score("f"));
}

@test:Config {
    enable: false
}
function shortWord() {
    test:assertEquals(2, ScrabbleScore.Score("at"));
}

@test:Config {
    enable: false
}
function shortValuableWord() {
    test:assertEquals(12, ScrabbleScore.Score("zoo"));
}

@test:Config {
    enable: false
}
function mediumWord() {
    test:assertEquals(6, ScrabbleScore.Score("street"));
}

@test:Config {
    enable: false
}
function mediumValuableWord() {
    test:assertEquals(22, ScrabbleScore.Score("quirky"));
}

@test:Config {
    enable: false
}
function longMixedCaseWord() {
    test:assertEquals(41, ScrabbleScore.Score("OxyphenButazone"));
}

@test:Config {
    enable: false
}
function englishLikeWord() {
    test:assertEquals(8, ScrabbleScore.Score("pinata"));
}

@test:Config {
    enable: false
}
function emptyInput() {
    test:assertEquals(0, ScrabbleScore.Score(""));
}

@test:Config {
    enable: false
}
function entireAlphabetAvailable() {
    test:assertEquals(87, ScrabbleScore.Score("abcdefghijklmnopqrstuvwxyz"));
}
