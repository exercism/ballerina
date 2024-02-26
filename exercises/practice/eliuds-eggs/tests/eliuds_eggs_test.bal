import ballerina/test;

@test:Config
function testZeroEggs() {
    test:assertEquals(eggCount(0), 0);
}

@test:Config {
    enable: false
}
function testOneEgg() {
    test:assertEquals(eggCount(16), 1);
}

@test:Config {
    enable: false
}
function testFourEggs() {
    test:assertEquals(eggCount(89), 4);
}

@test:Config {
    enable: false
}
function testThirteenEggs() {
    test:assertEquals(eggCount(2000000000), 13);
}
