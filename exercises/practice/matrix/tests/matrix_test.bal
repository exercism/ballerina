import ballerina/test;

@test:Config {
    enable: false
}
function extractRowFromOneNumberMatrix() {
    var sut = new Matrix("1");
    test:assertEquals([ 1 ], sut.Row(1));
}

@test:Config {
    enable: false
}
function canExtractRow() {
    var sut = new Matrix("1 2\n3 4");
    test:assertEquals([ 3, 4 ], sut.Row(2));
}

@test:Config {
    enable: false
}
function extractRowWhereNumbersHaveDifferentWidths() {
    var sut = new Matrix("1 2\n10 20");
    test:assertEquals([ 10, 20 ], sut.Row(2));
}

@test:Config {
    enable: false
}
function canExtractRowFromNonSquareMatrixWithNoCorrespondingColumn() {
    var sut = new Matrix("1 2 3\n4 5 6\n7 8 9\n8 7 6");
    test:assertEquals([ 8, 7, 6 ], sut.Row(4));
}

@test:Config {
    enable: false
}
function extractColumnFromOneNumberMatrix() {
    var sut = new Matrix("1");
    test:assertEquals([ 1 ], sut.Column(1));
}

@test:Config {
    enable: false
}
function canExtractColumn() {
    var sut = new Matrix("1 2 3\n4 5 6\n7 8 9");
    test:assertEquals([ 3, 6, 9 ], sut.Column(3));
}

@test:Config {
    enable: false
}
function canExtractColumnFromNonSquareMatrixWithNoCorrespondingRow() {
    var sut = new Matrix("1 2 3 4\n5 6 7 8\n9 8 7 6");
    test:assertEquals([ 4, 8, 6 ], sut.Column(4));
}

@test:Config {
    enable: false
}
function extractColumnWhereNumbersHaveDifferentWidths() {
    var sut = new Matrix("89 1903 3\n18 3 1\n9 4 800");
    test:assertEquals([ 1903, 3, 4 ], sut.Column(2));
}
