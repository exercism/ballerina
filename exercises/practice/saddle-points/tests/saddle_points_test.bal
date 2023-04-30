import ballerina/test;

@test:Config {
    enable: false
}
function canIdentifySingleSaddlePoint() {
    var matrix = new[,]
    {
         { 9, 8, 7 },
         { 5, 3, 2 },
         { 6, 6, 7 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (2, 1) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifyThatEmptyMatrixHasNoSaddlePoints() {
    var matrix = new int[,] { };
    var actual = SaddlePoints.Calculate(matrix);
    Assert.Empty(actual);
}

@test:Config {
    enable: false
}
function canIdentifyLackOfSaddlePointsWhenThereAreNone() {
    var matrix = new[,]
    {
         { 1, 2, 3 },
         { 3, 1, 2 },
         { 2, 3, 1 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    Assert.Empty(actual);
}

@test:Config {
    enable: false
}
function canIdentifyMultipleSaddlePointsInAColumn() {
    var matrix = new[,]
    {
         { 4, 5, 4 },
         { 3, 5, 5 },
         { 1, 5, 4 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (1, 2), (2, 2), (3, 2) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifyMultipleSaddlePointsInARow() {
    var matrix = new[,]
    {
         { 6, 7, 8 },
         { 5, 5, 5 },
         { 7, 5, 6 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (2, 1), (2, 2), (2, 3) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifySaddlePointInBottomRightCorner() {
    var matrix = new[,]
    {
         { 8, 7, 9 },
         { 6, 7, 6 },
         { 3, 2, 5 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (3, 3) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifySaddlePointsInANonSquareMatrix() {
    var matrix = new[,]
    {
         { 3, 1, 3 },
         { 3, 2, 4 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (1, 1), (1, 3) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifyThatSaddlePointsInASingleColumnMatrixAreThoseWithTheMinimumValue() {
    var matrix = new[,]
    {
         { 2 },
         { 1 },
         { 4 },
         { 1 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (2, 1), (4, 1) ];
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function canIdentifyThatSaddlePointsInASingleRowMatrixAreThoseWithTheMaximumValue() {
    var matrix = new[,]
    {
         { 2, 5, 3, 5 }
    };
    var actual = SaddlePoints.Calculate(matrix);
    var expected = [ (1, 2), (1, 4) ];
    test:assertEquals(expected, actual);
}
