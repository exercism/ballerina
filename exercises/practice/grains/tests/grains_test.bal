import ballerina/test;

@test:Config {
    enable: false
}
function grainsOnSquare_1() {
    test:assertEquals(1UL, Grains.Square(1));
}

@test:Config {
    enable: false
}
function grainsOnSquare_2() {
    test:assertEquals(2UL, Grains.Square(2));
}

@test:Config {
    enable: false
}
function grainsOnSquare_3() {
    test:assertEquals(4UL, Grains.Square(3));
}

@test:Config {
    enable: false
}
function grainsOnSquare_4() {
    test:assertEquals(8UL, Grains.Square(4));
}

@test:Config {
    enable: false
}
function grainsOnSquare_16() {
    test:assertEquals(32768UL, Grains.Square(16));
}

@test:Config {
    enable: false
}
function grainsOnSquare_32() {
    test:assertEquals(2147483648UL, Grains.Square(32));
}

@test:Config {
    enable: false
}
function grainsOnSquare_64() {
    test:assertEquals(9223372036854775808UL, Grains.Square(64));
}

@test:Config {
    enable: false
}
function square_0RaisesAnException() {
    Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(0));
}

@test:Config {
    enable: false
}
function negativeSquareRaisesAnException() {
    Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(-1));
}

@test:Config {
    enable: false
}
function squareGreaterThan_64RaisesAnException() {
    Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(65));
}

@test:Config {
    enable: false
}
function returnsTheTotalNumberOfGrainsOnTheBoard() {
    test:assertEquals(18446744073709551615UL, Grains.Total());
}
