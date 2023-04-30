import ballerina/test;

@test:Config {
    enable: false
}
function testingForEggsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config {
    enable: false
}
function testingForEggsAllergyAllergicOnlyToEggs() {
    var sut = new Allergies(1);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config {
    enable: false
}
function testingForEggsAllergyAllergicToEggsAndSomethingElse() {
    var sut = new Allergies(3);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config {
    enable: false
}
function testingForEggsAllergyAllergicToSomethingButNotEggs() {
    var sut = new Allergies(2);
    test:assertFalse(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config {
    enable: false
}
function testingForEggsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config {
    enable: false
}
function testingForPeanutsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config {
    enable: false
}
function testingForPeanutsAllergyAllergicOnlyToPeanuts() {
    var sut = new Allergies(2);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config {
    enable: false
}
function testingForPeanutsAllergyAllergicToPeanutsAndSomethingElse() {
    var sut = new Allergies(7);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config {
    enable: false
}
function testingForPeanutsAllergyAllergicToSomethingButNotPeanuts() {
    var sut = new Allergies(5);
    test:assertFalse(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config {
    enable: false
}
function testingForPeanutsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config {
    enable: false
}
function testingForShellfishAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config {
    enable: false
}
function testingForShellfishAllergyAllergicOnlyToShellfish() {
    var sut = new Allergies(4);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config {
    enable: false
}
function testingForShellfishAllergyAllergicToShellfishAndSomethingElse() {
    var sut = new Allergies(14);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config {
    enable: false
}
function testingForShellfishAllergyAllergicToSomethingButNotShellfish() {
    var sut = new Allergies(10);
    test:assertFalse(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config {
    enable: false
}
function testingForShellfishAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config {
    enable: false
}
function testingForStrawberriesAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config {
    enable: false
}
function testingForStrawberriesAllergyAllergicOnlyToStrawberries() {
    var sut = new Allergies(8);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config {
    enable: false
}
function testingForStrawberriesAllergyAllergicToStrawberriesAndSomethingElse() {
    var sut = new Allergies(28);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config {
    enable: false
}
function testingForStrawberriesAllergyAllergicToSomethingButNotStrawberries() {
    var sut = new Allergies(20);
    test:assertFalse(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config {
    enable: false
}
function testingForStrawberriesAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config {
    enable: false
}
function testingForTomatoesAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config {
    enable: false
}
function testingForTomatoesAllergyAllergicOnlyToTomatoes() {
    var sut = new Allergies(16);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config {
    enable: false
}
function testingForTomatoesAllergyAllergicToTomatoesAndSomethingElse() {
    var sut = new Allergies(56);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config {
    enable: false
}
function testingForTomatoesAllergyAllergicToSomethingButNotTomatoes() {
    var sut = new Allergies(40);
    test:assertFalse(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config {
    enable: false
}
function testingForTomatoesAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config {
    enable: false
}
function testingForChocolateAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config {
    enable: false
}
function testingForChocolateAllergyAllergicOnlyToChocolate() {
    var sut = new Allergies(32);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config {
    enable: false
}
function testingForChocolateAllergyAllergicToChocolateAndSomethingElse() {
    var sut = new Allergies(112);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config {
    enable: false
}
function testingForChocolateAllergyAllergicToSomethingButNotChocolate() {
    var sut = new Allergies(80);
    test:assertFalse(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config {
    enable: false
}
function testingForChocolateAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config {
    enable: false
}
function testingForPollenAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config {
    enable: false
}
function testingForPollenAllergyAllergicOnlyToPollen() {
    var sut = new Allergies(64);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config {
    enable: false
}
function testingForPollenAllergyAllergicToPollenAndSomethingElse() {
    var sut = new Allergies(224);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config {
    enable: false
}
function testingForPollenAllergyAllergicToSomethingButNotPollen() {
    var sut = new Allergies(160);
    test:assertFalse(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config {
    enable: false
}
function testingForPollenAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config {
    enable: false
}
function testingForCatsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config {
    enable: false
}
function testingForCatsAllergyAllergicOnlyToCats() {
    var sut = new Allergies(128);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config {
    enable: false
}
function testingForCatsAllergyAllergicToCatsAndSomethingElse() {
    var sut = new Allergies(192);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config {
    enable: false
}
function testingForCatsAllergyAllergicToSomethingButNotCats() {
    var sut = new Allergies(64);
    test:assertFalse(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config {
    enable: false
}
function testingForCatsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config {
    enable: false
}
function noAllergies() {
    var sut = new Allergies(0);
    Assert.Empty(sut.List());
}

@test:Config {
    enable: false
}
function justEggs() {
    var sut = new Allergies(1);
    var expected = [ Allergen.Eggs ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function justPeanuts() {
    var sut = new Allergies(2);
    var expected = [ Allergen.Peanuts ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function justStrawberries() {
    var sut = new Allergies(8);
    var expected = [ Allergen.Strawberries ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function eggsAndPeanuts() {
    var sut = new Allergies(3);
    var expected = [ Allergen.Eggs, Allergen.Peanuts ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function moreThanEggsButNotPeanuts() {
    var sut = new Allergies(5);
    var expected = [ Allergen.Eggs, Allergen.Shellfish ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function lotsOfStuff() {
    var sut = new Allergies(248);
    var expected = [ Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function everything() {
    var sut = new Allergies(255);
    var expected = [ Allergen.Eggs, Allergen.Peanuts, Allergen.Shellfish, Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function noAllergenScoreParts() {
    var sut = new Allergies(509);
    var expected = [ Allergen.Eggs, Allergen.Shellfish, Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config {
    enable: false
}
function noAllergenScorePartsWithoutHighestValidScore() {
    var sut = new Allergies(257);
    var expected = [ Allergen.Eggs ];
    test:assertEquals(expected, sut.List());
}
