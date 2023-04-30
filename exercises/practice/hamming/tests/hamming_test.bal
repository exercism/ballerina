import ballerina/test;

@test:Config {
    enable: false
}
function emptyStrands() {
    test:assertEquals(0, Hamming.Distance("", ""));
}

@test:Config {
    enable: false
}
function singleLetterIdenticalStrands() {
    test:assertEquals(0, Hamming.Distance("A", "A"));
}

@test:Config {
    enable: false
}
function singleLetterDifferentStrands() {
    test:assertEquals(1, Hamming.Distance("G", "T"));
}

@test:Config {
    enable: false
}
function longIdenticalStrands() {
    test:assertEquals(0, Hamming.Distance("GGACTGAAATCTG", "GGACTGAAATCTG"));
}

@test:Config {
    enable: false
}
function longDifferentStrands() {
    test:assertEquals(9, Hamming.Distance("GGACGGATTCTG", "AGGACGGATTCT"));
}

@test:Config {
    enable: false
}
function disallowFirstStrandLonger() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("AATG", "AAA"));
}

@test:Config {
    enable: false
}
function disallowSecondStrandLonger() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("ATA", "AGTG"));
}

@test:Config {
    enable: false
}
function disallowEmptyFirstStrand() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("", "G"));
}

@test:Config {
    enable: false
}
function disallowEmptySecondStrand() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("G", ""));
}
