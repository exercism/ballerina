import ballerina/test;

@test:Config {
    enable: false
}
function rotateABy_0SameOutputAsInput() {
    test:assertEquals("a", RotationalCipher.Rotate("a", 0));
}

@test:Config {
    enable: false
}
function rotateABy_1() {
    test:assertEquals("b", RotationalCipher.Rotate("a", 1));
}

@test:Config {
    enable: false
}
function rotateABy_26SameOutputAsInput() {
    test:assertEquals("a", RotationalCipher.Rotate("a", 26));
}

@test:Config {
    enable: false
}
function rotateMBy_13() {
    test:assertEquals("z", RotationalCipher.Rotate("m", 13));
}

@test:Config {
    enable: false
}
function rotateNBy_13WithWrapAroundAlphabet() {
    test:assertEquals("a", RotationalCipher.Rotate("n", 13));
}

@test:Config {
    enable: false
}
function rotateCapitalLetters() {
    test:assertEquals("TRL", RotationalCipher.Rotate("OMG", 5));
}

@test:Config {
    enable: false
}
function rotateSpaces() {
    test:assertEquals("T R L", RotationalCipher.Rotate("O M G", 5));
}

@test:Config {
    enable: false
}
function rotateNumbers() {
    test:assertEquals("Xiwxmrk 1 2 3 xiwxmrk", RotationalCipher.Rotate("Testing 1 2 3 testing", 4));
}

@test:Config {
    enable: false
}
function rotatePunctuation() {
    test:assertEquals("Gzo'n zvo, Bmviyhv!", RotationalCipher.Rotate("Let's eat, Grandma!", 21));
}

@test:Config {
    enable: false
}
function rotateAllLetters() {
    test:assertEquals("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.", RotationalCipher.Rotate("The quick brown fox jumps over the lazy dog.", 13));
}
