import ballerina/test;

@test:Config {
    dataProvider: testCases
}
function testFunction(string phrase, string acronym) {
    test:assertEquals(abbreviate(phrase), acronym);
}

function testCases() returns map<[string, string]>|error {
    return {
        "basic": ["Portable Network Graphics", "PNG"],
        "lowercase words": ["Ruby on Rails", "ROR"],
        "punctuation": ["First In, First Out", "FIFO"],
        "all caps word": ["GNU Image Manipulation Program", "GIMP"],
        "punctuation without whitespace": ["Complementary metal-oxide semiconductor", "CMOS"],
        "very long abbreviation": ["Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me", "ROTFLSHTMDCOALM"],
        "consecutive delimiters": ["Something - I made up from thin air", "SIMUFTA"],
        "apostrophes": ["Halley's Comet", "HC"],
        "underscore emphasis": ["The Road _Not_ Taken", "TRNT"]
    };
}
