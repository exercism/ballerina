import ballerina/test;

@test:Config {
    enable: false
}
function findsTheLargestProductIfSpanEqualsLength() {
    test:assertEquals(18, LargestSeriesProduct.GetLargestProduct("29", 2));
}

@test:Config {
    enable: false
}
function canFindTheLargestProductOf_2WithNumbersInOrder() {
    test:assertEquals(72, LargestSeriesProduct.GetLargestProduct("0123456789", 2));
}

@test:Config {
    enable: false
}
function canFindTheLargestProductOf_2() {
    test:assertEquals(48, LargestSeriesProduct.GetLargestProduct("576802143", 2));
}

@test:Config {
    enable: false
}
function canFindTheLargestProductOf_3WithNumbersInOrder() {
    test:assertEquals(504, LargestSeriesProduct.GetLargestProduct("0123456789", 3));
}

@test:Config {
    enable: false
}
function canFindTheLargestProductOf_3() {
    test:assertEquals(270, LargestSeriesProduct.GetLargestProduct("1027839564", 3));
}

@test:Config {
    enable: false
}
function canFindTheLargestProductOf_5WithNumbersInOrder() {
    test:assertEquals(15120, LargestSeriesProduct.GetLargestProduct("0123456789", 5));
}

@test:Config {
    enable: false
}
function canGetTheLargestProductOfABigNumber() {
    test:assertEquals(23520, LargestSeriesProduct.GetLargestProduct("73167176531330624919225119674426574742355349194934", 6));
}

@test:Config {
    enable: false
}
function reportsZeroIfTheOnlyDigitsAreZero() {
    test:assertEquals(0, LargestSeriesProduct.GetLargestProduct("0000", 2));
}

@test:Config {
    enable: false
}
function reportsZeroIfAllSpansIncludeZero() {
    test:assertEquals(0, LargestSeriesProduct.GetLargestProduct("99099", 3));
}

@test:Config {
    enable: false
}
function rejectsSpanLongerThanStringLength() {
    Assert.Throws<ArgumentException>(() => LargestSeriesProduct.GetLargestProduct("123", 4));
}

@test:Config {
    enable: false
}
function reports_1ForEmptyStringAndEmptyProduct_0Span_() {
    test:assertEquals(1, LargestSeriesProduct.GetLargestProduct("", 0));
}

@test:Config {
    enable: false
}
function reports_1ForNonemptyStringAndEmptyProduct_0Span_() {
    test:assertEquals(1, LargestSeriesProduct.GetLargestProduct("123", 0));
}

@test:Config {
    enable: false
}
function rejectsEmptyStringAndNonzeroSpan() {
    Assert.Throws<ArgumentException>(() => LargestSeriesProduct.GetLargestProduct("", 1));
}

@test:Config {
    enable: false
}
function rejectsInvalidCharacterInDigits() {
    Assert.Throws<ArgumentException>(() => LargestSeriesProduct.GetLargestProduct("1234a5", 2));
}

@test:Config {
    enable: false
}
function rejectsNegativeSpan() {
    Assert.Throws<ArgumentException>(() => LargestSeriesProduct.GetLargestProduct("12345", -1));
}
