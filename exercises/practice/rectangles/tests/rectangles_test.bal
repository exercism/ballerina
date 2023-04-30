import ballerina/test;

@test:Config {
    enable: false
}
function noRows() {
    var strings = Array.Empty<string>();
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function noColumns() {
    var strings = new[]
    {
        ""
    };
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function noRectangles() {
    var strings = new[]
    {
        " "
    };
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function oneRectangle() {
    var strings = new[]
    {
        "+-+",
        "| |",
        "+-+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function twoRectanglesWithoutSharedParts() {
    var strings = new[]
    {
        "  +-+",
        "  | |",
        "+-+-+",
        "| |  ",
        "+-+  "
    };
    test:assertEquals(2, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function fiveRectanglesWithSharedParts() {
    var strings = new[]
    {
        "  +-+",
        "  | |",
        "+-+-+",
        "| | |",
        "+-+-+"
    };
    test:assertEquals(5, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function rectangleOfHeight_1IsCounted() {
    var strings = new[]
    {
        "+--+",
        "+--+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function rectangleOfWidth_1IsCounted() {
    var strings = new[]
    {
        "++",
        "||",
        "++"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function number_1x1SquareIsCounted() {
    var strings = new[]
    {
        "++",
        "++"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function onlyCompleteRectanglesAreCounted() {
    var strings = new[]
    {
        "  +-+",
        "    |",
        "+-+-+",
        "| | -",
        "+-+-+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function rectanglesCanBeOfDifferentSizes() {
    var strings = new[]
    {
        "+------+----+",
        "|      |    |",
        "+---+--+    |",
        "|   |       |",
        "+---+-------+"
    };
    test:assertEquals(3, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function cornerIsRequiredForARectangleToBeComplete() {
    var strings = new[]
    {
        "+------+----+",
        "|      |    |",
        "+------+    |",
        "|   |       |",
        "+---+-------+"
    };
    test:assertEquals(2, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function largeInputWithManyRectangles() {
    var strings = new[]
    {
        "+---+--+----+",
        "|   +--+----+",
        "+---+--+    |",
        "|   +--+----+",
        "+---+--+--+-+",
        "+---+--+--+-+",
        "+------+  | |",
        "          +-+"
    };
    test:assertEquals(60, Rectangles.Count(strings));
}

@test:Config {
    enable: false
}
function rectanglesMustHaveFourSides() {
    var strings = new[]
    {
        "+-+ +-+",
        "| | | |",
        "+-+-+-+",
        "  | |  ",
        "+-+-+-+",
        "| | | |",
        "+-+ +-+"
    };
    test:assertEquals(5, Rectangles.Count(strings));
}
