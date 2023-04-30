import ballerina/test;

@test:Config {
    enable: false
}
function dataIsRetained() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.ToTree();
    var expected = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function leftRightAndValue() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Right().Value();
    var expected = 3;
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function deadEnd() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Left();
    Assert.Null(actual);
}

@test:Config {
    enable: false
}
function treeFromDeepFocus() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Right().ToTree();
    var expected = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function traversingUpFromTop() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Up();
    Assert.Null(actual);
}

@test:Config {
    enable: false
}
function leftRightAndUp() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Up().Right().Up().Left().Right().Value();
    var expected = 3;
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function testAbilityToDescendMultipleLevelsAndReturn() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Right().Up().Up().Value();
    var expected = 1;
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setValue() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().SetValue(5).ToTree();
    var expected = new BinTree(1, new BinTree(5, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setValueAfterTraversingUp() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Right().Up().SetValue(5).ToTree();
    var expected = new BinTree(1, new BinTree(5, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setLeftWithLeaf() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().SetLeft(new BinTree(5, null, null)).ToTree();
    var expected = new BinTree(1, new BinTree(2, new BinTree(5, null, null), new BinTree(3, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setRightWithNull() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().SetRight(null).ToTree();
    var expected = new BinTree(1, new BinTree(2, null, null), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setRightWithSubtree() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.SetRight(new BinTree(6, new BinTree(7, null, null), new BinTree(8, null, null))).ToTree();
    var expected = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(6, new BinTree(7, null, null), new BinTree(8, null, null)));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function setValueOnDeepFocus() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Right().SetValue(5).ToTree();
    var expected = new BinTree(1, new BinTree(2, null, new BinTree(5, null, null)), new BinTree(4, null, null));
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function differentPathsToSameZipper() {
    var tree = new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null));
    var sut = Zipper.FromTree(tree);
    var actual = sut.Left().Up().Right();
    var expected = Zipper.FromTree(new BinTree(1, new BinTree(2, null, new BinTree(3, null, null)), new BinTree(4, null, null))).Right();
    test:assertEquals(expected, actual);
}
