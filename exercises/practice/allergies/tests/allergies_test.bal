import ballerina/test;

@test:Config
function testNotAllergicToAnythingIncludingEggs() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToEggs() {
    Allergies allergies = new(1);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false
}
function testAllergicToEggsAndSomethingElse() {
    Allergies allergies = new(3);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesEggs() {
    Allergies allergies = new(2);
    test:assertFalse(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingEggs() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingPeanuts() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToPeanuts() {
    Allergies allergies = new(2);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false
}
function testAllergicToPeanutsAndSomethingElse() {
    Allergies allergies = new(7);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesPeanuts() {
    Allergies allergies = new(5);
    test:assertFalse(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingPeanuts() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingShellfish() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToShellfish() {
    Allergies allergies = new(4);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false
}
function testAllergicToShellfishAndSomethingElse() {
    Allergies allergies = new(14);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesShellfish() {
    Allergies allergies = new(10);
    test:assertFalse(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingShellfish() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingStrawberries() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToStrawberries() {
    Allergies allergies = new(8);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false
}
function testAllergicToStrawberriesAndSomethingElse() {
    Allergies allergies = new(28);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesStrawberries() {
    Allergies allergies = new(20);
    test:assertFalse(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingStrawberries() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingTomatoes() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToTomatoes() {
    Allergies allergies = new(16);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false
}
function testAllergicToTomatoesAndSomethingElse() {
    Allergies allergies = new(56);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesTomatoes() {
    Allergies allergies = new(40);
    test:assertFalse(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingTomatoes() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingChocolate() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToChocolate() {
    Allergies allergies = new(32);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false
}
function testAllergicToChocolateAndSomethingElse() {
    Allergies allergies = new(112);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesChocolate() {
    Allergies allergies = new(80);
    test:assertFalse(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingChocolate() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingPollen() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToPollen() {
    Allergies allergies = new(64);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false
}
function testAllergicToPollenAndSomethingElse() {
    Allergies allergies = new(224);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesPollen() {
    Allergies allergies = new(160);
    test:assertFalse(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingPollen() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false
}
function testNotAllergicToAnythingIncludingCats() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false
}
function testAllergicOnlyToCats() {
    Allergies allergies = new(128);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false
}
function testAllergicToCatsAndSomethingElse() {
    Allergies allergies = new(192);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false
}
function testAllergicToSomethingBesidesCats() {
    Allergies allergies = new(64);
    test:assertFalse(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false
}
function testAllergicToEverythingIncludingCats() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false
}
function testListWhenAlergicToNothing() {
    Allergies allergies = new(0);
    string[] expected = [];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToJustEggs() {
    Allergies allergies = new(1);
    string[] expected = ["eggs"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToJustPeanuts() {
    Allergies allergies = new(2);
    string[] expected = ["peanuts"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToJustStrawberries() {
    Allergies allergies = new(8);
    string[] expected = ["strawberries"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToEggsAndPeanuts() {
    Allergies allergies = new(3);
    string[] expected = ["eggs", "peanuts"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToMoreThanEggsButNotPeanuts() {
    Allergies allergies = new(5);
    string[] expected = ["eggs", "shellfish"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToLotsOfStuff() {
    Allergies allergies = new(248);
    string[] expected = [
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
        ];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenAllergicToEverything() {
    Allergies allergies = new(255);
    string[] expected = [
        "eggs",
        "peanuts",
        "shellfish",
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
        ];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenNoAllergenScoreParts() {
    Allergies allergies = new(509);
    string[] expected = [
        "eggs",
        "shellfish",
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
        ];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false
}
function testListWhenNoAllergenScorePartsWithoutHighestValidScore() {
    Allergies allergies = new(257);
    string[] expected = ["eggs"];
    test:assertEquals(allergies.list(), expected);
}

