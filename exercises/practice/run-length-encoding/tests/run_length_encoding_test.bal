import ballerina/test;

@test:Config {
    enable: false
}
function runLengthEncodeAStringEmptyString() {
    test:assertEquals("", RunLengthEncoding.Encode(""));
}

@test:Config {
    enable: false
}
function runLengthEncodeAStringSingleCharactersOnlyAreEncodedWithoutCount() {
    test:assertEquals("XYZ", RunLengthEncoding.Encode("XYZ"));
}

@test:Config {
    enable: false
}
function runLengthEncodeAStringStringWithNoSingleCharacters() {
    test:assertEquals("2A3B4C", RunLengthEncoding.Encode("AABBBCCCC"));
}

@test:Config {
    enable: false
}
function runLengthEncodeAStringSingleCharactersMixedWithRepeatedCharacters() {
    test:assertEquals("12WB12W3B24WB", RunLengthEncoding.Encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"));
}

@test:Config {
    enable: false
}
function runLengthEncodeAStringMultipleWhitespaceMixedInString() {
    test:assertEquals("2 hs2q q2w2 ", RunLengthEncoding.Encode("  hsqq qww  "));
}

@test:Config {
    enable: false
}
function runLengthEncodeAStringLowercaseCharacters() {
    test:assertEquals("2a3b4c", RunLengthEncoding.Encode("aabbbcccc"));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringEmptyString() {
    test:assertEquals("", RunLengthEncoding.Decode(""));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringSingleCharactersOnly() {
    test:assertEquals("XYZ", RunLengthEncoding.Decode("XYZ"));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringStringWithNoSingleCharacters() {
    test:assertEquals("AABBBCCCC", RunLengthEncoding.Decode("2A3B4C"));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringSingleCharactersWithRepeatedCharacters() {
    test:assertEquals("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB", RunLengthEncoding.Decode("12WB12W3B24WB"));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringMultipleWhitespaceMixedInString() {
    test:assertEquals("  hsqq qww  ", RunLengthEncoding.Decode("2 hs2q q2w2 "));
}

@test:Config {
    enable: false
}
function runLengthDecodeAStringLowercaseString() {
    test:assertEquals("aabbbcccc", RunLengthEncoding.Decode("2a3b4c"));
}

@test:Config {
    enable: false
}
function encodeAndThenDecodeEncodeFollowedByDecodeGivesOriginalString() {
    test:assertEquals("zzz ZZ  zZ", RunLengthEncoding.Decode(RunLengthEncoding.Encode("zzz ZZ  zZ")));
}
