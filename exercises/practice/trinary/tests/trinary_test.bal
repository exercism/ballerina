import ballerina/test;

@test:Config {
    enable: false
}
function trinary_1IsDecimal_1() {
    test:assertEquals(1, Trinary.ToDecimal("1"));
}

@test:Config {
    enable: false
}
function trinary_2IsDecimal_2() {
    test:assertEquals(2, Trinary.ToDecimal("2"));
}

@test:Config {
    enable: false
}
function trinary_10IsDecimal_3() {
    test:assertEquals(3, Trinary.ToDecimal("10"));
}

@test:Config {
    enable: false
}
function trinary_11IsDecimal_4() {
    test:assertEquals(4, Trinary.ToDecimal("11"));
}

@test:Config {
    enable: false
}
function trinary_100IsDecimal_9() {
    test:assertEquals(9, Trinary.ToDecimal("100"));
}

@test:Config {
    enable: false
}
function trinary_112IsDecimal_14() {
    test:assertEquals(14, Trinary.ToDecimal("112"));
}

@test:Config {
    enable: false
}
function trinary_222IsDecimal_26() {
    test:assertEquals(26, Trinary.ToDecimal("222"));
}

@test:Config {
    enable: false
}
function trinary_1122000120IsDecimal_32091() {
    test:assertEquals(32091, Trinary.ToDecimal("1122000120"));
}

@test:Config {
    enable: false
}
function invalidTrinaryDigitsReturns_0() {
    test:assertEquals(0, Trinary.ToDecimal("1234"));
}

@test:Config {
    enable: false
}
function invalidWordAsInputReturns_0() {
    test:assertEquals(0, Trinary.ToDecimal("carrot"));
}

@test:Config {
    enable: false
}
function invalidNumbersWithLettersAsInputReturns_0() {
    test:assertEquals(0, Trinary.ToDecimal("0a1b2c"));
}
