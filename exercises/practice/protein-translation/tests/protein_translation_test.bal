import ballerina/test;

@test:Config {
    enable: false
}
function emptyRnaSequenceResultsInNoProteins() {
    Assert.Empty(ProteinTranslation.Proteins(""));
}

@test:Config {
    enable: false
}
function methionineRnaSequence() {
    test:assertEquals([ "Methionine" ], ProteinTranslation.Proteins("AUG"));
}

@test:Config {
    enable: false
}
function phenylalanineRnaSequence_1() {
    test:assertEquals([ "Phenylalanine" ], ProteinTranslation.Proteins("UUU"));
}

@test:Config {
    enable: false
}
function phenylalanineRnaSequence_2() {
    test:assertEquals([ "Phenylalanine" ], ProteinTranslation.Proteins("UUC"));
}

@test:Config {
    enable: false
}
function leucineRnaSequence_1() {
    test:assertEquals([ "Leucine" ], ProteinTranslation.Proteins("UUA"));
}

@test:Config {
    enable: false
}
function leucineRnaSequence_2() {
    test:assertEquals([ "Leucine" ], ProteinTranslation.Proteins("UUG"));
}

@test:Config {
    enable: false
}
function serineRnaSequence_1() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCU"));
}

@test:Config {
    enable: false
}
function serineRnaSequence_2() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCC"));
}

@test:Config {
    enable: false
}
function serineRnaSequence_3() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCA"));
}

@test:Config {
    enable: false
}
function serineRnaSequence_4() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCG"));
}

@test:Config {
    enable: false
}
function tyrosineRnaSequence_1() {
    test:assertEquals([ "Tyrosine" ], ProteinTranslation.Proteins("UAU"));
}

@test:Config {
    enable: false
}
function tyrosineRnaSequence_2() {
    test:assertEquals([ "Tyrosine" ], ProteinTranslation.Proteins("UAC"));
}

@test:Config {
    enable: false
}
function cysteineRnaSequence_1() {
    test:assertEquals([ "Cysteine" ], ProteinTranslation.Proteins("UGU"));
}

@test:Config {
    enable: false
}
function cysteineRnaSequence_2() {
    test:assertEquals([ "Cysteine" ], ProteinTranslation.Proteins("UGC"));
}

@test:Config {
    enable: false
}
function tryptophanRnaSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGG"));
}

@test:Config {
    enable: false
}
function stopCodonRnaSequence_1() {
    Assert.Empty(ProteinTranslation.Proteins("UAA"));
}

@test:Config {
    enable: false
}
function stopCodonRnaSequence_2() {
    Assert.Empty(ProteinTranslation.Proteins("UAG"));
}

@test:Config {
    enable: false
}
function stopCodonRnaSequence_3() {
    Assert.Empty(ProteinTranslation.Proteins("UGA"));
}

@test:Config {
    enable: false
}
function sequenceOfTwoProteinCodonsTranslatesIntoProteins() {
    test:assertEquals([ "Phenylalanine", "Phenylalanine" ], ProteinTranslation.Proteins("UUUUUU"));
}

@test:Config {
    enable: false
}
function sequenceOfTwoDifferentProteinCodonsTranslatesIntoProteins() {
    test:assertEquals([ "Leucine", "Leucine" ], ProteinTranslation.Proteins("UUAUUG"));
}

@test:Config {
    enable: false
}
function translateRnaStrandIntoCorrectProteinList() {
    test:assertEquals([ "Methionine", "Phenylalanine", "Tryptophan" ], ProteinTranslation.Proteins("AUGUUUUGG"));
}

@test:Config {
    enable: false
}
function translationStopsIfStopCodonAtBeginningOfSequence() {
    Assert.Empty(ProteinTranslation.Proteins("UAGUGG"));
}

@test:Config {
    enable: false
}
function translationStopsIfStopCodonAtEndOfTwoCodonSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGGUAG"));
}

@test:Config {
    enable: false
}
function translationStopsIfStopCodonAtEndOfThreeCodonSequence() {
    test:assertEquals([ "Methionine", "Phenylalanine" ], ProteinTranslation.Proteins("AUGUUUUAA"));
}

@test:Config {
    enable: false
}
function translationStopsIfStopCodonInMiddleOfThreeCodonSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGGUAGUGG"));
}

@test:Config {
    enable: false
}
function translationStopsIfStopCodonInMiddleOfSixCodonSequence() {
    test:assertEquals([ "Tryptophan", "Cysteine", "Tyrosine" ], ProteinTranslation.Proteins("UGGUGUUAUUAAUGGUUU"));
}
