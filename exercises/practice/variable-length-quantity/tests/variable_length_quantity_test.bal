import ballerina/test;

@test:Config {
    enable: false
}
function zero() {
    var integers = [ 0x0u ];
    var expected = [ 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function arbitrarySingleByte() {
    var integers = [ 0x40u ];
    var expected = [ 0x40u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function largestSingleByte() {
    var integers = [ 0x7Fu ];
    var expected = [ 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function smallestDoubleByte() {
    var integers = [ 0x80u ];
    var expected = [ 0x81u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function arbitraryDoubleByte() {
    var integers = [ 0x2000u ];
    var expected = [ 0xC0u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function largestDoubleByte() {
    var integers = [ 0x3FFFu ];
    var expected = [ 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function smallestTripleByte() {
    var integers = [ 0x4000u ];
    var expected = [ 0x81u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function arbitraryTripleByte() {
    var integers = [ 0x100000u ];
    var expected = [ 0xC0u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function largestTripleByte() {
    var integers = [ 0x1FFFFFu ];
    var expected = [ 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function smallestQuadrupleByte() {
    var integers = [ 0x200000u ];
    var expected = [ 0x81u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function arbitraryQuadrupleByte() {
    var integers = [ 0x8000000u ];
    var expected = [ 0xC0u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function largestQuadrupleByte() {
    var integers = [ 0xFFFFFFFu ];
    var expected = [ 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function smallestQuintupleByte() {
    var integers = [ 0x10000000u ];
    var expected = [ 0x81u, 0x80u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function arbitraryQuintupleByte() {
    var integers = [ 0xFF000000u ];
    var expected = [ 0x8Fu, 0xF8u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function maximum_32BitIntegerInput() {
    var integers = [ 0xFFFFFFFFu ];
    var expected = [ 0x8Fu, 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function twoSingleByteValues() {
    var integers = [ 0x40u, 0x7Fu ];
    var expected = [ 0x40u, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function twoMultiByteValues() {
    var integers = [ 0x4000u, 0x123456u ];
    var expected = [ 0x81u, 0x80u, 0x0u, 0xC8u, 0xE8u, 0x56u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function manyMultiByteValues() {
    var integers = [ 0x2000u, 0x123456u, 0xFFFFFFFu, 0x0u, 0x3FFFu, 0x4000u ];
    var expected = [ 0xC0u, 0x0u, 0xC8u, 0xE8u, 0x56u, 0xFFu, 0xFFu, 0xFFu, 0x7Fu, 0x0u, 0xFFu, 0x7Fu, 0x81u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config {
    enable: false
}
function oneByte() {
    var integers = [ 0x7Fu ];
    var expected = [ 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function twoBytes() {
    var integers = [ 0xC0u, 0x0u ];
    var expected = [ 0x2000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function threeBytes() {
    var integers = [ 0xFFu, 0xFFu, 0x7Fu ];
    var expected = [ 0x1FFFFFu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function fourBytes() {
    var integers = [ 0x81u, 0x80u, 0x80u, 0x0u ];
    var expected = [ 0x200000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function maximum_32BitInteger() {
    var integers = [ 0x8Fu, 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    var expected = [ 0xFFFFFFFFu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function incompleteSequenceCausesError() {
    var integers = [ 0xFFu ];
    Assert.Throws<InvalidOperationException>(() => VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function incompleteSequenceCausesErrorEvenIfValueIsZero() {
    var integers = [ 0x80u ];
    Assert.Throws<InvalidOperationException>(() => VariableLengthQuantity.Decode(integers));
}

@test:Config {
    enable: false
}
function multipleValues() {
    var integers = [ 0xC0u, 0x0u, 0xC8u, 0xE8u, 0x56u, 0xFFu, 0xFFu, 0xFFu, 0x7Fu, 0x0u, 0xFFu, 0x7Fu, 0x81u, 0x80u, 0x0u ];
    var expected = [ 0x2000u, 0x123456u, 0xFFFFFFFu, 0x0u, 0x3FFFu, 0x4000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}
