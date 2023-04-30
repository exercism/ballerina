import ballerina/test;

@test:Config {
    enable: false
}
function emptyKeep() {
    test:assertEquals(new LinkedList<int>(), new LinkedList<int>().Keep(x => x < 10));
}

@test:Config {
    enable: false
}
function keepEverything() {
    test:assertEquals(new HashSet<int> { 1, 2, 3 }, new HashSet<int> { 1, 2, 3 }.Keep(x => x < 10));
}

@test:Config {
    enable: false
}
function keepFirstAndLast() {
    test:assertEquals([ 1, 3 ], [ 1, 2, 3 ].Keep(x => x % 2 != 0));
}

@test:Config {
    enable: false
}
function keepNeitherFirstNorLast() {
    test:assertEquals([ 2, 4 ], [ 1, 2, 3, 4, 5 ].Keep(x => x % 2 == 0));
}

@test:Config {
    enable: false
}
function keepStrings() {
    var words = "apple zebra banana zombies cherimoya zelot".Split(' ');
    test:assertEquals("zebra zombies zelot".Split(' '), words.Keep(x => x.StartsWith("z")));
}

@test:Config {
    enable: false
}
function keepArrays() {
    var actual = new[]
        {
            [ 1, 2, 3 ],
            [ 5, 5, 5 ],
            [ 5, 1, 2 ],
            [ 2, 1, 2 ],
            [ 1, 5, 2 ],
            [ 2, 2, 1 ],
            [ 1, 2, 5 ]
        };
    var expected = [ new[] { 5, 5, 5 ], [ 5, 1, 2 ], [ 1, 5, 2 ], [ 1, 2, 5 ] };
    test:assertEquals(expected, actual.Keep(x => x.Contains(5)));
}

@test:Config {
    enable: false
}
function emptyDiscard() {
    test:assertEquals(new LinkedList<int>(), new LinkedList<int>().Discard(x => x < 10));
}

@test:Config {
    enable: false
}
function discardNothing() {
    test:assertEquals(new HashSet<int> { 1, 2, 3 }, new HashSet<int> { 1, 2, 3 }.Discard(x => x > 10));
}

@test:Config {
    enable: false
}
function discardFirstAndLast() {
    test:assertEquals([ 2 ], [ 1, 2, 3 ].Discard(x => x % 2 != 0));
}

@test:Config {
    enable: false
}
function discardNeitherFirstNorLast() {
    test:assertEquals([ 1, 3, 5 ], [ 1, 2, 3, 4, 5 ].Discard(x => x % 2 == 0));
}

@test:Config {
    enable: false
}
function discardStrings() {
    var words = "apple zebra banana zombies cherimoya zelot".Split(' ');
    test:assertEquals("apple banana cherimoya".Split(' '), words.Discard(x => x.StartsWith("z")));
}

@test:Config {
    enable: false
}
function discardArrays() {
    var actual = new[]
        {
            [ 1, 2, 3 ],
            [ 5, 5, 5 ],
            [ 5, 1, 2 ],
            [ 2, 1, 2 ],
            [ 1, 5, 2 ],
            [ 2, 2, 1 ],
            [ 1, 2, 5 ]
        };
    var expected = [ new[] { 1, 2, 3 ], [ 2, 1, 2 ], [ 2, 2, 1 ] };
    test:assertEquals(expected, actual.Discard(x => x.Contains(5)));
}
