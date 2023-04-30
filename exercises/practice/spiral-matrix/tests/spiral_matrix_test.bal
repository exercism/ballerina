import ballerina/test;

@test:Config {
    enable: false
}
function emptySpiral() {
    Assert.Empty(SpiralMatrix.GetMatrix(0));
}

@test:Config {
    enable: false
}
function trivialSpiral() {
    var expected = new[,]
    {
         { 1 }
    };
    test:assertEquals(expected, SpiralMatrix.GetMatrix(1));
}

@test:Config {
    enable: false
}
function spiralOfSize_2() {
    var expected = new[,]
    {
         { 1, 2 },
         { 4, 3 }
    };
    test:assertEquals(expected, SpiralMatrix.GetMatrix(2));
}

@test:Config {
    enable: false
}
function spiralOfSize_3() {
    var expected = new[,]
    {
         { 1, 2, 3 },
         { 8, 9, 4 },
         { 7, 6, 5 }
    };
    test:assertEquals(expected, SpiralMatrix.GetMatrix(3));
}

@test:Config {
    enable: false
}
function spiralOfSize_4() {
    var expected = new[,]
    {
         { 1, 2, 3, 4 },
         { 12, 13, 14, 5 },
         { 11, 16, 15, 6 },
         { 10, 9, 8, 7 }
    };
    test:assertEquals(expected, SpiralMatrix.GetMatrix(4));
}

@test:Config {
    enable: false
}
function spiralOfSize_5() {
    var expected = new[,]
    {
         { 1, 2, 3, 4, 5 },
         { 16, 17, 18, 19, 6 },
         { 15, 24, 25, 20, 7 },
         { 14, 23, 22, 21, 8 },
         { 13, 12, 11, 10, 9 }
    };
    test:assertEquals(expected, SpiralMatrix.GetMatrix(5));
}
