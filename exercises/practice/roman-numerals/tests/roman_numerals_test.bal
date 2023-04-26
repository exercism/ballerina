import ballerina/test;

@test:Config {
    dataProvider: testCases
}
function testFunction(int input, string output) {
    test:assertEquals(roman(input), output);
}

function testCases() returns map<[int, string]>|error {
    return {
        "1 is I": [1, "I"],
        "2 is II": [2, "II"],
        "3 is III": [3, "III"],
        "4 is IV": [4, "IV"],
        "5 is V": [5, "V"],
        "6 is VI": [6, "VI"],
        "9 is IX": [9, "IX"],
        "16 is XVI": [16, "XVI"],
        "27 is XXVII": [27, "XXVII"],
        "48 is XLVIII": [48, "XLVIII"],
        "49 is XLIX": [49, "XLIX"],
        "59 is LIX": [59, "LIX"],
        "66 is LXVI": [66, "LXVI"],
        "93 is XCIII": [93, "XCIII"],
        "141 is CXLI": [141, "CXLI"],
        "163 is CLXIII": [163, "CLXIII"],
        "166 is CLXVI": [166, "CLXVI"],
        "402 is CDII": [402, "CDII"],
        "575 is DLXXV": [575, "DLXXV"],
        "666 is DCLXVI": [666, "DCLXVI"],
        "911 is CMXI": [911, "CMXI"],
        "1024 is MXXIV": [1024, "MXXIV"],
        "1666 is MDCLXVI": [1666, "MDCLXVI"],
        "3000 is MMM": [3000, "MMM"],
        "3001 is MMMI": [3001, "MMMI"],
        "3999 is MMMCMXCIX": [3999, "MMMCMXCIX"]
    };
}
