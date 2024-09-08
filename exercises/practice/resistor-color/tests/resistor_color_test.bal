import ballerina/test;

@test:Config {}
function testBlack() {
    test:assertEquals(0, colorCode("black"));
}

@test:Config {
    enable: false
}
function testWhite() {
    test:assertEquals(9, colorCode("white"));
}

@test:Config {
    enable: false
}
function testOrange() {
    test:assertEquals(3, colorCode("orange"));
}

@test:Config {
    enable: false
}
function testColors() {
    string[] expected = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white"
    ];
    test:assertEquals(expected, colors());
}
