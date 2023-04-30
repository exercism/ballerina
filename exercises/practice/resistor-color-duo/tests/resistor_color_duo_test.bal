import ballerina/test;

@test:Config {
    enable: false
}
function brownAndBlack() {
    test:assertEquals(10, ResistorColorDuo.Value([ "brown", "black" ]));
}

@test:Config {
    enable: false
}
function blueAndGrey() {
    test:assertEquals(68, ResistorColorDuo.Value([ "blue", "grey" ]));
}

@test:Config {
    enable: false
}
function yellowAndViolet() {
    test:assertEquals(47, ResistorColorDuo.Value([ "yellow", "violet" ]));
}

@test:Config {
    enable: false
}
function whiteAndRed() {
    test:assertEquals(92, ResistorColorDuo.Value([ "white", "red" ]));
}

@test:Config {
    enable: false
}
function orangeAndOrange() {
    test:assertEquals(33, ResistorColorDuo.Value([ "orange", "orange" ]));
}

@test:Config {
    enable: false
}
function ignoreAdditionalColors() {
    test:assertEquals(51, ResistorColorDuo.Value([ "green", "brown", "orange" ]));
}

@test:Config {
    enable: false
}
function blackAndBrownOneDigit() {
    test:assertEquals(1, ResistorColorDuo.Value([ "black", "brown" ]));
}
