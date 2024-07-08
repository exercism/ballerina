import ballerina/test;

@test:Config
function testPairedSquareBrackets() {
    string value = "[]";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testEmptyString() {
    string value = "";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testUnpairedBrackets() {
    string value = "[[";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testWrongOrderedBrackets() {
    string value = "}{";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testWrongClosingBracket() {
    string value = "{]";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testPairedWithWhitespace() {
    string value = "{ }";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testPartiallyPairedBrackets() {
    string value = "{[])";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testSimpleNestedBrackets() {
    string value = "{[]}";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testSeveralPairedBrackets() {
    string value = "{}[]";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testPairedAndNestedBrackets() {
    string value = "([{}({}[])])";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testUnopenedClosingBrackets() {
    string value = "{[)][]}";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testUnpairedAndNestedBrackets() {
    string value = "([{])";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testPairedAndWrongNestedBrackets() {
    string value = "[({]})";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testPairedAndWrongNestedBracketsButInnermostAreCorrect() {
    string value = "[({}])";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testPairedAndIncompleteBrackets() {
    string value = "{}[";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testTooManyClosingBrackets() {
    string value = "[]]";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testEarlyUnexpectedBrackets() {
    string value = ")()";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testEarlyMismatchedBrackets() {
    string value = "{)()";
    test:assertFalse(isPaired(value));
}

@test:Config {
    enable: false
}
function testMathExpression() {
    string value = "(((185 + 223.85) * 15) - 543)/2";
    test:assertTrue(isPaired(value));
}

@test:Config {
    enable: false
}
function testComplexLatexExpression() {
    string value = "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)";
    test:assertTrue(isPaired(value));
}
