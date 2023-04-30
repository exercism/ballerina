import ballerina/test;

@test:Config {
    enable: false
}
function readingEmptyBufferShouldFail() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config {
    enable: false
}
function canReadAnItemJustWritten() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
}

@test:Config {
    enable: false
}
function eachItemMayOnlyBeReadOnce() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config {
    enable: false
}
function itemsAreReadInTheOrderTheyAreWritten() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Write(2);
    test:assertEquals(1, buffer.Read());
    test:assertEquals(2, buffer.Read());
}

@test:Config {
    enable: false
}
function fullBufferCantBeWrittenTo() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    Assert.Throws<InvalidOperationException>(() => buffer.Write(2));
}

@test:Config {
    enable: false
}
function aReadFreesUpCapacityForAnotherWrite() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
    buffer.Write(2);
    test:assertEquals(2, buffer.Read());
}

@test:Config {
    enable: false
}
function readPositionIsMaintainedEvenAcrossMultipleWrites() {
    var buffer = new CircularBuffer<int>(capacity: 3);
    buffer.Write(1);
    buffer.Write(2);
    test:assertEquals(1, buffer.Read());
    buffer.Write(3);
    test:assertEquals(2, buffer.Read());
    test:assertEquals(3, buffer.Read());
}

@test:Config {
    enable: false
}
function itemsClearedOutOfBufferCantBeRead() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    buffer.Clear();
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config {
    enable: false
}
function clearFreesUpCapacityForAnotherWrite() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    buffer.Clear();
    buffer.Write(2);
    test:assertEquals(2, buffer.Read());
}

@test:Config {
    enable: false
}
function clearDoesNothingOnEmptyBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Clear();
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
}

@test:Config {
    enable: false
}
function overwriteActsLikeWriteOnNonFullBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Overwrite(2);
    test:assertEquals(1, buffer.Read());
    test:assertEquals(2, buffer.Read());
}

@test:Config {
    enable: false
}
function overwriteReplacesTheOldestItemOnFullBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Write(2);
    buffer.Overwrite(3);
    test:assertEquals(2, buffer.Read());
    test:assertEquals(3, buffer.Read());
}

@test:Config {
    enable: false
}
function overwriteReplacesTheOldestItemRemainingInBufferFollowingARead() {
    var buffer = new CircularBuffer<int>(capacity: 3);
    buffer.Write(1);
    buffer.Write(2);
    buffer.Write(3);
    test:assertEquals(1, buffer.Read());
    buffer.Write(4);
    buffer.Overwrite(5);
    test:assertEquals(3, buffer.Read());
    test:assertEquals(4, buffer.Read());
    test:assertEquals(5, buffer.Read());
}

@test:Config {
    enable: false
}
function initialClearDoesNotAffectWrappingAround() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Clear();
    buffer.Write(1);
    buffer.Write(2);
    buffer.Overwrite(3);
    buffer.Overwrite(4);
    test:assertEquals(3, buffer.Read());
    test:assertEquals(4, buffer.Read());
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}
