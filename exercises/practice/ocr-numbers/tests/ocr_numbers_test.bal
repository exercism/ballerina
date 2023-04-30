import ballerina/test;

@test:Config {
    enable: false
}
function recognizes_0() {
    var rows = 
        " _ \n" +
        "| |\n" +
        "|_|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("0", actual);
}

@test:Config {
    enable: false
}
function recognizes_1() {
    var rows = 
        "   \n" +
        "  |\n" +
        "  |\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("1", actual);
}

@test:Config {
    enable: false
}
function unreadableButCorrectlySizedInputsReturn_() {
    var rows = 
        "   \n" +
        "  _\n" +
        "  |\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("?", actual);
}

@test:Config {
    enable: false
}
function inputWithANumberOfLinesThatIsNotAMultipleOfFourRaisesAnError() {
    var rows = 
        " _ \n" +
        "| |\n" +
        "   ";
    Assert.Throws<ArgumentException>(() => OcrNumbers.Convert(rows));
}

@test:Config {
    enable: false
}
function inputWithANumberOfColumnsThatIsNotAMultipleOfThreeRaisesAnError() {
    var rows = 
        "    \n" +
        "   |\n" +
        "   |\n" +
        "    ";
    Assert.Throws<ArgumentException>(() => OcrNumbers.Convert(rows));
}

@test:Config {
    enable: false
}
function recognizes_110101100() {
    var rows = 
        "       _     _        _  _ \n" +
        "  |  || |  || |  |  || || |\n" +
        "  |  ||_|  ||_|  |  ||_||_|\n" +
        "                           ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("110101100", actual);
}

@test:Config {
    enable: false
}
function garbledNumbersInAStringAreReplacedWith_() {
    var rows = 
        "       _     _           _ \n" +
        "  |  || |  || |     || || |\n" +
        "  |  | _|  ||_|  |  ||_||_|\n" +
        "                           ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("11?10?1?0", actual);
}

@test:Config {
    enable: false
}
function recognizes_2() {
    var rows = 
        " _ \n" +
        " _|\n" +
        "|_ \n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("2", actual);
}

@test:Config {
    enable: false
}
function recognizes_3() {
    var rows = 
        " _ \n" +
        " _|\n" +
        " _|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("3", actual);
}

@test:Config {
    enable: false
}
function recognizes_4() {
    var rows = 
        "   \n" +
        "|_|\n" +
        "  |\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("4", actual);
}

@test:Config {
    enable: false
}
function recognizes_5() {
    var rows = 
        " _ \n" +
        "|_ \n" +
        " _|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("5", actual);
}

@test:Config {
    enable: false
}
function recognizes_6() {
    var rows = 
        " _ \n" +
        "|_ \n" +
        "|_|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("6", actual);
}

@test:Config {
    enable: false
}
function recognizes_7() {
    var rows = 
        " _ \n" +
        "  |\n" +
        "  |\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("7", actual);
}

@test:Config {
    enable: false
}
function recognizes_8() {
    var rows = 
        " _ \n" +
        "|_|\n" +
        "|_|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("8", actual);
}

@test:Config {
    enable: false
}
function recognizes_9() {
    var rows = 
        " _ \n" +
        "|_|\n" +
        " _|\n" +
        "   ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("9", actual);
}

@test:Config {
    enable: false
}
function recognizesStringOfDecimalNumbers() {
    var rows = 
        "    _  _     _  _  _  _  _  _ \n" +
        "  | _| _||_||_ |_   ||_||_|| |\n" +
        "  ||_  _|  | _||_|  ||_| _||_|\n" +
        "                              ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("1234567890", actual);
}

@test:Config {
    enable: false
}
function numbersSeparatedByEmptyLinesAreRecognizedLinesAreJoinedByCommas_() {
    var rows = 
        "    _  _ \n" +
        "  | _| _|\n" +
        "  ||_  _|\n" +
        "         \n" +
        "    _  _ \n" +
        "|_||_ |_ \n" +
        "  | _||_|\n" +
        "         \n" +
        " _  _  _ \n" +
        "  ||_||_|\n" +
        "  ||_| _|\n" +
        "         ";
    var actual = OcrNumbers.Convert(rows);
    test:assertEquals("123,456,789", actual);
}
