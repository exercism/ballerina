import ballerina/test;

@test:Config {
    enable: false
}
function oneNode() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsLeaf(tree, id: 0);
}

@test:Config {
    enable: false
}
function threeNodesInOrder() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsBranch(tree, id: 0, childCount: 2);
    AssertTreeIsLeaf(tree.Children[0], id: 1);
    AssertTreeIsLeaf(tree.Children[1], id: 2);
}

@test:Config {
    enable: false
}
function threeNodesInReverseOrder() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsBranch(tree, id: 0, childCount: 2);
    AssertTreeIsLeaf(tree.Children[0], id: 1);
    AssertTreeIsLeaf(tree.Children[1], id: 2);
}

@test:Config {
    enable: false
}
function moreThanTwoChildren() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 3, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsBranch(tree, id: 0, childCount: 3);
    AssertTreeIsLeaf(tree.Children[0], id: 1);
    AssertTreeIsLeaf(tree.Children[1], id: 2);
    AssertTreeIsLeaf(tree.Children[2], id: 3);
}

@test:Config {
    enable: false
}
function binaryTree() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 5, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 3, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 4, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 6, ParentId = 2 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsBranch(tree, id: 0, childCount: 2);
    AssertTreeIsBranch(tree.Children[0], id: 1, childCount: 2);
    AssertTreeIsBranch(tree.Children[1], id: 2, childCount: 2);

    AssertTreeIsLeaf(tree.Children[0].Children[0], id: 4);
    AssertTreeIsLeaf(tree.Children[0].Children[1], id: 5);
    AssertTreeIsLeaf(tree.Children[1].Children[0], id: 3);
    AssertTreeIsLeaf(tree.Children[1].Children[1], id: 6);
}

@test:Config {
    enable: false
}
function unbalancedTree() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 5, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 3, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 4, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 6, ParentId = 2 }
    };

    var tree = TreeBuilder.BuildTree(records);

    AssertTreeIsBranch(tree, id: 0, childCount: 2);
    AssertTreeIsBranch(tree.Children[0], id: 1, childCount: 1);
    AssertTreeIsBranch(tree.Children[1], id: 2, childCount: 3);

    AssertTreeIsLeaf(tree.Children[0].Children[0], id: 4);
    AssertTreeIsLeaf(tree.Children[1].Children[0], id: 3);
    AssertTreeIsLeaf(tree.Children[1].Children[1], id: 5);
    AssertTreeIsLeaf(tree.Children[1].Children[2], id: 6);
}

@test:Config {
    enable: false
}
function emptyInput() {
    var records = [];

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

@test:Config {
    enable: false
}
function rootNodeHasParent() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 0, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

@test:Config {
    enable: false
}
function noRootNode() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}


@test:Config {
    enable: false
}
function nonContinuous() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 4, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

@test:Config {
    enable: false
}
function cycleDirectly() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 5, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 3, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 4, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 6, ParentId = 3 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

@test:Config {
    enable: false
}
function cycleIndirectly() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 5, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 3, ParentId = 2 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 6 },
        new TreeBuildingRecord { RecordId = 4, ParentId = 1 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 6, ParentId = 3 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

@test:Config {
    enable: false
}
function higherIdParentOfLowerId() {
    var records = new[]
    {
        new TreeBuildingRecord { RecordId = 0, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 2, ParentId = 0 },
        new TreeBuildingRecord { RecordId = 1, ParentId = 2 }
    };

    Assert.Throws<ArgumentException>(() => TreeBuilder.BuildTree(records));
}

private static void AssertTreeIsBranch(Tree tree, int id, int childCount)
    test:assertEquals(id, tree.Id);
    test:assertFalse(tree.IsLeaf);
    test:assertEquals(childCount, tree.Children.Count);
}

private static void AssertTreeIsLeaf(Tree tree, int id)
    test:assertEquals(id, tree.Id);
    test:assertTrue(tree.IsLeaf);
}
