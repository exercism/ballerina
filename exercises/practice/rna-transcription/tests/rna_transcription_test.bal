import ballerina/test;

@test:Config {
    enable: false
}
function emptyRnaSequence() {
    test:assertEquals("", RnaTranscription.ToRna(""));
}

@test:Config {
    enable: false
}
function rnaComplementOfCytosineIsGuanine() {
    test:assertEquals("G", RnaTranscription.ToRna("C"));
}

@test:Config {
    enable: false
}
function rnaComplementOfGuanineIsCytosine() {
    test:assertEquals("C", RnaTranscription.ToRna("G"));
}

@test:Config {
    enable: false
}
function rnaComplementOfThymineIsAdenine() {
    test:assertEquals("A", RnaTranscription.ToRna("T"));
}

@test:Config {
    enable: false
}
function rnaComplementOfAdenineIsUracil() {
    test:assertEquals("U", RnaTranscription.ToRna("A"));
}

@test:Config {
    enable: false
}
function rnaComplement() {
    test:assertEquals("UGCACCAGAAUU", RnaTranscription.ToRna("ACGTGGTCTTAA"));
}
