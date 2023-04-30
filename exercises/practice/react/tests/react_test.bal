import ballerina/test;

@test:Config {
    enable: false
}
function inputCellsHaveAValue() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(10);
    test:assertEquals(10, input.Value);
}

@test:Config {
    enable: false
}
function anInputCellsValueCanBeSet() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(4);
    input.Value = 20;
    test:assertEquals(20, input.Value);
}

@test:Config {
    enable: false
}
function computeCellsCalculateInitialValue() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    test:assertEquals(2, output.Value);
}

@test:Config {
    enable: false
}
function computeCellsTakeInputsInTheRightOrder() {
    var sut = new Reactor();
    var one = sut.CreateInputCell(1);
    var two = sut.CreateInputCell(2);
    var output = sut.CreateComputeCell([ one, two ], inputs => inputs[0] + inputs[1] * 10);
    test:assertEquals(21, output.Value);
}

@test:Config {
    enable: false
}
function computeCellsUpdateValueWhenDependenciesAreChanged() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    input.Value = 3;
    test:assertEquals(4, output.Value);
}

@test:Config {
    enable: false
}
function computeCellsCanDependOnOtherComputeCells() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var timesTwo = sut.CreateComputeCell([ input ], inputs => inputs[0] * 2);
    var timesThirty = sut.CreateComputeCell([ input ], inputs => inputs[0] * 30);
    var output = sut.CreateComputeCell([ timesTwo, timesThirty ], inputs => inputs[0] + inputs[1]);
    test:assertEquals(32, output.Value);
    input.Value = 3;
    test:assertEquals(96, output.Value);
}

@test:Config {
    enable: false
}
function computeCellsFireCallbacks() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    input.Value = 3;
    A.CallTo(() => callback1.Invoke(A<object>._, 4)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
}

@test:Config {
    enable: false
}
function callbackCellsOnlyFireOnChange() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] < 3 ? 111 : 222);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    input.Value = 2;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
    input.Value = 4;
    A.CallTo(() => callback1.Invoke(A<object>._, 222)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
}

@test:Config {
    enable: false
}
function callbacksDoNotReportAlreadyReportedValues() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    input.Value = 2;
    A.CallTo(() => callback1.Invoke(A<object>._, 3)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
    input.Value = 3;
    A.CallTo(() => callback1.Invoke(A<object>._, 4)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
}

@test:Config {
    enable: false
}
function callbacksCanFireFromMultipleCells() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var plusOne = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var minusOne = sut.CreateComputeCell([ input ], inputs => inputs[0] - 1);
    var callback1 = A.Fake<EventHandler<int>>();
    plusOne.Changed += callback1;
    var callback2 = A.Fake<EventHandler<int>>();
    minusOne.Changed += callback2;
    input.Value = 10;
    A.CallTo(() => callback1.Invoke(A<object>._, 11)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
    A.CallTo(() => callback2.Invoke(A<object>._, 9)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback2);
}

@test:Config {
    enable: false
}
function callbacksCanBeAddedAndRemoved() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(11);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    var callback2 = A.Fake<EventHandler<int>>();
    output.Changed += callback2;
    input.Value = 31;
    A.CallTo(() => callback1.Invoke(A<object>._, 32)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
    A.CallTo(() => callback2.Invoke(A<object>._, 32)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback2);
    output.Changed -= callback1;
    var callback3 = A.Fake<EventHandler<int>>();
    output.Changed += callback3;
    input.Value = 41;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
}

@test:Config {
    enable: false
}
function removingACallbackMultipleTimesDoesntInterfereWithOtherCallbacks() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var output = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    var callback2 = A.Fake<EventHandler<int>>();
    output.Changed += callback2;
    output.Changed -= callback1;
    output.Changed -= callback1;
    output.Changed -= callback1;
    input.Value = 2;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
}

@test:Config {
    enable: false
}
function callbacksShouldOnlyBeCalledOnceEvenIfMultipleDependenciesChange() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var plusOne = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var minusOne1 = sut.CreateComputeCell([ input ], inputs => inputs[0] - 1);
    var minusOne2 = sut.CreateComputeCell([ minusOne1 ], inputs => inputs[0] - 1);
    var output = sut.CreateComputeCell([ plusOne, minusOne2 ], inputs => inputs[0] * inputs[1]);
    var callback1 = A.Fake<EventHandler<int>>();
    output.Changed += callback1;
    input.Value = 4;
    A.CallTo(() => callback1.Invoke(A<object>._, 10)).MustHaveHappenedOnceExactly();
    Fake.ClearRecordedCalls(callback1);
}

@test:Config {
    enable: false
}
function callbacksShouldNotBeCalledIfDependenciesChangeButOutputValueDoesntChange() {
    var sut = new Reactor();
    var input = sut.CreateInputCell(1);
    var plusOne = sut.CreateComputeCell([ input ], inputs => inputs[0] + 1);
    var minusOne = sut.CreateComputeCell([ input ], inputs => inputs[0] - 1);
    var alwaysTwo = sut.CreateComputeCell([ plusOne, minusOne ], inputs => inputs[0] - inputs[1]);
    var callback1 = A.Fake<EventHandler<int>>();
    alwaysTwo.Changed += callback1;
    input.Value = 2;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
    input.Value = 3;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
    input.Value = 4;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
    input.Value = 5;
    A.CallTo(() => callback1.Invoke(A<object>._, A<int>._)).MustNotHaveHappened();
}
