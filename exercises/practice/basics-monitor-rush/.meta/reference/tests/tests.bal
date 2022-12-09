import ballerina/test;

@test:Config {
    dataProvider: data
}
function allocateCubiclesTest(int[] input, int[] expected) returns error? {
    test:assertEquals(allocateCubicles(input), expected);
}
