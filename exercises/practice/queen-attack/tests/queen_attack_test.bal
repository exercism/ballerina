import ballerina/test;

@test:Config {
    enable: false
}
function queenWithAValidPosition() {
    var actual = QueenAttack.Create(2, 2);
}

@test:Config {
    enable: false
}
function queenMustHavePositiveRow() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(-2, 2));
}

@test:Config {
    enable: false
}
function queenMustHaveRowOnBoard() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(8, 4));
}

@test:Config {
    enable: false
}
function queenMustHavePositiveColumn() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(2, -2));
}

@test:Config {
    enable: false
}
function queenMustHaveColumnOnBoard() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(4, 8));
}

@test:Config {
    enable: false
}
function cannotAttack() {
    var whiteQueen = QueenAttack.Create(2,4);
    var blackQueen = QueenAttack.Create(6,6);
    test:assertFalse(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnSameRow() {
    var whiteQueen = QueenAttack.Create(2,4);
    var blackQueen = QueenAttack.Create(2,6);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnSameColumn() {
    var whiteQueen = QueenAttack.Create(4,5);
    var blackQueen = QueenAttack.Create(2,5);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnFirstDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(0,4);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnSecondDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(3,1);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnThirdDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(1,1);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function canAttackOnFourthDiagonal() {
    var whiteQueen = QueenAttack.Create(1,7);
    var blackQueen = QueenAttack.Create(0,6);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config {
    enable: false
}
function cannotAttackIfFallingDiagonalsAreOnlyTheSameWhenReflectedAcrossTheLongestFallingDiagonal() {
    var whiteQueen = QueenAttack.Create(4,1);
    var blackQueen = QueenAttack.Create(2,5);
    test:assertFalse(QueenAttack.CanAttack(whiteQueen, blackQueen));
}
