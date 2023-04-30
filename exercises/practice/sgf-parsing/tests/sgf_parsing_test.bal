import ballerina/test;

@test:Config {
    enable: false
}
function emptyInput() {
    var encoded = "";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function treeWithNoNodes() {
    var encoded = "()";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function nodeWithoutTree() {
    var encoded = ";";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function nodeWithoutProperties() {
    var encoded = "(;)";
    var expected = new SgfTree(new Dictionary<string, string[]>());
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function singleNodeTree() {
    var encoded = "(;A[B])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "B" ] });
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function multipleProperties() {
    var encoded = "(;A[b]C[d])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "b" ], ["C"] = [ "d" ] });
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function propertiesWithoutDelimiter() {
    var encoded = "(;A)";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function allLowercaseProperty() {
    var encoded = "(;a[b])";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function upperAndLowercaseProperty() {
    var encoded = "(;Aa[b])";
    Assert.Throws<ArgumentException>(() => SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function twoNodes() {
    var encoded = "(;A[B];B[C])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "B" ] }, new SgfTree(new Dictionary<string, string[]> { ["B"] = [ "C" ] }));
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function twoChildTrees() {
    var encoded = "(;A[B](;B[C])(;C[D]))";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "B" ] }, new SgfTree(new Dictionary<string, string[]> { ["B"] = [ "C" ] }), new SgfTree(new Dictionary<string, string[]> { ["C"] = [ "D" ] }));
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function multiplePropertyValues() {
    var encoded = "(;A[b][c][d])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "b", "c", "d" ] });
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function semicolonInPropertyValueDoesntNeedToBeEscaped() {
    var encoded = "(;A[a;b][foo]B[bar];C[baz])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "a;b", "foo" ], ["B"] = [ "bar" ] }, new SgfTree(new Dictionary<string, string[]> { ["C"] = [ "baz" ] }));
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

@test:Config {
    enable: false
}
function parenthesesInPropertyValueDontNeedToBeEscaped() {
    var encoded = "(;A[x(y)z][foo]B[bar];C[baz])";
    var expected = new SgfTree(new Dictionary<string, string[]> { ["A"] = [ "x(y)z", "foo" ], ["B"] = [ "bar" ] }, new SgfTree(new Dictionary<string, string[]> { ["C"] = [ "baz" ] }));
    AssertEqual(expected, SgfParser.ParseTree(encoded));
}

private void AssertEqual(SgfTree expected, SgfTree actual)
    test:assertEquals(expected.Data, actual.Data);
    test:assertEquals(expected.Children.Length, actual.Children.Length);
    for (var i = 0; i < expected.Children.Length; i++)
    {
        AssertEqual(expected.Children[i], actual.Children[i]);
    }
}
