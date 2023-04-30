import ballerina/test;

@test:Config {
    enable: false
}
function emptyString() {
    var lines = "";
    var expected = "";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function twoCharactersInARow() {
    var lines = "A1";
    var expected = 
        "A\n" +
        "1";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function twoCharactersInAColumn() {
    var lines = 
        "A\n" +
        "1";
    var expected = "A1";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function simple() {
    var lines = 
        "ABC\n" +
        "123";
    var expected = 
        "A1\n" +
        "B2\n" +
        "C3";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function singleLine() {
    var lines = "Single line.";
    var expected = 
        "S\n" +
        "i\n" +
        "n\n" +
        "g\n" +
        "l\n" +
        "e\n" +
        " \n" +
        "l\n" +
        "i\n" +
        "n\n" +
        "e\n" +
        ".";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function firstLineLongerThanSecondLine() {
    var lines = 
        "The fourth line.\n" +
        "The fifth line.";
    var expected = 
        "TT\n" +
        "hh\n" +
        "ee\n" +
        "  \n" +
        "ff\n" +
        "oi\n" +
        "uf\n" +
        "rt\n" +
        "th\n" +
        "h \n" +
        " l\n" +
        "li\n" +
        "in\n" +
        "ne\n" +
        "e.\n" +
        ".";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function secondLineLongerThanFirstLine() {
    var lines = 
        "The first line.\n" +
        "The second line.";
    var expected = 
        "TT\n" +
        "hh\n" +
        "ee\n" +
        "  \n" +
        "fs\n" +
        "ie\n" +
        "rc\n" +
        "so\n" +
        "tn\n" +
        " d\n" +
        "l \n" +
        "il\n" +
        "ni\n" +
        "en\n" +
        ".e\n" +
        " .";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function mixedLineLength() {
    var lines = 
        "The longest line.\n" +
        "A long line.\n" +
        "A longer line.\n" +
        "A line.";
    var expected = 
        "TAAA\n" +
        "h   \n" +
        "elll\n" +
        " ooi\n" +
        "lnnn\n" +
        "ogge\n" +
        "n e.\n" +
        "glr\n" +
        "ei \n" +
        "snl\n" +
        "tei\n" +
        " .n\n" +
        "l e\n" +
        "i .\n" +
        "n\n" +
        "e\n" +
        ".";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function square() {
    var lines = 
        "HEART\n" +
        "EMBER\n" +
        "ABUSE\n" +
        "RESIN\n" +
        "TREND";
    var expected = 
        "HEART\n" +
        "EMBER\n" +
        "ABUSE\n" +
        "RESIN\n" +
        "TREND";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function rectangle() {
    var lines = 
        "FRACTURE\n" +
        "OUTLINED\n" +
        "BLOOMING\n" +
        "SEPTETTE";
    var expected = 
        "FOBS\n" +
        "RULE\n" +
        "ATOP\n" +
        "CLOT\n" +
        "TIME\n" +
        "UNIT\n" +
        "RENT\n" +
        "EDGE";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function triangle() {
    var lines = 
        "T\n" +
        "EE\n" +
        "AAA\n" +
        "SSSS\n" +
        "EEEEE\n" +
        "RRRRRR";
    var expected = 
        "TEASER\n" +
        " EASER\n" +
        "  ASER\n" +
        "   SER\n" +
        "    ER\n" +
        "     R";
    test:assertEquals(expected, Transpose.String(lines));
}

@test:Config {
    enable: false
}
function jaggedTriangle() {
    var lines = 
        "11\n" +
        "2\n" +
        "3333\n" +
        "444\n" +
        "555555\n" +
        "66666";
    var expected = 
        "123456\n" +
        "1 3456\n" +
        "  3456\n" +
        "  3 56\n" +
        "    56\n" +
        "    5";
    test:assertEquals(expected, Transpose.String(lines));
}
