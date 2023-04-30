import ballerina/test;

@test:Config {
    enable: false
}
function dateOnlySpecificationOfTime() {
    test:assertEquals(new DateTime(2043, 1, 1, 1, 46, 40), Gigasecond.Add(new DateTime(2011, 4, 25)));
}

@test:Config {
    enable: false
}
function secondTestForDateOnlySpecificationOfTime() {
    test:assertEquals(new DateTime(2009, 2, 19, 1, 46, 40), Gigasecond.Add(new DateTime(1977, 6, 13)));
}

@test:Config {
    enable: false
}
function thirdTestForDateOnlySpecificationOfTime() {
    test:assertEquals(new DateTime(1991, 3, 27, 1, 46, 40), Gigasecond.Add(new DateTime(1959, 7, 19)));
}

@test:Config {
    enable: false
}
function fullTimeSpecified() {
    test:assertEquals(new DateTime(2046, 10, 2, 23, 46, 40), Gigasecond.Add(new DateTime(2015, 1, 24, 22, 0, 0)));
}

@test:Config {
    enable: false
}
function fullTimeWithDayRollOver() {
    test:assertEquals(new DateTime(2046, 10, 3, 1, 46, 39), Gigasecond.Add(new DateTime(2015, 1, 24, 23, 59, 59)));
}
