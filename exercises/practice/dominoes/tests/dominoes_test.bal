import ballerina/test;

@test:Config {
    enable: false
}
function emptyInputEmptyOutput() {
    var dominoes = Array.Empty<(int, int)>();
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function singletonInputSingletonOutput() {
    var dominoes = [ (1, 1) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function singletonThatCantBeChained() {
    var dominoes = [ (1, 2) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function threeElements() {
    var dominoes = [ (1, 2), (3, 1), (2, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function canReverseDominoes() {
    var dominoes = [ (1, 2), (1, 3), (2, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function cantBeChained() {
    var dominoes = [ (1, 2), (4, 1), (2, 3) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function disconnectedSimple() {
    var dominoes = [ (1, 1), (2, 2) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function disconnectedDoubleLoop() {
    var dominoes = [ (1, 2), (2, 1), (3, 4), (4, 3) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function disconnectedSingleIsolated() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (4, 4) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function needBacktrack() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (2, 4), (2, 4) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function separateLoops() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function nineElements() {
    var dominoes = [ (1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config {
    enable: false
}
function separateThreeDominoLoops() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}
