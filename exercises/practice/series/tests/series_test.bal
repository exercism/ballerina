import ballerina/test;

@test:Config {
    enable: false
}
function slicesOfOneFromOne() {
    var expected = [ "1" ];
    test:assertEquals(expected, Series.Slices("1", 1).ToArray());
}

@test:Config {
    enable: false
}
function slicesOfOneFromTwo() {
    var expected = [ "1", "2" ];
    test:assertEquals(expected, Series.Slices("12", 1).ToArray());
}

@test:Config {
    enable: false
}
function slicesOfTwo() {
    var expected = [ "35" ];
    test:assertEquals(expected, Series.Slices("35", 2).ToArray());
}

@test:Config {
    enable: false
}
function slicesOfTwoOverlap() {
    var expected = [ "91", "14", "42" ];
    test:assertEquals(expected, Series.Slices("9142", 2).ToArray());
}

@test:Config {
    enable: false
}
function slicesCanIncludeDuplicates() {
    var expected = [ "777", "777", "777", "777" ];
    test:assertEquals(expected, Series.Slices("777777", 3).ToArray());
}

@test:Config {
    enable: false
}
function slicesOfALongSeries() {
    var expected = [ "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243" ];
    test:assertEquals(expected, Series.Slices("918493904243", 5).ToArray());
}

@test:Config {
    enable: false
}
function sliceLengthIsTooLarge() {
    Assert.Throws<ArgumentException>(() => Series.Slices("12345", 6).ToArray());
}

@test:Config {
    enable: false
}
function sliceLengthIsWayTooLarge() {
    Assert.Throws<ArgumentException>(() => Series.Slices("12345", 42).ToArray());
}

@test:Config {
    enable: false
}
function sliceLengthCannotBeZero() {
    Assert.Throws<ArgumentException>(() => Series.Slices("12345", 0).ToArray());
}

@test:Config {
    enable: false
}
function sliceLengthCannotBeNegative() {
    Assert.Throws<ArgumentException>(() => Series.Slices("123", -1).ToArray());
}

@test:Config {
    enable: false
}
function emptySeriesIsInvalid() {
    Assert.Throws<ArgumentException>(() => Series.Slices("", 1).ToArray());
}
