import ballerina/test;

@test:Config {
    enable: false
}
function findTheSmallestPalindromeFromSingleDigitFactors() {
    var actual = PalindromeProducts.Smallest(1, 9);
    var expected = (1, [ (1, 1) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheLargestPalindromeFromSingleDigitFactors() {
    var actual = PalindromeProducts.Largest(1, 9);
    var expected = (9, [ (1, 9), (3, 3) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheSmallestPalindromeFromDoubleDigitFactors() {
    var actual = PalindromeProducts.Smallest(10, 99);
    var expected = (121, [ (11, 11) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheLargestPalindromeFromDoubleDigitFactors() {
    var actual = PalindromeProducts.Largest(10, 99);
    var expected = (9009, [ (91, 99) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheSmallestPalindromeFromTripleDigitFactors() {
    var actual = PalindromeProducts.Smallest(100, 999);
    var expected = (10201, [ (101, 101) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheLargestPalindromeFromTripleDigitFactors() {
    var actual = PalindromeProducts.Largest(100, 999);
    var expected = (906609, [ (913, 993) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheSmallestPalindromeFromFourDigitFactors() {
    var actual = PalindromeProducts.Smallest(1000, 9999);
    var expected = (1002001, [ (1001, 1001) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function findTheLargestPalindromeFromFourDigitFactors() {
    var actual = PalindromeProducts.Largest(1000, 9999);
    var expected = (99000099, [ (9901, 9999) ]);
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config {
    enable: false
}
function emptyResultForSmallestIfNoPalindromeInTheRange() {
    Assert.Throws<ArgumentException>(() => PalindromeProducts.Smallest(1002, 1003));
}

@test:Config {
    enable: false
}
function emptyResultForLargestIfNoPalindromeInTheRange() {
    Assert.Throws<ArgumentException>(() => PalindromeProducts.Largest(15, 15));
}

@test:Config {
    enable: false
}
function errorResultForSmallestIfMinIsMoreThanMax() {
    Assert.Throws<ArgumentException>(() => PalindromeProducts.Smallest(10000, 1));
}

@test:Config {
    enable: false
}
function errorResultForLargestIfMinIsMoreThanMax() {
    Assert.Throws<ArgumentException>(() => PalindromeProducts.Largest(2, 1));
}
