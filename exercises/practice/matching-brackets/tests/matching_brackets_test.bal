import ballerina/test;

@test:Config {
    enable: false
}
function pairedSquareBrackets() {
    var value = "[]";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function emptyString() {
    var value = "";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function unpairedBrackets() {
    var value = "[[";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function wrongOrderedBrackets() {
    var value = "}{";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function wrongClosingBracket() {
    var value = "{]";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function pairedWithWhitespace() {
    var value = "{ }";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function partiallyPairedBrackets() {
    var value = "{[])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function simpleNestedBrackets() {
    var value = "{[]}";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function severalPairedBrackets() {
    var value = "{}[]";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function pairedAndNestedBrackets() {
    var value = "([{}({}[])])";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function unopenedClosingBrackets() {
    var value = "{[)][]}";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function unpairedAndNestedBrackets() {
    var value = "([{])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function pairedAndWrongNestedBrackets() {
    var value = "[({]})";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function pairedAndWrongNestedBracketsButInnermostAreCorrect() {
    var value = "[({}])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function pairedAndIncompleteBrackets() {
    var value = "{}[";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function tooManyClosingBrackets() {
    var value = "[]]";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function earlyUnexpectedBrackets() {
    var value = ")()";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function earlyMismatchedBrackets() {
    var value = "{)()";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function mathExpression() {
    var value = "(((185 + 223.85) * 15) - 543)/2";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config {
    enable: false
}
function complexLatexExpression() {
    var value = "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}
