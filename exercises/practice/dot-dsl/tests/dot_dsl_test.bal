import ballerina/test;

@test:Config {
    enable: false
}
function emptyGraph() {
    var g = new Graph();

    Assert.Empty(g.Nodes);
    Assert.Empty(g.Edges);
    Assert.Empty(g.Attrs);
}

@test:Config {
    enable: false
}
function graphWithOneNode() {
    var g = new Graph
    {
        new Node("a")
    };

    test:assertEquals([ new Node("a") ], g.Nodes);
    Assert.Empty(g.Edges);
    Assert.Empty(g.Attrs);
}

@test:Config {
    enable: false
}
function graphWithOneNodeWithKeywords() {
    var g = new Graph
    {
        new Node("a") { { "color", "green" } }
    };

    test:assertEquals([ new Node("a") { { "color", "green" ] } }, g.Nodes);
    Assert.Empty(g.Edges);
    Assert.Empty(g.Attrs);
}

@test:Config {
    enable: false
}
function graphWithOneEdge() {
    var g = new Graph
    {
        new Edge("a", "b")
    };

    Assert.Empty(g.Nodes);
    test:assertEquals([ new Edge("a", "b") ], g.Edges);
    Assert.Empty(g.Attrs);
}

@test:Config {
    enable: false
}
function graphWithOneAttribute() {
    var g = new Graph
    {
        { "foo", "1" }
    };

    Assert.Empty(g.Nodes);
    Assert.Empty(g.Edges);
    test:assertEquals([ new Attr("foo", "1") ], g.Attrs);
}

@test:Config {
    enable: false
}
function graphWithAttributes() {
    var g = new Graph
    {
        { "foo", "1" },
        { "title", "Testing Attrs" },
        new Node("a") { { "color", "green" } },
        new Node("c"),
        new Node("b") { {  "label", "Beta!" } },
        new Edge("b", "c"),
        new Edge("a", "b") { { "color", "blue" } },
        { "bar", "true" }
    };

    test:assertEquals([ new Node("a") { { "color", "green" ] }, new Node("b") { { "label", "Beta!" } }, new Node("c") }, g.Nodes, EnumerableEqualityComparer<Node>.Instance);
    test:assertEquals([ new Edge("a", "b") { { "color", "blue" ] }, new Edge("b", "c") }, g.Edges, EnumerableEqualityComparer<Edge>.Instance);
    test:assertEquals([ new Attr("bar", "true"), new Attr("foo", "1"), new Attr("title", "Testing Attrs") ], g.Attrs, EnumerableEqualityComparer<Attr>.Instance);
}

private class EnumerableEqualityComparer<T> : IEqualityComparer<IEnumerable<T>>
    public static readonly EnumerableEqualityComparer<T> Instance = new EnumerableEqualityComparer<T>();

    public bool Equals(IEnumerable<T> x, IEnumerable<T> y) => new HashSet<T>(x).SetEquals(y);

    public int GetHashCode(IEnumerable<T> obj)
    {
        throw new NotImplementedException();
    }
}
