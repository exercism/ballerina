import ballerina/test;

@test:Config {
    enable: false
}
function equilateralTriangleAllSidesAreEqual() {
    test:assertTrue(Triangle.IsEquilateral(2, 2, 2));
}

@test:Config {
    enable: false
}
function equilateralTriangleAnySideIsUnequal() {
    test:assertFalse(Triangle.IsEquilateral(2, 3, 2));
}

@test:Config {
    enable: false
}
function equilateralTriangleNoSidesAreEqual() {
    test:assertFalse(Triangle.IsEquilateral(5, 4, 6));
}

@test:Config {
    enable: false
}
function equilateralTriangleAllZeroSidesIsNotATriangle() {
    test:assertFalse(Triangle.IsEquilateral(0, 0, 0));
}

@test:Config {
    enable: false
}
function equilateralTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsEquilateral(0.5, 0.5, 0.5));
}

@test:Config {
    enable: false
}
function isoscelesTriangleLastTwoSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(3, 4, 4));
}

@test:Config {
    enable: false
}
function isoscelesTriangleFirstTwoSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(4, 4, 3));
}

@test:Config {
    enable: false
}
function isoscelesTriangleFirstAndLastSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(4, 3, 4));
}

@test:Config {
    enable: false
}
function isoscelesTriangleEquilateralTrianglesAreAlsoIsosceles() {
    test:assertTrue(Triangle.IsIsosceles(4, 4, 4));
}

@test:Config {
    enable: false
}
function isoscelesTriangleNoSidesAreEqual() {
    test:assertFalse(Triangle.IsIsosceles(2, 3, 4));
}

@test:Config {
    enable: false
}
function isoscelesTriangleFirstTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(1, 1, 3));
}

@test:Config {
    enable: false
}
function isoscelesTriangleSecondTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(1, 3, 1));
}

@test:Config {
    enable: false
}
function isoscelesTriangleThirdTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(3, 1, 1));
}

@test:Config {
    enable: false
}
function isoscelesTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsIsosceles(0.5, 0.4, 0.5));
}

@test:Config {
    enable: false
}
function scaleneTriangleNoSidesAreEqual() {
    test:assertTrue(Triangle.IsScalene(5, 4, 6));
}

@test:Config {
    enable: false
}
function scaleneTriangleAllSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 4, 4));
}

@test:Config {
    enable: false
}
function scaleneTriangleFirstAndSecondSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 4, 3));
}

@test:Config {
    enable: false
}
function scaleneTriangleFirstAndThirdSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(3, 4, 3));
}

@test:Config {
    enable: false
}
function scaleneTriangleSecondAndThirdSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 3, 3));
}

@test:Config {
    enable: false
}
function scaleneTriangleMayNotViolateTriangleInequality() {
    test:assertFalse(Triangle.IsScalene(7, 3, 2));
}

@test:Config {
    enable: false
}
function scaleneTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsScalene(0.5, 0.4, 0.6));
}
