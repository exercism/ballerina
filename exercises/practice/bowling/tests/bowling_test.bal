import ballerina/test;

@test:Config {
    enable: false
}
function shouldBeAbleToScoreAGameWithAllZeros() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(0, actual);
}

@test:Config {
    enable: false
}
function shouldBeAbleToScoreAGameWithNoStrikesOrSpares() {
    var sut = new BowlingGame();
    var previousRolls = [ 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(90, actual);
}

@test:Config {
    enable: false
}
function aSpareFollowedByZerosIsWorthTenPoints() {
    var sut = new BowlingGame();
    var previousRolls = [ 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(10, actual);
}

@test:Config {
    enable: false
}
function pointsScoredInTheRollAfterASpareAreCountedTwice() {
    var sut = new BowlingGame();
    var previousRolls = [ 6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(16, actual);
}

@test:Config {
    enable: false
}
function consecutiveSparesEachGetAOneRollBonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(31, actual);
}

@test:Config {
    enable: false
}
function aSpareInTheLastFrameGetsAOneRollBonusThatIsCountedOnce() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(17, actual);
}

@test:Config {
    enable: false
}
function aStrikeEarnsTenPointsInAFrameWithASingleRoll() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(10, actual);
}

@test:Config {
    enable: false
}
function pointsScoredInTheTwoRollsAfterAStrikeAreCountedTwiceAsABonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(26, actual);
}

@test:Config {
    enable: false
}
function consecutiveStrikesEachGetTheTwoRollBonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(81, actual);
}

@test:Config {
    enable: false
}
function aStrikeInTheLastFrameGetsATwoRollBonusThatIsCountedOnce() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(18, actual);
}

@test:Config {
    enable: false
}
function rollingASpareWithTheTwoRollBonusDoesNotGetABonusRoll() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(20, actual);
}

@test:Config {
    enable: false
}
function strikesWithTheTwoRollBonusDoNotGetBonusRolls() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(30, actual);
}

@test:Config {
    enable: false
}
function lastTwoStrikesFollowedByOnlyLastBonusWithNonStrikePoints() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(31, actual);
}

@test:Config {
    enable: false
}
function aStrikeWithTheOneRollBonusAfterASpareInTheLastFrameDoesNotGetABonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(20, actual);
}

@test:Config {
    enable: false
}
function allStrikesIsAPerfectGame() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(300, actual);
}

@test:Config {
    enable: false
}
function rollsCannotScoreNegativePoints() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(-1));
}

@test:Config {
    enable: false
}
function aRollCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config {
    enable: false
}
function twoRollsInAFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 5 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(6));
}

@test:Config {
    enable: false
}
function bonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config {
    enable: false
}
function twoBonusRollsAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(6));
}

@test:Config {
    enable: false
}
function twoBonusRollsAfterAStrikeInTheLastFrameCanScoreMoreThan_10PointsIfOneIsAStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(26, actual);
}

@test:Config {
    enable: false
}
function theSecondBonusRollsAfterAStrikeInTheLastFrameCannotBeAStrikeIfTheFirstOneIsNotAStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(10));
}

@test:Config {
    enable: false
}
function secondBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config {
    enable: false
}
function anUnstartedGameCannotBeScored() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config {
    enable: false
}
function anIncompleteGameCannotBeScored() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config {
    enable: false
}
function cannotRollIfGameAlreadyHasTenFrames() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(0));
}

@test:Config {
    enable: false
}
function bonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config {
    enable: false
}
function bothBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config {
    enable: false
}
function bonusRollForASpareInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config {
    enable: false
}
function cannotRollAfterBonusRollForSpare() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(2));
}

@test:Config {
    enable: false
}
function cannotRollAfterBonusRollsForStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(2));
}

private void DoRoll(IEnumerable<int> rolls, BowlingGame sut)
    foreach (var roll in rolls)
    {
        sut.Roll(roll);
    }
}
