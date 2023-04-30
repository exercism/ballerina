import ballerina/test;

@test:Config {
    enable: false
}
function encodeWithTwoRails() {
    var msg = "XOXOXOXOXOXOXOXOXO";
    var sut = new RailFenceCipher(2);
    var expected = "XXXXXXXXXOOOOOOOOO";
    test:assertEquals(expected, sut.Encode(msg));
}

@test:Config {
    enable: false
}
function encodeWithThreeRails() {
    var msg = "WEAREDISCOVEREDFLEEATONCE";
    var sut = new RailFenceCipher(3);
    var expected = "WECRLTEERDSOEEFEAOCAIVDEN";
    test:assertEquals(expected, sut.Encode(msg));
}

@test:Config {
    enable: false
}
function encodeWithEndingInTheMiddle() {
    var msg = "EXERCISES";
    var sut = new RailFenceCipher(4);
    var expected = "ESXIEECSR";
    test:assertEquals(expected, sut.Encode(msg));
}

@test:Config {
    enable: false
}
function decodeWithThreeRails() {
    var msg = "TEITELHDVLSNHDTISEIIEA";
    var sut = new RailFenceCipher(3);
    var expected = "THEDEVILISINTHEDETAILS";
    test:assertEquals(expected, sut.Decode(msg));
}

@test:Config {
    enable: false
}
function decodeWithFiveRails() {
    var msg = "EIEXMSMESAORIWSCE";
    var sut = new RailFenceCipher(5);
    var expected = "EXERCISMISAWESOME";
    test:assertEquals(expected, sut.Decode(msg));
}

@test:Config {
    enable: false
}
function decodeWithSixRails() {
    var msg = "133714114238148966225439541018335470986172518171757571896261";
    var sut = new RailFenceCipher(6);
    var expected = "112358132134558914423337761098715972584418167651094617711286";
    test:assertEquals(expected, sut.Decode(msg));
}
