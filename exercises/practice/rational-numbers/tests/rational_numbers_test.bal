import ballerina/test;

@test:Config {
    enable: false
}
function addTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(7, 6), new RationalNumber(1, 2) + (new RationalNumber(2, 3)));
}

@test:Config {
    enable: false
}
function addAPositiveRationalNumberAndANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(-1, 6), new RationalNumber(1, 2) + (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function addTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(-7, 6), new RationalNumber(-1, 2) + (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function addARationalNumberToItsAdditiveInverse() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) + (new RationalNumber(-1, 2)));
}

@test:Config {
    enable: false
}
function subtractTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(-1, 6), new RationalNumber(1, 2) - (new RationalNumber(2, 3)));
}

@test:Config {
    enable: false
}
function subtractAPositiveRationalNumberAndANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(7, 6), new RationalNumber(1, 2) - (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function subtractTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 6), new RationalNumber(-1, 2) - (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function subtractARationalNumberFromItself() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) - (new RationalNumber(1, 2)));
}

@test:Config {
    enable: false
}
function multiplyTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 3), new RationalNumber(1, 2) * (new RationalNumber(2, 3)));
}

@test:Config {
    enable: false
}
function multiplyANegativeRationalNumberByAPositiveRationalNumber() {
    test:assertEquals(new RationalNumber(-1, 3), new RationalNumber(-1, 2) * (new RationalNumber(2, 3)));
}

@test:Config {
    enable: false
}
function multiplyTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 3), new RationalNumber(-1, 2) * (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function multiplyARationalNumberByItsReciprocal() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 2) * (new RationalNumber(2, 1)));
}

@test:Config {
    enable: false
}
function multiplyARationalNumberBy_1() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2) * (new RationalNumber(1, 1)));
}

@test:Config {
    enable: false
}
function multiplyARationalNumberBy_0() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) * (new RationalNumber(0, 1)));
}

@test:Config {
    enable: false
}
function divideTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(3, 4), new RationalNumber(1, 2) / (new RationalNumber(2, 3)));
}

@test:Config {
    enable: false
}
function divideAPositiveRationalNumberByANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(-3, 4), new RationalNumber(1, 2) / (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function divideTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(3, 4), new RationalNumber(-1, 2) / (new RationalNumber(-2, 3)));
}

@test:Config {
    enable: false
}
function divideARationalNumberBy_1() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2) / (new RationalNumber(1, 1)));
}

@test:Config {
    enable: false
}
function absoluteValueOfAPositiveRationalNumber() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2).Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfAPositiveRationalNumberWithNegativeNumeratorAndDenominator() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(-1, -2).Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(-1, 2).Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfANegativeRationalNumberWithNegativeDenominator() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, -2).Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfZero() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 1).Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfARationalNumberIsReducedToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(2, 4).Abs());
}

@test:Config {
    enable: false
}
function raiseAPositiveRationalNumberToAPositiveIntegerPower() {
    test:assertEquals(new RationalNumber(1, 8), new RationalNumber(1, 2).Exprational(3));
}

@test:Config {
    enable: false
}
function raiseANegativeRationalNumberToAPositiveIntegerPower() {
    test:assertEquals(new RationalNumber(-1, 8), new RationalNumber(-1, 2).Exprational(3));
}

@test:Config {
    enable: false
}
function raiseAPositiveRationalNumberToANegativeIntegerPower() {
    test:assertEquals(new RationalNumber(25, 9), new RationalNumber(3, 5).Exprational(-2));
}

@test:Config {
    enable: false
}
function raiseANegativeRationalNumberToAnEvenNegativeIntegerPower() {
    test:assertEquals(new RationalNumber(25, 9), new RationalNumber(-3, 5).Exprational(-2));
}

@test:Config {
    enable: false
}
function raiseANegativeRationalNumberToAnOddNegativeIntegerPower() {
    test:assertEquals(new RationalNumber(-125, 27), new RationalNumber(-3, 5).Exprational(-3));
}

@test:Config {
    enable: false
}
function raiseZeroToAnIntegerPower() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 1).Exprational(5));
}

@test:Config {
    enable: false
}
function raiseOneToAnIntegerPower() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 1).Exprational(4));
}

@test:Config {
    enable: false
}
function raiseAPositiveRationalNumberToThePowerOfZero() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 2).Exprational(0));
}

@test:Config {
    enable: false
}
function raiseANegativeRationalNumberToThePowerOfZero() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(-1, 2).Exprational(0));
}

@test:Config {
    enable: false
}
function raiseARealNumberToAPositiveRationalNumber() {
    test:assertEquals(16, 8.Expreal(new RationalNumber(4, 3)), precision: 7);
}

@test:Config {
    enable: false
}
function raiseARealNumberToANegativeRationalNumber() {
    test:assertEquals(0.33333334, 9.Expreal(new RationalNumber(-1, 2)), precision: 7);
}

@test:Config {
    enable: false
}
function raiseARealNumberToAZeroRationalNumber() {
    test:assertEquals(1, 2.Expreal(new RationalNumber(0, 1)), precision: 7);
}

@test:Config {
    enable: false
}
function reduceAPositiveRationalNumberToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(2, 4).Reduce());
}

@test:Config {
    enable: false
}
function reducePlacesTheMinusSignOnTheNumerator() {
    test:assertEquals(new RationalNumber(-3, 4), new RationalNumber(3, -4).Reduce());
}

@test:Config {
    enable: false
}
function reduceANegativeRationalNumberToLowestTerms() {
    test:assertEquals(new RationalNumber(-2, 3), new RationalNumber(-4, 6).Reduce());
}

@test:Config {
    enable: false
}
function reduceARationalNumberWithANegativeDenominatorToLowestTerms() {
    test:assertEquals(new RationalNumber(-1, 3), new RationalNumber(3, -9).Reduce());
}

@test:Config {
    enable: false
}
function reduceZeroToLowestTerms() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 6).Reduce());
}

@test:Config {
    enable: false
}
function reduceAnIntegerToLowestTerms() {
    test:assertEquals(new RationalNumber(-2, 1), new RationalNumber(-14, 7).Reduce());
}

@test:Config {
    enable: false
}
function reduceOneToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(13, 13).Reduce());
}
