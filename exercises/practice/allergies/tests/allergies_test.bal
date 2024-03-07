import ballerina/test;

@test:Config {groups: ["eggs"]}
function testNotAllergicToAnythingIncludingEggs() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false,
    groups: ["eggs"]
}
function testAllergicOnlyToEggs() {
    Allergies allergies = new(1);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false,
    groups: ["eggs"]
}
function testAllergicToEggsAndSomethingElse() {
    Allergies allergies = new(3);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false,
    groups: ["eggs"]
}
function testAllergicToSomethingBesidesEggs() {
    Allergies allergies = new(2);
    test:assertFalse(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false,
    groups: ["eggs"]
}
function testAllergicToEverythingIncludingEggs() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("eggs"));
}

@test:Config {
    enable: false,
    groups: ["peanuts"]
}
function testNotAllergicToAnythingIncludingPeanuts() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false,
    groups: ["peanuts"]
}
function testAllergicOnlyToPeanuts() {
    Allergies allergies = new(2);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false,
    groups: ["peanuts"]
}
function testAllergicToPeanutsAndSomethingElse() {
    Allergies allergies = new(7);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false,
    groups: ["peanuts"]
}
function testAllergicToSomethingBesidesPeanuts() {
    Allergies allergies = new(5);
    test:assertFalse(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false,
    groups: ["peanuts"]
}
function testAllergicToEverythingIncludingPeanuts() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("peanuts"));
}

@test:Config {
    enable: false,
    groups: ["shellfish"]
}
function testNotAllergicToAnythingIncludingShellfish() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false,
    groups: ["shellfish"]
}
function testAllergicOnlyToShellfish() {
    Allergies allergies = new(4);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false,
    groups: ["shellfish"]
}
function testAllergicToShellfishAndSomethingElse() {
    Allergies allergies = new(14);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false,
    groups: ["shellfish"]
}
function testAllergicToSomethingBesidesShellfish() {
    Allergies allergies = new(10);
    test:assertFalse(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false,
    groups: ["shellfish"]
}
function testAllergicToEverythingIncludingShellfish() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("shellfish"));
}

@test:Config {
    enable: false,
    groups: ["strawberries"]
}
function testNotAllergicToAnythingIncludingStrawberries() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false,
    groups: ["strawberries"]
}
function testAllergicOnlyToStrawberries() {
    Allergies allergies = new(8);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false,
    groups: ["strawberries"]
}
function testAllergicToStrawberriesAndSomethingElse() {
    Allergies allergies = new(28);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false,
    groups: ["strawberries"]
}
function testAllergicToSomethingBesidesStrawberries() {
    Allergies allergies = new(20);
    test:assertFalse(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false,
    groups: ["strawberries"]
}
function testAllergicToEverythingIncludingStrawberries() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("strawberries"));
}

@test:Config {
    enable: false,
    groups: ["tomatoes"]
}
function testNotAllergicToAnythingIncludingTomatoes() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false,
    groups: ["tomatoes"]
}
function testAllergicOnlyToTomatoes() {
    Allergies allergies = new(16);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false,
    groups: ["tomatoes"]
}
function testAllergicToTomatoesAndSomethingElse() {
    Allergies allergies = new(56);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false,
    groups: ["tomatoes"]
}
function testAllergicToSomethingBesidesTomatoes() {
    Allergies allergies = new(40);
    test:assertFalse(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false,
    groups: ["tomatoes"]
}
function testAllergicToEverythingIncludingTomatoes() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("tomatoes"));
}

@test:Config {
    enable: false,
    groups: ["chocolate"]
}
function testNotAllergicToAnythingIncludingChocolate() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false,
    groups: ["chocolate"]
}
function testAllergicOnlyToChocolate() {
    Allergies allergies = new(32);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false,
    groups: ["chocolate"]
}
function testAllergicToChocolateAndSomethingElse() {
    Allergies allergies = new(112);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false,
    groups: ["chocolate"]
}
function testAllergicToSomethingBesidesChocolate() {
    Allergies allergies = new(80);
    test:assertFalse(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false,
    groups: ["chocolate"]
}
function testAllergicToEverythingIncludingChocolate() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("chocolate"));
}

@test:Config {
    enable: false,
    groups: ["pollen"]
}
function testNotAllergicToAnythingIncludingPollen() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false,
    groups: ["pollen"]
}
function testAllergicOnlyToPollen() {
    Allergies allergies = new(64);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false,
    groups: ["pollen"]
}
function testAllergicToPollenAndSomethingElse() {
    Allergies allergies = new(224);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false,
    groups: ["pollen"]
}
function testAllergicToSomethingBesidesPollen() {
    Allergies allergies = new(160);
    test:assertFalse(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false,
    groups: ["pollen"]
}
function testAllergicToEverythingIncludingPollen() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("pollen"));
}

@test:Config {
    enable: false,
    groups: ["cats"]
}
function testNotAllergicToAnythingIncludingCats() {
    Allergies allergies = new(0);
    test:assertFalse(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false,
    groups: ["cats"]
}
function testAllergicOnlyToCats() {
    Allergies allergies = new(128);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false,
    groups: ["cats"]
}
function testAllergicToCatsAndSomethingElse() {
    Allergies allergies = new(192);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false,
    groups: ["cats"]
}
function testAllergicToSomethingBesidesCats() {
    Allergies allergies = new(64);
    test:assertFalse(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false,
    groups: ["cats"]
}
function testAllergicToEverythingIncludingCats() {
    Allergies allergies = new(255);
    test:assertTrue(allergies.allergicTo("cats"));
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAlergicToNothing() {
    Allergies allergies = new(0);
    string[] expected = [];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAllergicToJustEggs() {
    Allergies allergies = new(1);
    string[] expected = ["eggs"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAllergicToJustPeanuts() {
    Allergies allergies = new(2);
    string[] expected = ["peanuts"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAllergicToJustStrawberries() {
    Allergies allergies = new(8);
    string[] expected = ["strawberries"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAllergicToEggsAndPeanuts() {
    Allergies allergies = new(3);
    string[] expected = ["eggs", "peanuts"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
}
function testListWhenAllergicToMoreThanEggsButNotPeanuts() {
    Allergies allergies = new(5);
    string[] expected = ["eggs", "shellfish"];
    test:assertEquals(allergies.list(), expected);
}

@test:Config {
    enable: false,
    groups: ["list"]
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
    enable: false,
    groups: ["list"]
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
    enable: false,
    groups: ["list"]
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
    enable: false,
    groups: ["list"]
}
function testListWhenNoAllergenScorePartsWithoutHighestValidScore() {
    Allergies allergies = new(257);
    string[] expected = ["eggs"];
    test:assertEquals(allergies.list(), expected);
}

