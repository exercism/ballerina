import ballerina/test;

@test:Config {
    enable: false
}
function missedTarget() {
    test:assertEquals(0, Darts.Score(-9, 9));
}

@test:Config {
    enable: false
}
function onTheOuterCircle() {
    test:assertEquals(1, Darts.Score(0, 10));
}

@test:Config {
    enable: false
}
function onTheMiddleCircle() {
    test:assertEquals(5, Darts.Score(-5, 0));
}

@test:Config {
    enable: false
}
function onTheInnerCircle() {
    test:assertEquals(10, Darts.Score(0, -1));
}

@test:Config {
    enable: false
}
function exactlyOnCentre() {
    test:assertEquals(10, Darts.Score(0, 0));
}

@test:Config {
    enable: false
}
function nearTheCentre() {
    test:assertEquals(10, Darts.Score(-0.1, -0.1));
}

@test:Config {
    enable: false
}
function justWithinTheInnerCircle() {
    test:assertEquals(10, Darts.Score(0.7, 0.7));
}

@test:Config {
    enable: false
}
function justOutsideTheInnerCircle() {
    test:assertEquals(5, Darts.Score(0.8, -0.8));
}

@test:Config {
    enable: false
}
function justWithinTheMiddleCircle() {
    test:assertEquals(5, Darts.Score(-3.5, 3.5));
}

@test:Config {
    enable: false
}
function justOutsideTheMiddleCircle() {
    test:assertEquals(1, Darts.Score(-3.6, -3.6));
}

@test:Config {
    enable: false
}
function justWithinTheOuterCircle() {
    test:assertEquals(1, Darts.Score(-7, 7));
}

@test:Config {
    enable: false
}
function justOutsideTheOuterCircle() {
    test:assertEquals(0, Darts.Score(7.1, -7.1));
}

@test:Config {
    enable: false
}
function asymmetricPositionBetweenTheInnerAndMiddleCircles() {
    test:assertEquals(5, Darts.Score(0.5, -4));
}
