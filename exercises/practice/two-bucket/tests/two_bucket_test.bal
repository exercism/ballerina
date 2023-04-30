import ballerina/test;

@test:Config {
    enable: false
}
function measureUsingBucketOneOfSize_3AndBucketTwoOfSize_5StartWithBucketOne() {
    var sut = new TwoBucket(3, 5, Bucket.One);
    var actual = sut.Measure(1);
    test:assertEquals(4, actual.Moves);
    test:assertEquals(5, actual.OtherBucket);
    test:assertEquals(Bucket.One, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function measureUsingBucketOneOfSize_3AndBucketTwoOfSize_5StartWithBucketTwo() {
    var sut = new TwoBucket(3, 5, Bucket.Two);
    var actual = sut.Measure(1);
    test:assertEquals(8, actual.Moves);
    test:assertEquals(3, actual.OtherBucket);
    test:assertEquals(Bucket.Two, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function measureUsingBucketOneOfSize_7AndBucketTwoOfSize_11StartWithBucketOne() {
    var sut = new TwoBucket(7, 11, Bucket.One);
    var actual = sut.Measure(2);
    test:assertEquals(14, actual.Moves);
    test:assertEquals(11, actual.OtherBucket);
    test:assertEquals(Bucket.One, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function measureUsingBucketOneOfSize_7AndBucketTwoOfSize_11StartWithBucketTwo() {
    var sut = new TwoBucket(7, 11, Bucket.Two);
    var actual = sut.Measure(2);
    test:assertEquals(18, actual.Moves);
    test:assertEquals(7, actual.OtherBucket);
    test:assertEquals(Bucket.Two, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function measureOneStepUsingBucketOneOfSize_1AndBucketTwoOfSize_3StartWithBucketTwo() {
    var sut = new TwoBucket(1, 3, Bucket.Two);
    var actual = sut.Measure(3);
    test:assertEquals(1, actual.Moves);
    test:assertEquals(0, actual.OtherBucket);
    test:assertEquals(Bucket.Two, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function measureUsingBucketOneOfSize_2AndBucketTwoOfSize_3StartWithBucketOneAndEndWithBucketTwo() {
    var sut = new TwoBucket(2, 3, Bucket.One);
    var actual = sut.Measure(3);
    test:assertEquals(2, actual.Moves);
    test:assertEquals(2, actual.OtherBucket);
    test:assertEquals(Bucket.Two, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function notPossibleToReachTheGoal() {
    var sut = new TwoBucket(6, 15, Bucket.One);
    Assert.Throws<ArgumentException>(() => sut.Measure(5));
}

@test:Config {
    enable: false
}
function withTheSameBucketsButADifferentGoalThenItIsPossible() {
    var sut = new TwoBucket(6, 15, Bucket.One);
    var actual = sut.Measure(9);
    test:assertEquals(10, actual.Moves);
    test:assertEquals(0, actual.OtherBucket);
    test:assertEquals(Bucket.Two, actual.GoalBucket);
}

@test:Config {
    enable: false
}
function goalLargerThanBothBucketsIsImpossible() {
    var sut = new TwoBucket(5, 7, Bucket.One);
    Assert.Throws<ArgumentException>(() => sut.Measure(8));
}
