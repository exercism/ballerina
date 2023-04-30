import ballerina/test;

@test:Config {
    enable: false
}
function tripletsWhoseSumIs_12() {
    test:assertEquals(new[]
    {
        (3, 4, 5)
    }, PythagoreanTriplet.TripletsWithSum(12));
}

@test:Config {
    enable: false
}
function tripletsWhoseSumIs_108() {
    test:assertEquals(new[]
    {
        (27, 36, 45)
    }, PythagoreanTriplet.TripletsWithSum(108));
}

@test:Config {
    enable: false
}
function tripletsWhoseSumIs_1000() {
    test:assertEquals(new[]
    {
        (200, 375, 425)
    }, PythagoreanTriplet.TripletsWithSum(1000));
}

@test:Config {
    enable: false
}
function noMatchingTripletsFor_1001() {
    test:assertEquals(Array.Empty<(int, int, int)>(), PythagoreanTriplet.TripletsWithSum(1001));
}

@test:Config {
    enable: false
}
function returnsAllMatchingTriplets() {
    test:assertEquals(new[]
    {
        (9, 40, 41),
        (15, 36, 39)
    }, PythagoreanTriplet.TripletsWithSum(90));
}

@test:Config {
    enable: false
}
function severalMatchingTriplets() {
    test:assertEquals(new[]
    {
        (40, 399, 401),
        (56, 390, 394),
        (105, 360, 375),
        (120, 350, 370),
        (140, 336, 364),
        (168, 315, 357),
        (210, 280, 350),
        (240, 252, 348)
    }, PythagoreanTriplet.TripletsWithSum(840));
}

@test:Config {
    enable: false
}
function tripletsForLargeNumber() {
    test:assertEquals(new[]
    {
        (1200, 14375, 14425),
        (1875, 14000, 14125),
        (5000, 12000, 13000),
        (6000, 11250, 12750),
        (7500, 10000, 12500)
    }, PythagoreanTriplet.TripletsWithSum(30000));
}
