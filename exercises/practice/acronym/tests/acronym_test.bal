import ballerina/test;

@test:Config {}
function testBasic() {
    test:assertEquals(abbreviate("Portable Network Graphics"), "PNG");
}

@test:Config {}
function testLowercaseWords() {
    test:assertEquals(abbreviate("Ruby on Rails"), "ROR");
}

@test:Config {}
function testPunctuation() {
    test:assertEquals(abbreviate("First In, First Out"), "FIFO");
}

@test:Config {}
function testAllCapsWord() {
    test:assertEquals(abbreviate("GNU Image Manipulation Program"), "GIMP");
}

@test:Config {}
function testPunctuationWithoutWhitespace() {
    test:assertEquals(abbreviate("Complementary metal-oxide semiconductor"), "CMOS");
}

@test:Config {}
function testVeryLongAbbreviation() {
    test:assertEquals(abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"), "ROTFLSHTMDCOALM");
}

@test:Config {}
function testConsecutiveDelimiters() {
    test:assertEquals(abbreviate("Something - I made up from thin air"), "SIMUFTA");
}

@test:Config {}
function testApostrophes() {
    test:assertEquals(abbreviate("Halley's Comet"), "HC");
}

@test:Config {}
function testUnderscoreEmphasis() {
    test:assertEquals(abbreviate("The Road _Not_ Taken"), "TRNT");
}
