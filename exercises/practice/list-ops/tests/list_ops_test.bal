import ballerina/test;

@test:Config {
    enable: false
}
function appendEntriesToAListAndReturnTheNewListEmptyLists() {
    var list1 = new List<int>();
    var list2 = new List<int>();
    Assert.Empty(ListOps.Append(list1, list2));
}

@test:Config {
    enable: false
}
function appendEntriesToAListAndReturnTheNewListListToEmptyList() {
    var list1 = new List<int>();
    var list2 = [ 1, 2, 3, 4 ];
    var expected = [ 1, 2, 3, 4 ];
    test:assertEquals(expected, ListOps.Append(list1, list2));
}

@test:Config {
    enable: false
}
function appendEntriesToAListAndReturnTheNewListEmptyListToList() {
    var list1 = [ 1, 2, 3, 4 ];
    var list2 = new List<int>();
    var expected = [ 1, 2, 3, 4 ];
    test:assertEquals(expected, ListOps.Append(list1, list2));
}

@test:Config {
    enable: false
}
function appendEntriesToAListAndReturnTheNewListNonEmptyLists() {
    var list1 = [ 1, 2 ];
    var list2 = [ 2, 3, 4, 5 ];
    var expected = [ 1, 2, 2, 3, 4, 5 ];
    test:assertEquals(expected, ListOps.Append(list1, list2));
}

@test:Config {
    enable: false
}
function concatenateAListOfListsEmptyList() {
    var lists = new List<List<int>>();
    Assert.Empty(ListOps.Concat(lists));
}

@test:Config {
    enable: false
}
function concatenateAListOfListsListOfLists() {
    var lists = new List<List<int>> { [ 1, 2 ], [ 3 ], new List<int>(), [ 4, 5, 6 ] };
    var expected = [ 1, 2, 3, 4, 5, 6 ];
    test:assertEquals(expected, ListOps.Concat(lists));
}

@test:Config {
    enable: false
}
function concatenateAListOfListsListOfNestedLists() {
    var lists = new List<List<List<int>>> { new List<List<int>> { [ 1 ], [ 2 ] }, new List<List<int>> { [ 3 ] }, new List<List<int>> { new List<int>() }, new List<List<int>> { [ 4, 5, 6 ] } };
    var expected = new List<List<int>> { [ 1 ], [ 2 ], [ 3 ], new List<int>(), [ 4, 5, 6 ] };
    test:assertEquals(expected, ListOps.Concat(lists));
}

@test:Config {
    enable: false
}
function filterListReturningOnlyValuesThatSatisfyTheFilterFunctionEmptyList() {
    var list = new List<int>();
    var function = new Func<int, bool>((x) => x % 2 == 1);
    Assert.Empty(ListOps.Filter(list, function));
}

@test:Config {
    enable: false
}
function filterListReturningOnlyValuesThatSatisfyTheFilterFunctionNonEmptyList() {
    var list = [ 1, 2, 3, 5 ];
    var function = new Func<int, bool>((x) => x % 2 == 1);
    var expected = [ 1, 3, 5 ];
    test:assertEquals(expected, ListOps.Filter(list, function));
}

@test:Config {
    enable: false
}
function returnsTheLengthOfAListEmptyList() {
    var list = new List<int>();
    test:assertEquals(0, ListOps.Length(list));
}

@test:Config {
    enable: false
}
function returnsTheLengthOfAListNonEmptyList() {
    var list = [ 1, 2, 3, 4 ];
    test:assertEquals(4, ListOps.Length(list));
}

@test:Config {
    enable: false
}
function returnAListOfElementsWhoseValuesEqualTheListValueTransformedByTheMappingFunctionEmptyList() {
    var list = new List<int>();
    var function = new Func<int, int>((x) => x + 1);
    Assert.Empty(ListOps.Map(list, function));
}

@test:Config {
    enable: false
}
function returnAListOfElementsWhoseValuesEqualTheListValueTransformedByTheMappingFunctionNonEmptyList() {
    var list = [ 1, 3, 5, 7 ];
    var function = new Func<int, int>((x) => x + 1);
    var expected = [ 2, 4, 6, 8 ];
    test:assertEquals(expected, ListOps.Map(list, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheLeftWithAFunctionDirectionDependentFunctionAppliedToNonEmptyList() {
    var list = [ 2, 5 ];
    var initial = 5;
    var function = new Func<int, int, int>((x, y) => x / y);
    test:assertEquals(0, ListOps.Foldl(list, initial, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheLeftWithAFunctionEmptyList() {
    var list = new List<int>();
    var initial = 2;
    var function = new Func<int, int, int>((acc, el) => el * acc);
    test:assertEquals(2, ListOps.Foldl(list, initial, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheLeftWithAFunctionDirectionIndependentFunctionAppliedToNonEmptyList() {
    var list = [ 1, 2, 3, 4 ];
    var initial = 5;
    var function = new Func<int, int, int>((acc, el) => el + acc);
    test:assertEquals(15, ListOps.Foldl(list, initial, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheRightWithAFunctionDirectionDependentFunctionAppliedToNonEmptyList() {
    var list = [ 2, 5 ];
    var initial = 5;
    var function = new Func<int, int, int>((x, y) => x / y);
    test:assertEquals(2, ListOps.Foldr(list, initial, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheRightWithAFunctionEmptyList() {
    var list = new List<int>();
    var initial = 2;
    var function = new Func<int, int, int>((acc, el) => el * acc);
    test:assertEquals(2, ListOps.Foldr(list, initial, function));
}

@test:Config {
    enable: false
}
function foldsReducesTheGivenListFromTheRightWithAFunctionDirectionIndependentFunctionAppliedToNonEmptyList() {
    var list = [ 1, 2, 3, 4 ];
    var initial = 5;
    var function = new Func<int, int, int>((acc, el) => el + acc);
    test:assertEquals(15, ListOps.Foldr(list, initial, function));
}

@test:Config {
    enable: false
}
function reverseTheElementsOfTheListEmptyList() {
    var list = new List<int>();
    Assert.Empty(ListOps.Reverse(list));
}

@test:Config {
    enable: false
}
function reverseTheElementsOfTheListNonEmptyList() {
    var list = [ 1, 3, 5, 7 ];
    var expected = [ 7, 5, 3, 1 ];
    test:assertEquals(expected, ListOps.Reverse(list));
}

@test:Config {
    enable: false
}
function reverseTheElementsOfTheListListOfListsIsNotFlattened() {
    var list = new List<List<int>> { [ 1, 2 ], [ 3 ], new List<int>(), [ 4, 5, 6 ] };
    var expected = new List<List<int>> { [ 4, 5, 6 ], new List<int>(), [ 3 ], [ 1, 2 ] };
    test:assertEquals(expected, ListOps.Reverse(list));
}
