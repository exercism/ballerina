import ballerina/test;

@test:Config {
    enable: false
}
function singleBitOneToDecimal() {
    var inputBase = 2;
    var digits = [ 1 ];
    var outputBase = 10;
    var expected = [ 1 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function binaryToSingleDecimal() {
    var inputBase = 2;
    var digits = [ 1, 0, 1 ];
    var outputBase = 10;
    var expected = [ 5 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function singleDecimalToBinary() {
    var inputBase = 10;
    var digits = [ 5 ];
    var outputBase = 2;
    var expected = [ 1, 0, 1 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function binaryToMultipleDecimal() {
    var inputBase = 2;
    var digits = [ 1, 0, 1, 0, 1, 0 ];
    var outputBase = 10;
    var expected = [ 4, 2 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function decimalToBinary() {
    var inputBase = 10;
    var digits = [ 4, 2 ];
    var outputBase = 2;
    var expected = [ 1, 0, 1, 0, 1, 0 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function trinaryToHexadecimal() {
    var inputBase = 3;
    var digits = [ 1, 1, 2, 0 ];
    var outputBase = 16;
    var expected = [ 2, 10 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function hexadecimalToTrinary() {
    var inputBase = 16;
    var digits = [ 2, 10 ];
    var outputBase = 3;
    var expected = [ 1, 1, 2, 0 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function number_15BitInteger() {
    var inputBase = 97;
    var digits = [ 3, 46, 60 ];
    var outputBase = 73;
    var expected = [ 6, 10, 45 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function emptyList() {
    var inputBase = 2;
    var digits = Array.Empty<int>();
    var outputBase = 10;
    var expected = [ 0 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function singleZero() {
    var inputBase = 10;
    var digits = [ 0 ];
    var outputBase = 2;
    var expected = [ 0 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function multipleZeros() {
    var inputBase = 10;
    var digits = [ 0, 0, 0 ];
    var outputBase = 2;
    var expected = [ 0 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function leadingZeros() {
    var inputBase = 7;
    var digits = [ 0, 6, 0 ];
    var outputBase = 10;
    var expected = [ 4, 2 ];
    test:assertEquals(expected, AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function inputBaseIsOne() {
    var inputBase = 1;
    var digits = [ 0 ];
    var outputBase = 10;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function inputBaseIsZero() {
    var inputBase = 0;
    var digits = Array.Empty<int>();
    var outputBase = 10;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function inputBaseIsNegative() {
    var inputBase = -2;
    var digits = [ 1 ];
    var outputBase = 10;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function negativeDigit() {
    var inputBase = 2;
    var digits = [ 1, -1, 1, 0, 1, 0 ];
    var outputBase = 10;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function invalidPositiveDigit() {
    var inputBase = 2;
    var digits = [ 1, 2, 1, 0, 1, 0 ];
    var outputBase = 10;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function outputBaseIsOne() {
    var inputBase = 2;
    var digits = [ 1, 0, 1, 0, 1, 0 ];
    var outputBase = 1;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function outputBaseIsZero() {
    var inputBase = 10;
    var digits = [ 7 ];
    var outputBase = 0;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function outputBaseIsNegative() {
    var inputBase = 2;
    var digits = [ 1 ];
    var outputBase = -7;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}

@test:Config {
    enable: false
}
function bothBasesAreNegative() {
    var inputBase = -2;
    var digits = [ 1 ];
    var outputBase = -7;
    Assert.Throws<ArgumentException>(() => AllYourBase.Rebase(inputBase, digits, outputBase));
}
