import ballerina/test;

@test:Config
function test1() {
    // Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one
    TwoBucketResult result = measure(
        bucketOne = 3,
        bucketTwo = 5,
        goal = 1,
        startBucket = "one"
    );
    TwoBucketSolution expected = {moves: 4, goalBucket: "one", otherBucket: 5};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test2() {
    // Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two
    TwoBucketResult result = measure(
        bucketOne = 3,
        bucketTwo = 5,
        goal = 1,
        startBucket = "two"
    );
    TwoBucketSolution expected = {moves: 8, goalBucket: "two", otherBucket: 3};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test3() {
    // Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one
    TwoBucketResult result = measure(
        bucketOne = 7,
        bucketTwo = 11,
        goal = 2,
        startBucket = "one"
    );
    TwoBucketSolution expected = {moves: 14, goalBucket: "one", otherBucket: 11};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test4() {
    // Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two
    TwoBucketResult result = measure(
        bucketOne = 7,
        bucketTwo = 11,
        goal = 2,
        startBucket = "two"
    );
    TwoBucketSolution expected = {moves: 18, goalBucket: "two", otherBucket: 7};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test5() {
    // Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two
    TwoBucketResult result = measure(
        bucketOne = 1,
        bucketTwo = 3,
        goal = 3,
        startBucket = "two"
    );
    TwoBucketSolution expected = {moves: 1, goalBucket: "two", otherBucket: 0};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test6() {
    // Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two
    TwoBucketResult result = measure(
        bucketOne = 2,
        bucketTwo = 3,
        goal = 3,
        startBucket = "one"
    );
    TwoBucketSolution expected = {moves: 2, goalBucket: "two", otherBucket: 2};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test7() {
    // Not possible to reach the goal
    TwoBucketResult result = measure(
        bucketOne = 6,
        bucketTwo = 15,
        goal = 5,
        startBucket = "one"
    );

    if result is error {
        test:assertEquals(result.message(), "goal is impossible");
    } else {
        test:assertFail("should have been an error");
    }
}

@test:Config {
    enable: false
}
function test8() {
    // With the same buckets but a different goal, then it is possible
    TwoBucketResult result = measure(
        bucketOne = 6,
        bucketTwo = 15,
        goal = 9,
        startBucket = "one"
    );
    TwoBucketSolution expected = {moves: 10, goalBucket: "two", otherBucket: 0};
    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function test9() {
    // Goal larger than both buckets is impossible
    TwoBucketResult result = measure(
        bucketOne = 5,
        bucketTwo = 7,
        goal = 8,
        startBucket = "one"
    );

    if result is error {
        test:assertEquals(result.message(), "goal is impossible");
    } else {
        test:assertFail("should have been an error");
    }
}
