
import ballerina/test;

function inRange(int n) returns boolean {
    return n >= 3 && n <= 18;
}

@test:Config
function testAbilityModifierForScore3isNegative4() {
    int results = modifier(3);
    test:assertEquals(results, -4);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore4isNegative3() {
    int results = modifier(4);
    test:assertEquals(results, -3);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore5isNegative3() {
    int results = modifier(5);
    test:assertEquals(results, -3);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore6isNegative2() {
    int results = modifier(6);
    test:assertEquals(results, -2);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore7isNegative2() {
    int results = modifier(7);
    test:assertEquals(results, -2);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore8isNegative1() {
    int results = modifier(8);
    test:assertEquals(results, -1);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore9isNegative1() {
    int results = modifier(9);
    test:assertEquals(results, -1);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore10isZero() {
    int results = modifier(10);
    test:assertEquals(results, 0);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore11isZero() {
    int results = modifier(11);
    test:assertEquals(results, 0);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore12isPositive1() {
    int results = modifier(12);
    test:assertEquals(results, 1);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore13isPositive1() {
    int results = modifier(13);
    test:assertEquals(results, 1);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore14isPositive2() {
    int results = modifier(14);
    test:assertEquals(results, 2);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore15isPositive2() {
    int results = modifier(15);
    test:assertEquals(results, 2);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore16isPositive3() {
    int results = modifier(16);
    test:assertEquals(results, 3);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore17isPositive3() {
    int results = modifier(17);
    test:assertEquals(results, 3);
}

@test:Config {
    enable: false
}
function testAbilityModifierForScore18isPositive4() {
    int results = modifier(18);
    test:assertEquals(results, 4);
}

@test:Config {
    enable: false
}
function testRandomAbilityIsWithinRange() {
    int results = ability();
    test:assertTrue(inRange(results));
}

@test:Config {
    enable: false
}
function testRandomCharacterIsValid() {
    DndCharacter char = new DndCharacter();
    test:assertTrue(inRange(char.getStrength()));
    test:assertTrue(inRange(char.getDexterity()));
    test:assertTrue(inRange(char.getConstitution()));
    test:assertTrue(inRange(char.getIntelligence()));
    test:assertTrue(inRange(char.getWisdom()));
    test:assertTrue(inRange(char.getCharisma()));
    test:assertEquals(char.getHitpoints(), 10 + modifier(char.getConstitution()));
}

@test:Config {
    enable: false
}
function testEachAbilityIsCalculatedOnce() {
    DndCharacter char = new DndCharacter();
    test:assertEquals(char.getStrength(), char.getStrength());
    test:assertEquals(char.getDexterity(), char.getDexterity());
    test:assertEquals(char.getConstitution(), char.getConstitution());
    test:assertEquals(char.getIntelligence(), char.getIntelligence());
    test:assertEquals(char.getWisdom(), char.getWisdom());
    test:assertEquals(char.getCharisma(), char.getCharisma());
    test:assertEquals(char.getHitpoints(), char.getHitpoints());
}

// track-specific test

@test:Config {
    enable: false
}
function testCharacterIsRandomlyGenerate() {
    boolean isRandomlyGenerated = true;
    DndCharacter previous = new DndCharacter();
    foreach int i in 0 ... 1000 {
        DndCharacter current = new DndCharacter();

        boolean sameScores = current.getStrength() == previous.getStrength()
                        && current.getDexterity() == previous.getDexterity()
                        && current.getConstitution() == previous.getConstitution()
                        && current.getIntelligence() == previous.getIntelligence()
                        && current.getWisdom() == previous.getWisdom()
                        && current.getCharisma() == previous.getWisdom()
                        && current.getHitpoints() == previous.getHitpoints();

        if (sameScores) {
            isRandomlyGenerated = false;
            break;
        }

    }
    test:assertTrue(isRandomlyGenerated);
}
