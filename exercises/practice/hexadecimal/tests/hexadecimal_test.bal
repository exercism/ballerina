import ballerina/test;

@test:Config {
    enable: false
}
function hexadecimal_1IsDecimal_1() {
    test:assertEquals(1, Hexadecimal.ToDecimal("1"));
}

@test:Config {
    enable: false
}
function hexadecimalCIsDecimal_12() {
    test:assertEquals(12, Hexadecimal.ToDecimal("c"));
}

@test:Config {
    enable: false
}
function hexadecimal_10IsDecimal_16() {
    test:assertEquals(16, Hexadecimal.ToDecimal("10"));
}

@test:Config {
    enable: false
}
function hexadecimalAfIsDecimal_175() {
    test:assertEquals(175, Hexadecimal.ToDecimal("af"));
}

@test:Config {
    enable: false
}
function hexadecimal_100IsDecimal_256() {
    test:assertEquals(256, Hexadecimal.ToDecimal("100"));
}

@test:Config {
    enable: false
}
function hexadecimal_19aceIsDecimal_105166() {
    test:assertEquals(105166, Hexadecimal.ToDecimal("19ace"));
}

@test:Config {
    enable: false
}
function hexadecimalCarrotIsDecimal_0() {
    test:assertEquals(0, Hexadecimal.ToDecimal("carrot"));
}

@test:Config {
    enable: false
}
function hexadecimal_000000IsDecimal_0() {
    test:assertEquals(0, Hexadecimal.ToDecimal("000000"));
}

@test:Config {
    enable: false
}
function hexadecimalFfffffIsDecimal_16777215() {
    test:assertEquals(16777215, Hexadecimal.ToDecimal("ffffff"));
}

@test:Config {
    enable: false
}
function hexadecimalFfff00IsDecimal_16776960() {
    test:assertEquals(16776960, Hexadecimal.ToDecimal("ffff00"));
}

