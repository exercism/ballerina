import ballerina/test;

@test:Config
function encodes_yes() {
    string phrase = "yes";
    string expected = "bvh";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_no() {
    string phrase = "no";
    string expected = "ml";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_OMG() {
    string phrase = "OMG";
    string expected = "lnt";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_spaces() {
    string phrase = "O M G";
    string expected = "lnt";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_mindblowingly() {
    string phrase = "mindblowingly";
    string expected = "nrmwy oldrm tob";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_numbers() {
    string phrase = "Testing, 1 2 3, testing.";
    string expected = "gvhgr mt123 gvhgr mt";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}

function encodes_deep_thought() {
    string phrase = "Truth is fiction.";
    string expected = "gifgs rhurx grlm";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function encodes_all_the_letters() {
    string phrase = "The quick brown fox jumps over the lazy dog.";
    string expected = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt";
    test:assertEquals(encode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_exercism() {
    string phrase = "vcvix rhn";
    string expected = "exercism";
    test:assertEquals(decode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_a_sentence() {
    string phrase = "zmlyh gzxov rhlug vmzhg vkkrm thglm v";
    string expected = "anobstacleisoftenasteppingstone";
    test:assertEquals(decode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_numbers() {
    string phrase = "gvhgr mt123 gvhgr mt";
    string expected = "testing123testing";
    test:assertEquals(decode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_all_the_letters() {
    string phrase = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt";
    string expected = "thequickbrownfoxjumpsoverthelazydog";
    test:assertEquals(decode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_with_too_many_spaces() {
    string phrase = "vc vix    r hn";
    string expected = "exercism";
    test:assertEquals(decode(phrase), expected);
}

@test:Config {
    enable: false
}
function decodes_with_no_spaces() {
    string phrase = "zmlyhgzxovrhlugvmzhgvkkrmthglmv";
    string expected = "anobstacleisoftenasteppingstone";
    test:assertEquals(decode(phrase), expected);
}
