import ballerina/test;

@test:Config
function zeroEggs() {
    test:assertEquals(eggCount(0), 0);
}

@test:Config {
    enable: false
}
function oneEgg() {
    test:assertEquals(eggCount(16), 1);
}

@test:Config {
    enable: false
}
function fourEggs() {
    test:assertEquals(eggCount(89), 4);
}

@test:Config {
    enable: false
}
function thirteenEggs() {
    test:assertEquals(eggCount(2000000000), 13);
}
