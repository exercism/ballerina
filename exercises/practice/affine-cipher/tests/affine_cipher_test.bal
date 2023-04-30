import ballerina/test;

@test:Config {
    enable: false
}
function encodeYes() {
    test:assertEquals("xbt", AffineCipher.Encode("yes", 5, 7));
}

@test:Config {
    enable: false
}
function encodeNo() {
    test:assertEquals("fu", AffineCipher.Encode("no", 15, 18));
}

@test:Config {
    enable: false
}
function encodeOmg() {
    test:assertEquals("lvz", AffineCipher.Encode("OMG", 21, 3));
}

@test:Config {
    enable: false
}
function encodeOMG() {
    test:assertEquals("hjp", AffineCipher.Encode("O M G", 25, 47));
}

@test:Config {
    enable: false
}
function encodeMindblowingly() {
    test:assertEquals("rzcwa gnxzc dgt", AffineCipher.Encode("mindblowingly", 11, 15));
}

@test:Config {
    enable: false
}
function encodeNumbers() {
    test:assertEquals("jqgjc rw123 jqgjc rw", AffineCipher.Encode("Testing,1 2 3, testing.", 3, 4));
}

@test:Config {
    enable: false
}
function encodeDeepThought() {
    test:assertEquals("iynia fdqfb ifje", AffineCipher.Encode("Truth is fiction.", 5, 17));
}

@test:Config {
    enable: false
}
function encodeAllTheLetters() {
    test:assertEquals("swxtj npvyk lruol iejdc blaxk swxmh qzglf", AffineCipher.Encode("The quick brown fox jumps over the lazy dog.", 17, 33));
}

@test:Config {
    enable: false
}
function encodeWithANotCoprimeToM() {
    Assert.Throws<ArgumentException>(() => AffineCipher.Encode("This is a test.", 6, 17));
}

@test:Config {
    enable: false
}
function decodeExercism() {
    test:assertEquals("exercism", AffineCipher.Decode("tytgn fjr", 3, 7));
}

@test:Config {
    enable: false
}
function decodeASentence() {
    test:assertEquals("anobstacleisoftenasteppingstone", AffineCipher.Decode("qdwju nqcro muwhn odqun oppmd aunwd o", 19, 16));
}

@test:Config {
    enable: false
}
function decodeNumbers() {
    test:assertEquals("testing123testing", AffineCipher.Decode("odpoz ub123 odpoz ub", 25, 7));
}

@test:Config {
    enable: false
}
function decodeAllTheLetters() {
    test:assertEquals("thequickbrownfoxjumpsoverthelazydog", AffineCipher.Decode("swxtj npvyk lruol iejdc blaxk swxmh qzglf", 17, 33));
}

@test:Config {
    enable: false
}
function decodeWithNoSpacesInInput() {
    test:assertEquals("thequickbrownfoxjumpsoverthelazydog", AffineCipher.Decode("swxtjnpvyklruoliejdcblaxkswxmhqzglf", 17, 33));
}

@test:Config {
    enable: false
}
function decodeWithTooManySpaces() {
    test:assertEquals("jollygreengiant", AffineCipher.Decode("vszzm    cly   yd cg    qdp", 15, 16));
}

@test:Config {
    enable: false
}
function decodeWithANotCoprimeToM() {
    Assert.Throws<ArgumentException>(() => AffineCipher.Decode("Test", 13, 5));
}
