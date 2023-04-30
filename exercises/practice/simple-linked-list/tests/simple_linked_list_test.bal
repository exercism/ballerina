import ballerina/test;

@test:Config {
    enable: false
}
function singleItemListValue() {
    var list = new SimpleLinkedList<int>(1);
    test:assertEquals(1, list.Value);
}

@test:Config {
    enable: false
}
function singleItemListHasNoNextItem() {
    var list = new SimpleLinkedList<int>(1);
    Assert.Null(list.Next);
}

@test:Config {
    enable: false
}
function twoItemListFirstValue() {
    var list = new SimpleLinkedList<int>(2).Add(1);
    test:assertEquals(2, list.Value);
}

@test:Config {
    enable: false
}
function twoItemListSecondValue() {
    var list = new SimpleLinkedList<int>(2).Add(1);
    test:assertEquals(1, list.Next.Value);
}

@test:Config {
    enable: false
}
function twoItemListSecondItemHasNoNext() {
    var list = new SimpleLinkedList<int>(2).Add(1);
    Assert.Null(list.Next.Next);
}

@test:Config {
    enable: false
}
function implementsEnumerable() {
    var values = new SimpleLinkedList<int>(2).Add(1);
    test:assertEquals([ 2, 1 ], values);
}

@test:Config {
    enable: false
}
function fromEnumerable() {
    var list = new SimpleLinkedList<int>([ 11, 7, 5, 3, 2 ]);
    test:assertEquals(11, list.Value);
    test:assertEquals(7, list.Next.Value);
    test:assertEquals(5, list.Next.Next.Value);
    test:assertEquals(3, list.Next.Next.Next.Value);
    test:assertEquals(2, list.Next.Next.Next.Next.Value);
}

[Theory(Skip = "Remove this Skip property to run this test")]
[InlineData(1)]
[InlineData(2)]
[InlineData(10)]
[InlineData(100)]
function reverse(int length) {
    var values = Enumerable.Range(1, length).ToArray();
    var list = new SimpleLinkedList<int>(values);
    var reversed = list.Reverse();
    test:assertEquals(values.Reverse(), reversed);
}

[Theory(Skip = "Remove this Skip property to run this test")]
[InlineData(1)]
[InlineData(2)]
[InlineData(10)]
[InlineData(100)]
function roundtrip(int length) {
    var values = Enumerable.Range(1, length);
    var listValues = new SimpleLinkedList<int>(values);
    test:assertEquals(values, listValues);
}
