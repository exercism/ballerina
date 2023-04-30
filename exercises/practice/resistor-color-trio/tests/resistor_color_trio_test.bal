import ballerina/test;

@test:Config {
    enable: false
}
function orangeAndOrangeAndBlack() {
    test:assertEquals("33 ohms", ResistorColorTrio.Label([ "orange", "orange", "black" ]));
}

@test:Config {
    enable: false
}
function blueAndGreyAndBrown() {
    test:assertEquals("680 ohms", ResistorColorTrio.Label([ "blue", "grey", "brown" ]));
}

@test:Config {
    enable: false
}
function redAndBlackAndRed() {
    test:assertEquals("2 kiloohms", ResistorColorTrio.Label([ "red", "black", "red" ]));
}

@test:Config {
    enable: false
}
function greenAndBrownAndOrange() {
    test:assertEquals("51 kiloohms", ResistorColorTrio.Label([ "green", "brown", "orange" ]));
}

@test:Config {
    enable: false
}
function yellowAndVioletAndYellow() {
    test:assertEquals("470 kiloohms", ResistorColorTrio.Label([ "yellow", "violet", "yellow" ]));
}
