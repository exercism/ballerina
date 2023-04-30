import ballerina/test;

@test:Config {
    enable: false
}
function randomKeyCipherCanEncode() {
    var sut = new SimpleCipher();
    test:assertEquals(sut.Key.Substring(0, 10), sut.Encode("aaaaaaaaaa"));
}

@test:Config {
    enable: false
}
function randomKeyCipherCanDecode() {
    var sut = new SimpleCipher();
    test:assertEquals("aaaaaaaaaa", sut.Decode(sut.Key.Substring(0, 10)));
}

@test:Config {
    enable: false
}
function randomKeyCipherIsReversibleIEIfYouApplyDecodeInAEncodedResultYouMustSeeTheSamePlaintextEncodeParameterAsAResultOfTheDecodeMethod() {
    var sut = new SimpleCipher();
    test:assertEquals("abcdefghij", sut.Decode(sut.Encode("abcdefghij")));
}

@test:Config {
    enable: false
}
function randomKeyCipherKeyIsMadeOnlyOfLowercaseLetters() {
    var sut = new SimpleCipher();
    Assert.Matches("^[a-z]+$", sut.Key);
}

@test:Config {
    enable: false
}
function substitutionCipherCanEncode() {
    var sut = new SimpleCipher("abcdefghij");
    test:assertEquals("abcdefghij", sut.Encode("aaaaaaaaaa"));
}

@test:Config {
    enable: false
}
function substitutionCipherCanDecode() {
    var sut = new SimpleCipher("abcdefghij");
    test:assertEquals("aaaaaaaaaa", sut.Decode("abcdefghij"));
}

@test:Config {
    enable: false
}
function substitutionCipherIsReversibleIEIfYouApplyDecodeInAEncodedResultYouMustSeeTheSamePlaintextEncodeParameterAsAResultOfTheDecodeMethod() {
    var sut = new SimpleCipher("abcdefghij");
    test:assertEquals("abcdefghij", sut.Decode(sut.Encode("abcdefghij")));
}

@test:Config {
    enable: false
}
function substitutionCipherCanDoubleShiftEncode() {
    var sut = new SimpleCipher("iamapandabear");
    test:assertEquals("qayaeaagaciai", sut.Encode("iamapandabear"));
}

@test:Config {
    enable: false
}
function substitutionCipherCanWrapOnEncode() {
    var sut = new SimpleCipher("abcdefghij");
    test:assertEquals("zabcdefghi", sut.Encode("zzzzzzzzzz"));
}

@test:Config {
    enable: false
}
function substitutionCipherCanWrapOnDecode() {
    var sut = new SimpleCipher("abcdefghij");
    test:assertEquals("zzzzzzzzzz", sut.Decode("zabcdefghi"));
}

@test:Config {
    enable: false
}
function substitutionCipherCanEncodeMessagesLongerThanTheKey() {
    var sut = new SimpleCipher("abc");
    test:assertEquals("iboaqcnecbfcr", sut.Encode("iamapandabear"));
}

@test:Config {
    enable: false
}
function substitutionCipherCanDecodeMessagesLongerThanTheKey() {
    var sut = new SimpleCipher("abc");
    test:assertEquals("iamapandabear", sut.Decode("iboaqcnecbfcr"));
}
