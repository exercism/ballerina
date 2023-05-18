import ballerina/test;

@test:Config
function emptyStrands() {
    test:assertEquals(distance("", ""), 0);
}

@test:Config {
    enable: false
}
function singleLetterIdenticalStrands() {
    test:assertEquals(distance("A", "A"), 0);
}

@test:Config {
    enable: false
}
function singleLetterDifferentStrands() {
    test:assertEquals(distance("G", "T"), 1);
}

@test:Config {
    enable: false
}
function longIdenticalStrands() {
    test:assertEquals(distance("GGACTGAAATCTG", "GGACTGAAATCTG"), 0);
}

@test:Config {
    enable: false
}
function longDifferentStrands() {
    test:assertEquals(distance("GGACGGATTCTG", "AGGACGGATTCT"), 9);
}

@test:Config {
    enable: false
}
function disallowFirstStrandLonger() {
    int|error result = distance("AATG", "AAA");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function disallowSecondStrandLonger() {
    int|error result = distance("ATA", "AGTG");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function disallowEmptyFirstStrand() {
    int|error result = distance("", "G");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function disallowEmptySecondStrand() {
    int|error result = distance("G", "");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}
