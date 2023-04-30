import ballerina/test;

@test:Config {
    enable: false
}
function setsWithNoElementsAreEmpty() {
    var sut = new CustomSet();
    test:assertTrue(sut.Empty());
}

@test:Config {
    enable: false
}
function setsWithElementsAreNotEmpty() {
    var sut = new CustomSet([ 1 ]);
    test:assertFalse(sut.Empty());
}

@test:Config {
    enable: false
}
function nothingIsContainedInAnEmptySet() {
    var element = 1;
    var sut = new CustomSet();
    test:assertFalse(sut.Contains(element));
}

@test:Config {
    enable: false
}
function whenTheElementIsInTheSet() {
    var element = 1;
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertTrue(sut.Contains(element));
}

@test:Config {
    enable: false
}
function whenTheElementIsNotInTheSet() {
    var element = 4;
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertFalse(sut.Contains(element));
}

@test:Config {
    enable: false
}
function emptySetIsASubsetOfAnotherEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertTrue(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function emptySetIsASubsetOfNonEmptySet() {
    var set2 = new CustomSet([ 1 ]);
    var sut = new CustomSet();
    test:assertTrue(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function nonEmptySetIsNotASubsetOfEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1 ]);
    test:assertFalse(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function setIsASubsetOfSetWithExactSameElements() {
    var set2 = new CustomSet([ 1, 2, 3 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertTrue(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function setIsASubsetOfLargerSetWithSameElements() {
    var set2 = new CustomSet([ 4, 1, 2, 3 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertTrue(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function setIsNotASubsetOfSetThatDoesNotContainItsElements() {
    var set2 = new CustomSet([ 4, 1, 3 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertFalse(sut.Subset(set2));
}

@test:Config {
    enable: false
}
function theEmptySetIsDisjointWithItself() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertTrue(sut.Disjoint(set2));
}

@test:Config {
    enable: false
}
function emptySetIsDisjointWithNonEmptySet() {
    var set2 = new CustomSet([ 1 ]);
    var sut = new CustomSet();
    test:assertTrue(sut.Disjoint(set2));
}

@test:Config {
    enable: false
}
function nonEmptySetIsDisjointWithEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1 ]);
    test:assertTrue(sut.Disjoint(set2));
}

@test:Config {
    enable: false
}
function setsAreNotDisjointIfTheyShareAnElement() {
    var set2 = new CustomSet([ 2, 3 ]);
    var sut = new CustomSet([ 1, 2 ]);
    test:assertFalse(sut.Disjoint(set2));
}

@test:Config {
    enable: false
}
function setsAreDisjointIfTheyShareNoElements() {
    var set2 = new CustomSet([ 3, 4 ]);
    var sut = new CustomSet([ 1, 2 ]);
    test:assertTrue(sut.Disjoint(set2));
}

@test:Config {
    enable: false
}
function emptySetsAreEqual() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertTrue(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function emptySetIsNotEqualToNonEmptySet() {
    var set2 = new CustomSet([ 1, 2, 3 ]);
    var sut = new CustomSet();
    test:assertFalse(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function nonEmptySetIsNotEqualToEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertFalse(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function setsWithTheSameElementsAreEqual() {
    var set2 = new CustomSet([ 2, 1 ]);
    var sut = new CustomSet([ 1, 2 ]);
    test:assertTrue(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function setsWithDifferentElementsAreNotEqual() {
    var set2 = new CustomSet([ 1, 2, 4 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertFalse(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function setIsNotEqualToLargerSetWithSameElements() {
    var set2 = new CustomSet([ 1, 2, 3, 4 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertFalse(sut.Equals(set2));
}

@test:Config {
    enable: false
}
function addToEmptySet() {
    var element = 3;
    var sut = new CustomSet();
    test:assertEquals(new CustomSet([ 3 ]), sut.Add(element));
}

@test:Config {
    enable: false
}
function addToNonEmptySet() {
    var element = 3;
    var sut = new CustomSet([ 1, 2, 4 ]);
    test:assertEquals(new CustomSet([ 1, 2, 3, 4 ]), sut.Add(element));
}

@test:Config {
    enable: false
}
function addingAnExistingElementDoesNotChangeTheSet() {
    var element = 3;
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertEquals(new CustomSet([ 1, 2, 3 ]), sut.Add(element));
}

@test:Config {
    enable: false
}
function intersectionOfTwoEmptySetsIsAnEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertEquals(new CustomSet(), sut.Intersection(set2));
}

@test:Config {
    enable: false
}
function intersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet() {
    var set2 = new CustomSet([ 3, 2, 5 ]);
    var sut = new CustomSet();
    test:assertEquals(new CustomSet(), sut.Intersection(set2));
}

@test:Config {
    enable: false
}
function intersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1, 2, 3, 4 ]);
    test:assertEquals(new CustomSet(), sut.Intersection(set2));
}

@test:Config {
    enable: false
}
function intersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet() {
    var set2 = new CustomSet([ 4, 5, 6 ]);
    var sut = new CustomSet([ 1, 2, 3 ]);
    test:assertEquals(new CustomSet(), sut.Intersection(set2));
}

@test:Config {
    enable: false
}
function intersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements() {
    var set2 = new CustomSet([ 3, 2, 5 ]);
    var sut = new CustomSet([ 1, 2, 3, 4 ]);
    test:assertEquals(new CustomSet([ 2, 3 ]), sut.Intersection(set2));
}

@test:Config {
    enable: false
}
function differenceOfTwoEmptySetsIsAnEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertEquals(new CustomSet(), sut.Difference(set2));
}

@test:Config {
    enable: false
}
function differenceOfEmptySetAndNonEmptySetIsAnEmptySet() {
    var set2 = new CustomSet([ 3, 2, 5 ]);
    var sut = new CustomSet();
    test:assertEquals(new CustomSet(), sut.Difference(set2));
}

@test:Config {
    enable: false
}
function differenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1, 2, 3, 4 ]);
    test:assertEquals(new CustomSet([ 1, 2, 3, 4 ]), sut.Difference(set2));
}

@test:Config {
    enable: false
}
function differenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet() {
    var set2 = new CustomSet([ 2, 4 ]);
    var sut = new CustomSet([ 3, 2, 1 ]);
    test:assertEquals(new CustomSet([ 1, 3 ]), sut.Difference(set2));
}

@test:Config {
    enable: false
}
function unionOfEmptySetsIsAnEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet();
    test:assertEquals(new CustomSet(), sut.Union(set2));
}

@test:Config {
    enable: false
}
function unionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet() {
    var set2 = new CustomSet([ 2 ]);
    var sut = new CustomSet();
    test:assertEquals(new CustomSet([ 2 ]), sut.Union(set2));
}

@test:Config {
    enable: false
}
function unionOfANonEmptySetAndEmptySetIsTheNonEmptySet() {
    var set2 = new CustomSet();
    var sut = new CustomSet([ 1, 3 ]);
    test:assertEquals(new CustomSet([ 1, 3 ]), sut.Union(set2));
}

@test:Config {
    enable: false
}
function unionOfNonEmptySetsContainsAllUniqueElements() {
    var set2 = new CustomSet([ 2, 3 ]);
    var sut = new CustomSet([ 1, 3 ]);
    test:assertEquals(new CustomSet([ 3, 2, 1 ]), sut.Union(set2));
}
