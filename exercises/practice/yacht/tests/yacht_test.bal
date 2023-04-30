import ballerina/test;

@test:Config {
    enable: false
}
function yacht() {
    test:assertEquals(50, YachtGame.Score([ 5, 5, 5, 5, 5 ], YachtCategory.Yacht));
}

@test:Config {
    enable: false
}
function notYacht() {
    test:assertEquals(0, YachtGame.Score([ 1, 3, 3, 2, 5 ], YachtCategory.Yacht));
}

@test:Config {
    enable: false
}
function ones() {
    test:assertEquals(3, YachtGame.Score([ 1, 1, 1, 3, 5 ], YachtCategory.Ones));
}

@test:Config {
    enable: false
}
function onesOutOfOrder() {
    test:assertEquals(3, YachtGame.Score([ 3, 1, 1, 5, 1 ], YachtCategory.Ones));
}

@test:Config {
    enable: false
}
function noOnes() {
    test:assertEquals(0, YachtGame.Score([ 4, 3, 6, 5, 5 ], YachtCategory.Ones));
}

@test:Config {
    enable: false
}
function twos() {
    test:assertEquals(2, YachtGame.Score([ 2, 3, 4, 5, 6 ], YachtCategory.Twos));
}

@test:Config {
    enable: false
}
function fours() {
    test:assertEquals(8, YachtGame.Score([ 1, 4, 1, 4, 1 ], YachtCategory.Fours));
}

@test:Config {
    enable: false
}
function yachtCountedAsThrees() {
    test:assertEquals(15, YachtGame.Score([ 3, 3, 3, 3, 3 ], YachtCategory.Threes));
}

@test:Config {
    enable: false
}
function yachtOf_3sCountedAsFives() {
    test:assertEquals(0, YachtGame.Score([ 3, 3, 3, 3, 3 ], YachtCategory.Fives));
}

@test:Config {
    enable: false
}
function fives() {
    test:assertEquals(10, YachtGame.Score([ 1, 5, 3, 5, 3 ], YachtCategory.Fives));
}

@test:Config {
    enable: false
}
function sixes() {
    test:assertEquals(6, YachtGame.Score([ 2, 3, 4, 5, 6 ], YachtCategory.Sixes));
}

@test:Config {
    enable: false
}
function fullHouseTwoSmallThreeBig() {
    test:assertEquals(16, YachtGame.Score([ 2, 2, 4, 4, 4 ], YachtCategory.FullHouse));
}

@test:Config {
    enable: false
}
function fullHouseThreeSmallTwoBig() {
    test:assertEquals(19, YachtGame.Score([ 5, 3, 3, 5, 3 ], YachtCategory.FullHouse));
}

@test:Config {
    enable: false
}
function twoPairIsNotAFullHouse() {
    test:assertEquals(0, YachtGame.Score([ 2, 2, 4, 4, 5 ], YachtCategory.FullHouse));
}

@test:Config {
    enable: false
}
function fourOfAKindIsNotAFullHouse() {
    test:assertEquals(0, YachtGame.Score([ 1, 4, 4, 4, 4 ], YachtCategory.FullHouse));
}

@test:Config {
    enable: false
}
function yachtIsNotAFullHouse() {
    test:assertEquals(0, YachtGame.Score([ 2, 2, 2, 2, 2 ], YachtCategory.FullHouse));
}

@test:Config {
    enable: false
}
function fourOfAKind() {
    test:assertEquals(24, YachtGame.Score([ 6, 6, 4, 6, 6 ], YachtCategory.FourOfAKind));
}

@test:Config {
    enable: false
}
function yachtCanBeScoredAsFourOfAKind() {
    test:assertEquals(12, YachtGame.Score([ 3, 3, 3, 3, 3 ], YachtCategory.FourOfAKind));
}

@test:Config {
    enable: false
}
function fullHouseIsNotFourOfAKind() {
    test:assertEquals(0, YachtGame.Score([ 3, 3, 3, 5, 5 ], YachtCategory.FourOfAKind));
}

@test:Config {
    enable: false
}
function littleStraight() {
    test:assertEquals(30, YachtGame.Score([ 3, 5, 4, 1, 2 ], YachtCategory.LittleStraight));
}

@test:Config {
    enable: false
}
function littleStraightAsBigStraight() {
    test:assertEquals(0, YachtGame.Score([ 1, 2, 3, 4, 5 ], YachtCategory.BigStraight));
}

@test:Config {
    enable: false
}
function fourInOrderButNotALittleStraight() {
    test:assertEquals(0, YachtGame.Score([ 1, 1, 2, 3, 4 ], YachtCategory.LittleStraight));
}

@test:Config {
    enable: false
}
function noPairsButNotALittleStraight() {
    test:assertEquals(0, YachtGame.Score([ 1, 2, 3, 4, 6 ], YachtCategory.LittleStraight));
}

@test:Config {
    enable: false
}
function minimumIs_1MaximumIs_5ButNotALittleStraight() {
    test:assertEquals(0, YachtGame.Score([ 1, 1, 3, 4, 5 ], YachtCategory.LittleStraight));
}

@test:Config {
    enable: false
}
function bigStraight() {
    test:assertEquals(30, YachtGame.Score([ 4, 6, 2, 5, 3 ], YachtCategory.BigStraight));
}

@test:Config {
    enable: false
}
function bigStraightAsLittleStraight() {
    test:assertEquals(0, YachtGame.Score([ 6, 5, 4, 3, 2 ], YachtCategory.LittleStraight));
}

@test:Config {
    enable: false
}
function noPairsButNotABigStraight() {
    test:assertEquals(0, YachtGame.Score([ 6, 5, 4, 3, 1 ], YachtCategory.BigStraight));
}

@test:Config {
    enable: false
}
function choice() {
    test:assertEquals(23, YachtGame.Score([ 3, 3, 5, 6, 6 ], YachtCategory.Choice));
}

@test:Config {
    enable: false
}
function yachtAsChoice() {
    test:assertEquals(10, YachtGame.Score([ 2, 2, 2, 2, 2 ], YachtCategory.Choice));
}
