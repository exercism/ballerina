import ballerina/test;

@test:Config {
    enable: false
}
function black() {
    test:assertEquals(0, ResistorColor.ColorCode("black"));
}

@test:Config {
    enable: false
}
function white() {
    test:assertEquals(9, ResistorColor.ColorCode("white"));
}

@test:Config {
    enable: false
}
function orange() {
    test:assertEquals(3, ResistorColor.ColorCode("orange"));
}

@test:Config {
    enable: false
}
function colors() {
    test:assertEquals([ "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" ], ResistorColor.Colors());
}
