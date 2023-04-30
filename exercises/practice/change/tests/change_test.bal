import ballerina/test;

@test:Config {
    enable: false
}
function changeFor_1Cent() {
    var coins = [ 1, 5, 10, 25 ];
    var target = 1;
    var expected = [ 1 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function singleCoinChange() {
    var coins = [ 1, 5, 10, 25, 100 ];
    var target = 25;
    var expected = [ 25 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function multipleCoinChange() {
    var coins = [ 1, 5, 10, 25, 100 ];
    var target = 15;
    var expected = [ 5, 10 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function changeWithLilliputianCoins() {
    var coins = [ 1, 4, 15, 20, 50 ];
    var target = 23;
    var expected = [ 4, 4, 15 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function changeWithLowerElboniaCoins() {
    var coins = [ 1, 5, 10, 21, 25 ];
    var target = 63;
    var expected = [ 21, 21, 21 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function largeTargetValues() {
    var coins = [ 1, 2, 5, 10, 20, 50, 100 ];
    var target = 999;
    var expected = [ 2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function possibleChangeWithoutUnitCoinsAvailable() {
    var coins = [ 2, 5, 10, 20, 50 ];
    var target = 21;
    var expected = [ 2, 2, 2, 5, 10 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function anotherPossibleChangeWithoutUnitCoinsAvailable() {
    var coins = [ 4, 5 ];
    var target = 27;
    var expected = [ 4, 4, 4, 5, 5, 5 ];
    test:assertEquals(expected, Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function noCoinsMake_0Change() {
    var coins = [ 1, 5, 10, 21, 25 ];
    var target = 0;
    Assert.Empty(Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function errorTestingForChangeSmallerThanTheSmallestOfCoins() {
    var coins = [ 5, 10 ];
    var target = 3;
    Assert.Throws<ArgumentException>(() => Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function errorIfNoCombinationCanAddUpToTarget() {
    var coins = [ 5, 10 ];
    var target = 94;
    Assert.Throws<ArgumentException>(() => Change.FindFewestCoins(coins, target));
}

@test:Config {
    enable: false
}
function cannotFindNegativeChangeValues() {
    var coins = [ 1, 2, 5 ];
    var target = -5;
    Assert.Throws<ArgumentException>(() => Change.FindFewestCoins(coins, target));
}
