import ballerina/test;

@test:Config {
    enable: false
}
function findsAValueInAnArrayWithOneElement() {
    var array = [ 6 ];
    var value = 6;
    test:assertEquals(0, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function findsAValueInTheMiddleOfAnArray() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 6;
    test:assertEquals(3, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function findsAValueAtTheBeginningOfAnArray() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 1;
    test:assertEquals(0, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function findsAValueAtTheEndOfAnArray() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 11;
    test:assertEquals(6, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function findsAValueInAnArrayOfOddLength() {
    var array = [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634 ];
    var value = 144;
    test:assertEquals(9, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function findsAValueInAnArrayOfEvenLength() {
    var array = [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377 ];
    var value = 21;
    test:assertEquals(5, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function identifiesThatAValueIsNotIncludedInTheArray() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 7;
    test:assertEquals(-1, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function aValueSmallerThanTheArraysSmallestValueIsNotFound() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 0;
    test:assertEquals(-1, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function aValueLargerThanTheArraysLargestValueIsNotFound() {
    var array = [ 1, 3, 4, 6, 8, 9, 11 ];
    var value = 13;
    test:assertEquals(-1, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function nothingIsFoundInAnEmptyArray() {
    var array = Array.Empty<int>();
    var value = 1;
    test:assertEquals(-1, BinarySearch.Find(array, value));
}

@test:Config {
    enable: false
}
function nothingIsFoundWhenTheLeftAndRightBoundsCross() {
    var array = [ 1, 2 ];
    var value = 0;
    test:assertEquals(-1, BinarySearch.Find(array, value));
}
