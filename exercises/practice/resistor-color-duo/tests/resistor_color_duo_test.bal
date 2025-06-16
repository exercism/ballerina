import ballerina/test;

@test:Config {}
function testBrownAndBlack() {
    test:assertEquals(10, value(["brown", "black"]));
}

@test:Config {
    enable: false
}
function testBlueAndGrey() {
    test:assertEquals(68, value(["blue", "grey"]));
}

@test:Config {
    enable: false
}
function testYellowAndViolet() {
    test:assertEquals(47, value(["yellow", "violet"]));
}

@test:Config {
    enable: false
}
function testWhiteAndRed() {
    test:assertEquals(92, value(["white", "red"]));
}

@test:Config {
    enable: false
}
function testOrangeAndOrange() {
    test:assertEquals(33, value(["orange", "orange"]));
}

@test:Config {
    enable: false
}
function testIgnoreAdditionalColors() {
    test:assertEquals(51, value(["green", "brown", "orange"]));
}

@test:Config {
    enable: false
}
function testBlackAndBrownOneDigit() {
    test:assertEquals(1, value(["black", "brown"]));
}
