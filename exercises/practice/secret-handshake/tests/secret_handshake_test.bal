import ballerina/test;

@test:Config {
    enable: false
}
function winkFor_1() {
    test:assertEquals([ "wink" ], SecretHandshake.Commands(1));
}

@test:Config {
    enable: false
}
function doubleBlinkFor_10() {
    test:assertEquals([ "double blink" ], SecretHandshake.Commands(2));
}

@test:Config {
    enable: false
}
function closeYourEyesFor_100() {
    test:assertEquals([ "close your eyes" ], SecretHandshake.Commands(4));
}

@test:Config {
    enable: false
}
function jumpFor_1000() {
    test:assertEquals([ "jump" ], SecretHandshake.Commands(8));
}

@test:Config {
    enable: false
}
function combineTwoActions() {
    test:assertEquals([ "wink", "double blink" ], SecretHandshake.Commands(3));
}

@test:Config {
    enable: false
}
function reverseTwoActions() {
    test:assertEquals([ "double blink", "wink" ], SecretHandshake.Commands(19));
}

@test:Config {
    enable: false
}
function reversingOneActionGivesTheSameAction() {
    test:assertEquals([ "jump" ], SecretHandshake.Commands(24));
}

@test:Config {
    enable: false
}
function reversingNoActionsStillGivesNoActions() {
    Assert.Empty(SecretHandshake.Commands(16));
}

@test:Config {
    enable: false
}
function allPossibleActions() {
    test:assertEquals([ "wink", "double blink", "close your eyes", "jump" ], SecretHandshake.Commands(15));
}

@test:Config {
    enable: false
}
function reverseAllPossibleActions() {
    test:assertEquals([ "jump", "close your eyes", "double blink", "wink" ], SecretHandshake.Commands(31));
}

@test:Config {
    enable: false
}
function doNothingForZero() {
    Assert.Empty(SecretHandshake.Commands(0));
}
