import ballerina/test;

@test:Config {
    enable: false
}
function resultsInTheSameTreeIfTheInputTreeIsASingleton() {
    var tree = new Tree("x");
    var from = "x";
    var expected = new Tree("x");
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function canRerootATreeWithAParentAndOneSibling() {
    var tree = new Tree("parent", new Tree("x"), new Tree("sibling"));
    var from = "x";
    var expected = new Tree("x", new Tree("parent", new Tree("sibling")));
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function canRerootATreeWithAParentAndManySiblings() {
    var tree = new Tree("parent", new Tree("a"), new Tree("x"), new Tree("b"), new Tree("c"));
    var from = "x";
    var expected = new Tree("x", new Tree("parent", new Tree("a"), new Tree("b"), new Tree("c")));
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function canRerootATreeWithNewRootDeeplyNestedInTree() {
    var tree = new Tree("level-0", new Tree("level-1", new Tree("level-2", new Tree("level-3", new Tree("x")))));
    var from = "x";
    var expected = new Tree("x", new Tree("level-3", new Tree("level-2", new Tree("level-1", new Tree("level-0")))));
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function movesChildrenOfTheNewRootToSameLevelAsFormerParent() {
    var tree = new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")));
    var from = "x";
    var expected = new Tree("x", new Tree("kid-0"), new Tree("kid-1"), new Tree("parent"));
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function canRerootAComplexTreeWithCousins() {
    var tree = new Tree("grandparent", new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")), new Tree("sibling-0"), new Tree("sibling-1")), new Tree("uncle", new Tree("cousin-0"), new Tree("cousin-1")));
    var from = "x";
    var expected = new Tree("x", new Tree("kid-1"), new Tree("kid-0"), new Tree("parent", new Tree("sibling-0"), new Tree("sibling-1"), new Tree("grandparent", new Tree("uncle", new Tree("cousin-0"), new Tree("cousin-1")))));
    test:assertEquals(expected, Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function errorsIfTargetDoesNotExistInASingletonTree() {
    var tree = new Tree("x");
    var from = "nonexistent";
    Assert.Throws<ArgumentException>(() => Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function errorsIfTargetDoesNotExistInALargeTree() {
    var tree = new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")), new Tree("sibling-0"), new Tree("sibling-1"));
    var from = "nonexistent";
    Assert.Throws<ArgumentException>(() => Pov.FromPov(tree, from));
}

@test:Config {
    enable: false
}
function canFindPathToParent() {
    var from = "x";
    var to = "parent";
    var tree = new Tree("parent", new Tree("x"), new Tree("sibling"));
    var expected = [ "x", "parent" ];
    test:assertEquals(expected, Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function canFindPathToSibling() {
    var from = "x";
    var to = "b";
    var tree = new Tree("parent", new Tree("a"), new Tree("x"), new Tree("b"), new Tree("c"));
    var expected = [ "x", "parent", "b" ];
    test:assertEquals(expected, Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function canFindPathToCousin() {
    var from = "x";
    var to = "cousin-1";
    var tree = new Tree("grandparent", new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")), new Tree("sibling-0"), new Tree("sibling-1")), new Tree("uncle", new Tree("cousin-0"), new Tree("cousin-1")));
    var expected = [ "x", "parent", "grandparent", "uncle", "cousin-1" ];
    test:assertEquals(expected, Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function canFindPathNotInvolvingRoot() {
    var from = "x";
    var to = "sibling-1";
    var tree = new Tree("grandparent", new Tree("parent", new Tree("x"), new Tree("sibling-0"), new Tree("sibling-1")));
    var expected = [ "x", "parent", "sibling-1" ];
    test:assertEquals(expected, Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function canFindPathFromNodesOtherThanX() {
    var from = "a";
    var to = "c";
    var tree = new Tree("parent", new Tree("a"), new Tree("x"), new Tree("b"), new Tree("c"));
    var expected = [ "a", "parent", "c" ];
    test:assertEquals(expected, Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function errorsIfDestinationDoesNotExist() {
    var from = "x";
    var to = "nonexistent";
    var tree = new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")), new Tree("sibling-0"), new Tree("sibling-1"));
    Assert.Throws<ArgumentException>(() => Pov.PathTo(from, to, tree));
}

@test:Config {
    enable: false
}
function errorsIfSourceDoesNotExist() {
    var from = "nonexistent";
    var to = "x";
    var tree = new Tree("parent", new Tree("x", new Tree("kid-0"), new Tree("kid-1")), new Tree("sibling-0"), new Tree("sibling-1"));
    Assert.Throws<ArgumentException>(() => Pov.PathTo(from, to, tree));
}
