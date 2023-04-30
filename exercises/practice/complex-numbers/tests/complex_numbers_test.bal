import ballerina/test;

@test:Config {
    enable: false
}
function realPartOfAPurelyRealNumber() {
    var sut = new ComplexNumber(1, 0);
    test:assertEquals(1, sut.Real());
}

@test:Config {
    enable: false
}
function realPartOfAPurelyImaginaryNumber() {
    var sut = new ComplexNumber(0, 1);
    test:assertEquals(0, sut.Real());
}

@test:Config {
    enable: false
}
function realPartOfANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    test:assertEquals(1, sut.Real());
}

@test:Config {
    enable: false
}
function imaginaryPartOfAPurelyRealNumber() {
    var sut = new ComplexNumber(1, 0);
    test:assertEquals(0, sut.Imaginary());
}

@test:Config {
    enable: false
}
function imaginaryPartOfAPurelyImaginaryNumber() {
    var sut = new ComplexNumber(0, 1);
    test:assertEquals(1, sut.Imaginary());
}

@test:Config {
    enable: false
}
function imaginaryPartOfANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    test:assertEquals(2, sut.Imaginary());
}

@test:Config {
    enable: false
}
function imaginaryUnit() {
    var sut = new ComplexNumber(0, 1);
    var expected = new ComplexNumber(-1, 0);
    test:assertEquals(expected.Real(), sut.Mul(new ComplexNumber(0, 1)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Mul(new ComplexNumber(0, 1)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function addPurelyRealNumbers() {
    var sut = new ComplexNumber(1, 0);
    var expected = new ComplexNumber(3, 0);
    test:assertEquals(expected.Real(), sut.Add(new ComplexNumber(2, 0)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Add(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function addPurelyImaginaryNumbers() {
    var sut = new ComplexNumber(0, 1);
    var expected = new ComplexNumber(0, 3);
    test:assertEquals(expected.Real(), sut.Add(new ComplexNumber(0, 2)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Add(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function addNumbersWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    var expected = new ComplexNumber(4, 6);
    test:assertEquals(expected.Real(), sut.Add(new ComplexNumber(3, 4)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Add(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function subtractPurelyRealNumbers() {
    var sut = new ComplexNumber(1, 0);
    var expected = new ComplexNumber(-1, 0);
    test:assertEquals(expected.Real(), sut.Sub(new ComplexNumber(2, 0)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Sub(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function subtractPurelyImaginaryNumbers() {
    var sut = new ComplexNumber(0, 1);
    var expected = new ComplexNumber(0, -1);
    test:assertEquals(expected.Real(), sut.Sub(new ComplexNumber(0, 2)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Sub(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function subtractNumbersWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    var expected = new ComplexNumber(-2, -2);
    test:assertEquals(expected.Real(), sut.Sub(new ComplexNumber(3, 4)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Sub(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function multiplyPurelyRealNumbers() {
    var sut = new ComplexNumber(1, 0);
    var expected = new ComplexNumber(2, 0);
    test:assertEquals(expected.Real(), sut.Mul(new ComplexNumber(2, 0)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Mul(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function multiplyPurelyImaginaryNumbers() {
    var sut = new ComplexNumber(0, 1);
    var expected = new ComplexNumber(-2, 0);
    test:assertEquals(expected.Real(), sut.Mul(new ComplexNumber(0, 2)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Mul(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function multiplyNumbersWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    var expected = new ComplexNumber(-5, 10);
    test:assertEquals(expected.Real(), sut.Mul(new ComplexNumber(3, 4)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Mul(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function dividePurelyRealNumbers() {
    var sut = new ComplexNumber(1, 0);
    var expected = new ComplexNumber(0.5, 0);
    test:assertEquals(expected.Real(), sut.Div(new ComplexNumber(2, 0)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Div(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function dividePurelyImaginaryNumbers() {
    var sut = new ComplexNumber(0, 1);
    var expected = new ComplexNumber(0.5, 0);
    test:assertEquals(expected.Real(), sut.Div(new ComplexNumber(0, 2)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Div(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function divideNumbersWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 2);
    var expected = new ComplexNumber(0.44, 0.08);
    test:assertEquals(expected.Real(), sut.Div(new ComplexNumber(3, 4)).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Div(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function absoluteValueOfAPositivePurelyRealNumber() {
    var sut = new ComplexNumber(5, 0);
    test:assertEquals(5, sut.Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfANegativePurelyRealNumber() {
    var sut = new ComplexNumber(-5, 0);
    test:assertEquals(5, sut.Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfAPurelyImaginaryNumberWithPositiveImaginaryPart() {
    var sut = new ComplexNumber(0, 5);
    test:assertEquals(5, sut.Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfAPurelyImaginaryNumberWithNegativeImaginaryPart() {
    var sut = new ComplexNumber(0, -5);
    test:assertEquals(5, sut.Abs());
}

@test:Config {
    enable: false
}
function absoluteValueOfANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(3, 4);
    test:assertEquals(5, sut.Abs());
}

@test:Config {
    enable: false
}
function conjugateAPurelyRealNumber() {
    var sut = new ComplexNumber(5, 0);
    var expected = new ComplexNumber(5, 0);
    test:assertEquals(expected.Real(), sut.Conjugate().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function conjugateAPurelyImaginaryNumber() {
    var sut = new ComplexNumber(0, 5);
    var expected = new ComplexNumber(0, -5);
    test:assertEquals(expected.Real(), sut.Conjugate().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function conjugateANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(1, 1);
    var expected = new ComplexNumber(1, -1);
    test:assertEquals(expected.Real(), sut.Conjugate().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function eulersIdentityFormula() {
    var sut = new ComplexNumber(0, Math.PI);
    var expected = new ComplexNumber(-1, 0);
    test:assertEquals(expected.Real(), sut.Exp().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function exponentialOf_0() {
    var sut = new ComplexNumber(0, 0);
    var expected = new ComplexNumber(1, 0);
    test:assertEquals(expected.Real(), sut.Exp().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function exponentialOfAPurelyRealNumber() {
    var sut = new ComplexNumber(1, 0);
    var expected = new ComplexNumber(Math.E, 0);
    test:assertEquals(expected.Real(), sut.Exp().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function exponentialOfANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(Math.Log(2.0), Math.PI);
    var expected = new ComplexNumber(-2, 0);
    test:assertEquals(expected.Real(), sut.Exp().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function exponentialResultingInANumberWithRealAndImaginaryPart() {
    var sut = new ComplexNumber(Math.Log(2.0)/2, Math.PI/4);
    var expected = new ComplexNumber(1, 1);
    test:assertEquals(expected.Real(), sut.Exp().Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function addRealNumberToComplexNumber() {
    var sut = new ComplexNumber(1, 2);
    var expected = new ComplexNumber(6, 2);
    test:assertEquals(expected.Real(), sut.Add(5).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Add(5).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function multiplyComplexNumberByRealNumber() {
    var sut = new ComplexNumber(2, 5);
    var expected = new ComplexNumber(10, 25);
    test:assertEquals(expected.Real(), sut.Mul(5).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Mul(5).Imaginary(), precision: 7);
}

@test:Config {
    enable: false
}
function divideComplexNumberByRealNumber() {
    var sut = new ComplexNumber(10, 100);
    var expected = new ComplexNumber(1, 10);
    test:assertEquals(expected.Real(), sut.Div(10).Real(), precision: 7);
    test:assertEquals(expected.Imaginary(), sut.Div(10).Imaginary(), precision: 7);
}
