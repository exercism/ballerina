import ballerina/test;

@test:Config {
    enable: false
}
function empty() {
    var array = Array.Empty<object>();
    Assert.Empty(FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function noNesting() {
    var array = new object[]
    {
        0,
        1,
        2
    };
    var expected = [ 0, 1, 2 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function flattensANestedArray() {
    var array = new object[]
    {
        new object[] { Array.Empty<object>() }
    };
    Assert.Empty(FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function flattensArrayWithJustIntegersPresent() {
    var array = new object[]
    {
        1,
        new object[] { 2, 3, 4, 5, 6, 7 },
        8
    };
    var expected = [ 1, 2, 3, 4, 5, 6, 7, 8 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function number_5LevelNesting() {
    var array = new object[]
    {
        0,
        2,
        new object[] { new object[] { 2, 3 }, 8, 100, 4, new object[] { new object[] { new object[] { 50 } } } },
        -2
    };
    var expected = [ 0, 2, 2, 3, 8, 100, 4, 50, -2 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function number_6LevelNesting() {
    var array = new object[]
    {
        1,
        new object[] { 2, new object[] { new object[] { 3 } }, new object[] { 4, new object[] { new object[] { 5 } } }, 6, 7 },
        8
    };
    var expected = [ 1, 2, 3, 4, 5, 6, 7, 8 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function nullValuesAreOmittedFromTheFinalResult() {
    var array = new object[]
    {
        1,
        2,
        null
    };
    var expected = [ 1, 2 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function consecutiveNullValuesAtTheFrontOfTheListAreOmittedFromTheFinalResult() {
    var array = new object[]
    {
        null,
        null,
        3
    };
    var expected = [ 3 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function consecutiveNullValuesInTheMiddleOfTheListAreOmittedFromTheFinalResult() {
    var array = new object[]
    {
        1,
        null,
        null,
        4
    };
    var expected = [ 1, 4 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function number_6LevelNestListWithNullValues() {
    var array = new object[]
    {
        0,
        2,
        new object[] { new object[] { 2, 3 }, 8, new object[] { new object[] { 100 } }, null, new object[] { new object[] { null } } },
        -2
    };
    var expected = [ 0, 2, 2, 3, 8, 100, -2 ];
    test:assertEquals(expected, FlattenArray.Flatten(array));
}

@test:Config {
    enable: false
}
function allValuesInNestedListAreNull() {
    var array = new object[]
    {
        null,
        new object[] { new object[] { new object[] { null } } },
        null,
        null,
        new object[] { new object[] { null, null }, null },
        null
    };
    Assert.Empty(FlattenArray.Flatten(array));
}
