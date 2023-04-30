import ballerina/test;

@test:Config {
    enable: false
}
function zeroRows() {
    Assert.Empty(PascalsTriangle.Calculate(0));
}

@test:Config {
    enable: false
}
function singleRow() {
    var expected = new[]
    {
        [ 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(1));
}

@test:Config {
    enable: false
}
function twoRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(2));
}

@test:Config {
    enable: false
}
function threeRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ],
        [ 1, 2, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(3));
}

@test:Config {
    enable: false
}
function fourRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ],
        [ 1, 2, 1 ],
        [ 1, 3, 3, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(4));
}

@test:Config {
    enable: false
}
function fiveRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ],
        [ 1, 2, 1 ],
        [ 1, 3, 3, 1 ],
        [ 1, 4, 6, 4, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(5));
}

@test:Config {
    enable: false
}
function sixRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ],
        [ 1, 2, 1 ],
        [ 1, 3, 3, 1 ],
        [ 1, 4, 6, 4, 1 ],
        [ 1, 5, 10, 10, 5, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(6));
}

@test:Config {
    enable: false
}
function tenRows() {
    var expected = new[]
    {
        [ 1 ],
        [ 1, 1 ],
        [ 1, 2, 1 ],
        [ 1, 3, 3, 1 ],
        [ 1, 4, 6, 4, 1 ],
        [ 1, 5, 10, 10, 5, 1 ],
        [ 1, 6, 15, 20, 15, 6, 1 ],
        [ 1, 7, 21, 35, 35, 21, 7, 1 ],
        [ 1, 8, 28, 56, 70, 56, 28, 8, 1 ],
        [ 1, 9, 36, 84, 126, 126, 84, 36, 9, 1 ]
    };
    test:assertEquals(expected, PascalsTriangle.Calculate(10));
}
