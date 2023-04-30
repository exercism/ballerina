import ballerina/test;

@test:Config {
    enable: false
}
function emptyLists() {
    test:assertEquals(SublistType.Equal, Sublist.Classify(new List<int>(), new List<int>()));
}

@test:Config {
    enable: false
}
function emptyListWithinNonEmptyList() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify(new List<int>(), [ 1, 2, 3 ]));
}

@test:Config {
    enable: false
}
function nonEmptyListContainsEmptyList() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 1, 2, 3 ], new List<int>()));
}

@test:Config {
    enable: false
}
function listEqualsItself() {
    test:assertEquals(SublistType.Equal, Sublist.Classify([ 1, 2, 3 ], [ 1, 2, 3 ]));
}

@test:Config {
    enable: false
}
function differentLists() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 2, 3, 4 ]));
}

@test:Config {
    enable: false
}
function falseStart() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 1, 2, 5 ], [ 0, 1, 2, 3, 1, 2, 5, 6 ]));
}

@test:Config {
    enable: false
}
function consecutive() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 1, 1, 2 ], [ 0, 1, 1, 1, 2, 1, 2 ]));
}

@test:Config {
    enable: false
}
function sublistAtStart() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 0, 1, 2 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config {
    enable: false
}
function sublistInMiddle() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 2, 3, 4 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config {
    enable: false
}
function sublistAtEnd() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 3, 4, 5 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config {
    enable: false
}
function atStartOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 0, 1, 2 ]));
}

@test:Config {
    enable: false
}
function inMiddleOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 2, 3 ]));
}

@test:Config {
    enable: false
}
function atEndOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 3, 4, 5 ]));
}

@test:Config {
    enable: false
}
function firstListMissingElementFromSecondList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 3 ], [ 1, 2, 3 ]));
}

@test:Config {
    enable: false
}
function secondListMissingElementFromFirstList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 1, 3 ]));
}

@test:Config {
    enable: false
}
function firstListMissingAdditionalDigitsFromSecondList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2 ], [ 1, 22 ]));
}

@test:Config {
    enable: false
}
function orderMattersToAList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 3, 2, 1 ]));
}

@test:Config {
    enable: false
}
function sameDigitsButDifferentNumbers() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 0, 1 ], [ 10, 1 ]));
}
