import ballerina/test;

@test:Config {
    enable: false
}
function encodeYes() {
    test:assertEquals("bvh", AtbashCipher.Encode("yes"));
}

@test:Config {
    enable: false
}
function encodeNo() {
    test:assertEquals("ml", AtbashCipher.Encode("no"));
}

@test:Config {
    enable: false
}
function encodeOmg() {
    test:assertEquals("lnt", AtbashCipher.Encode("OMG"));
}

@test:Config {
    enable: false
}
function encodeSpaces() {
    test:assertEquals("lnt", AtbashCipher.Encode("O M G"));
}

@test:Config {
    enable: false
}
function encodeMindblowingly() {
    test:assertEquals("nrmwy oldrm tob", AtbashCipher.Encode("mindblowingly"));
}

@test:Config {
    enable: false
}
function encodeNumbers() {
    test:assertEquals("gvhgr mt123 gvhgr mt", AtbashCipher.Encode("Testing,1 2 3, testing."));
}

@test:Config {
    enable: false
}
function encodeDeepThought() {
    test:assertEquals("gifgs rhurx grlm", AtbashCipher.Encode("Truth is fiction."));
}

@test:Config {
    enable: false
}
function encodeAllTheLetters() {
    test:assertEquals("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", AtbashCipher.Encode("The quick brown fox jumps over the lazy dog."));
}

@test:Config {
    enable: false
}
function decodeExercism() {
    test:assertEquals("exercism", AtbashCipher.Decode("vcvix rhn"));
}

@test:Config {
    enable: false
}
function decodeASentence() {
    test:assertEquals("anobstacleisoftenasteppingstone", AtbashCipher.Decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"));
}

@test:Config {
    enable: false
}
function decodeNumbers() {
    test:assertEquals("testing123testing", AtbashCipher.Decode("gvhgr mt123 gvhgr mt"));
}

@test:Config {
    enable: false
}
function decodeAllTheLetters() {
    test:assertEquals("thequickbrownfoxjumpsoverthelazydog", AtbashCipher.Decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"));
}

@test:Config {
    enable: false
}
function decodeWithTooManySpaces() {
    test:assertEquals("exercism", AtbashCipher.Decode("vc vix    r hn"));
}

@test:Config {
    enable: false
}
function decodeWithNoSpaces() {
    test:assertEquals("anobstacleisoftenasteppingstone", AtbashCipher.Decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"));
}
