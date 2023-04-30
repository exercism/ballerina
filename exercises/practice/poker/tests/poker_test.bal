import ballerina/test;

@test:Config {
    enable: false
}
function singleHandAlwaysWins() {
    var hands = [ "4S 5S 7H 8D JC" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S 5S 7H 8D JC" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function highestCardOutOfAllHandsWins() {
    var hands = [ "4D 5S 6S 8D 3C", "2S 4C 7S 9H 10H", "3S 4S 5D 6H JH" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 4S 5D 6H JH" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function aTieHasMultipleWinners() {
    var hands = [ "4D 5S 6S 8D 3C", "2S 4C 7S 9H 10H", "3S 4S 5D 6H JH", "3H 4H 5C 6C JD" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 4S 5D 6H JH", "3H 4H 5C 6C JD" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function multipleHandsWithTheSameHighCardsTieComparesNextHighestRankedDownToLastCard() {
    var hands = [ "3S 5H 6S 8D 7H", "2S 5D 6D 8C 7S" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 5H 6S 8D 7H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function onePairBeatsHighCard() {
    var hands = [ "4S 5H 6C 8D KH", "2S 4H 6S 4D JH" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "2S 4H 6S 4D JH" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function highestPairWins() {
    var hands = [ "4S 2H 6S 2D JH", "2S 4H 6C 4D JD" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "2S 4H 6C 4D JD" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function twoPairsBeatsOnePair() {
    var hands = [ "2S 8H 6S 8D JH", "4S 5H 4C 8C 5C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S 5H 4C 8C 5C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveTwoPairsHighestRankedPairWins() {
    var hands = [ "2S 8H 2D 8D 3H", "4S 5H 4C 8S 5D" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "2S 8H 2D 8D 3H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveTwoPairsWithTheSameHighestRankedPairTieGoesToLowPair() {
    var hands = [ "2S QS 2C QD JH", "JD QH JS 8D QC" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "JD QH JS 8D QC" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveTwoIdenticallyRankedPairsTieGoesToRemainingCardKicker_() {
    var hands = [ "JD QH JS 8D QC", "JS QS JC 2D QD" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "JD QH JS 8D QC" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveTwoPairsThatAddToTheSameValueWinGoesToHighestPair() {
    var hands = [ "6S 6H 3S 3H AS", "7H 7S 2H 2S AC" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "7H 7S 2H 2S AC" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function twoPairsFirstRankedByLargestPair() {
    var hands = [ "5C 2S 5S 4H 4C", "6S 2S 6H 7C 2C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "6S 2S 6H 7C 2C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function threeOfAKindBeatsTwoPair() {
    var hands = [ "2S 8H 2H 8D JH", "4S 5H 4C 8S 4H" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S 5H 4C 8S 4H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveThreeOfAKindTieGoesToHighestRankedTriplet() {
    var hands = [ "2S 2H 2C 8D JH", "4S AH AS 8C AD" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S AH AS 8C AD" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function withMultipleDecksTwoPlayersCanHaveSameThreeOfAKindTiesGoToHighestRemainingCards() {
    var hands = [ "4S AH AS 7C AD", "4S AH AS 8C AD" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S AH AS 8C AD" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function aStraightBeatsThreeOfAKind() {
    var hands = [ "4S 5H 4C 8D 4H", "3S 4D 2S 6D 5C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 4D 2S 6D 5C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function acesCanEndAStraight_10JQKA_() {
    var hands = [ "4S 5H 4C 8D 4H", "10D JH QS KD AC" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "10D JH QS KD AC" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function acesCanStartAStraightA_2_3_4_5_() {
    var hands = [ "4S 5H 4C 8D 4H", "4D AH 3S 2D 5C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4D AH 3S 2D 5C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsWithAStraightTieGoesToHighestRankedCard() {
    var hands = [ "4S 6C 7S 8D 5H", "5S 7H 8S 9D 6H" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "5S 7H 8S 9D 6H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function evenThoughAnAceIsUsuallyHighA_5HighStraightIsTheLowestScoringStraight() {
    var hands = [ "2H 3C 4D 5D 6H", "4S AH 3S 2D 5H" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "2H 3C 4D 5D 6H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function flushBeatsAStraight() {
    var hands = [ "4C 6H 7D 8D 5H", "2S 4S 5S 6S 7S" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "2S 4S 5S 6S 7S" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveAFlushTieGoesToHighCardDownToTheLastOneIfNecessary() {
    var hands = [ "4H 7H 8H 9H 6H", "2S 4S 5S 6S 7S" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4H 7H 8H 9H 6H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function fullHouseBeatsAFlush() {
    var hands = [ "3H 6H 7H 8H 5H", "4S 5H 4C 5D 4H" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S 5H 4C 5D 4H" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveAFullHouseTieGoesToHighestRankedTriplet() {
    var hands = [ "4H 4S 4D 9S 9D", "5H 5S 5D 8S 8D" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "5H 5S 5D 8S 8D" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function withMultipleDecksBothHandsHaveAFullHouseWithTheSameTripletTieGoesToThePair() {
    var hands = [ "5H 5S 5D 9S 9D", "5H 5S 5D 8S 8D" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "5H 5S 5D 9S 9D" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function fourOfAKindBeatsAFullHouse() {
    var hands = [ "4S 5H 4D 5D 4H", "3S 3H 2S 3D 3C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 3H 2S 3D 3C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveFourOfAKindTieGoesToHighQuad() {
    var hands = [ "2S 2H 2C 8D 2D", "4S 5H 5S 5D 5C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "4S 5H 5S 5D 5C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function withMultipleDecksBothHandsWithIdenticalFourOfAKindTieDeterminedByKicker() {
    var hands = [ "3S 3H 2S 3D 3C", "3S 3H 4S 3D 3C" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "3S 3H 4S 3D 3C" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function straightFlushBeatsFourOfAKind() {
    var hands = [ "4S 5H 5S 5D 5C", "7S 8S 9S 6S 10S" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "7S 8S 9S 6S 10S" ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothHandsHaveAStraightFlushTieGoesToHighestRankedCard() {
    var hands = [ "4H 6H 7H 8H 5H", "5S 7S 8S 9S 6S" ];
    var actual = Poker.BestHands(hands);
    var expected = [ "5S 7S 8S 9S 6S" ];
    test:assertEquals(expected, actual);
}
