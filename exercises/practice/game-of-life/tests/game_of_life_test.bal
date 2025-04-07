import ballerina/test;

@test:Config
function testEmptyMatrix() {
    int[][] matrix = [];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testLiveCellsWithZeroLiveNeighborsDie() {
    int[][] matrix = [
        [0, 0, 0],
        [0, 1, 0],
        [0, 0, 0]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testLiveCellsWithOnlyOneLiveNeighborDie() {
    int[][] matrix = [
        [0, 0, 0],
        [0, 1, 0],
        [0, 1, 0]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testLiveCellsWithTwoLiveNeighborsStayAlive() {
    int[][] matrix = [
        [1, 0, 1],
        [1, 0, 1],
        [1, 0, 1]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [0, 0, 0],
        [1, 0, 1],
        [0, 0, 0]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testLiveCellsWithThreeLiveNeighborsStayAlive() {
    int[][] matrix = [
        [0, 1, 0],
        [1, 0, 0],
        [1, 1, 0]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [0, 0, 0],
        [1, 0, 0],
        [1, 1, 0]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testDeadCellsWithThreeLiveNeighborsBecomeAlive() {
    int[][] matrix = [
        [1, 1, 0],
        [0, 0, 0],
        [1, 0, 0]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [0, 0, 0],
        [1, 1, 0],
        [0, 0, 0]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testLiveCellsWithFourOrMoreNeighborsDie() {
    int[][] matrix = [
        [1, 1, 1],
        [1, 1, 1],
        [1, 1, 1]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [1, 0, 1],
        [0, 0, 0],
        [1, 0, 1]
    ];
    test:assertEquals(game.matrix(), expected);
}

@test:Config {
    enable: false
}
function testBiggerMatrix() {
    int[][] matrix = [
        [1, 1, 0, 1, 1, 0, 0, 0],
        [1, 0, 1, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 1, 1, 1],
        [0, 0, 0, 0, 0, 1, 1, 0],
        [1, 0, 0, 0, 1, 1, 0, 0],
        [1, 1, 0, 0, 0, 1, 1, 1],
        [0, 0, 1, 0, 1, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 1]
    ];
    GameOfLife game = new (matrix);
    game.tick();
    int[][] expected = [
        [1, 1, 0, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 1, 1, 0],
        [1, 0, 1, 1, 1, 1, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 1],
        [1, 1, 0, 0, 1, 0, 0, 1],
        [1, 1, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 1]
    ];
    test:assertEquals(game.matrix(), expected);
}
