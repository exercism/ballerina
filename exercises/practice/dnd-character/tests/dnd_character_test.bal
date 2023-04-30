import ballerina/test;

@test:Config {
    enable: false
}
function abilityModifierForScore_3IsMinus_4() {
    test:assertEquals(-4, DndCharacter.Modifier(3));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_4IsMinus_3() {
    test:assertEquals(-3, DndCharacter.Modifier(4));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_5IsMinus_3() {
    test:assertEquals(-3, DndCharacter.Modifier(5));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_6IsMinus_2() {
    test:assertEquals(-2, DndCharacter.Modifier(6));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_7IsMinus_2() {
    test:assertEquals(-2, DndCharacter.Modifier(7));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_8IsMinus_1() {
    test:assertEquals(-1, DndCharacter.Modifier(8));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_9IsMinus_1() {
    test:assertEquals(-1, DndCharacter.Modifier(9));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_10Is_0() {
    test:assertEquals(0, DndCharacter.Modifier(10));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_11Is_0() {
    test:assertEquals(0, DndCharacter.Modifier(11));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_12Is_1() {
    test:assertEquals(1, DndCharacter.Modifier(12));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_13Is_1() {
    test:assertEquals(1, DndCharacter.Modifier(13));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_14Is_2() {
    test:assertEquals(2, DndCharacter.Modifier(14));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_15Is_2() {
    test:assertEquals(2, DndCharacter.Modifier(15));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_16Is_3() {
    test:assertEquals(3, DndCharacter.Modifier(16));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_17Is_3() {
    test:assertEquals(3, DndCharacter.Modifier(17));
}

@test:Config {
    enable: false
}
function abilityModifierForScore_18Is_4() {
    test:assertEquals(4, DndCharacter.Modifier(18));
}

@test:Config {
    enable: false
}
function randomAbilityIsWithinRange() {
    for (var i = 0; i < 10; i++)
    {
        Assert.InRange(DndCharacter.Ability(), 3, 18);
    }
}

@test:Config {
    enable: false
}
function randomCharacterIsValid() {
    for (var i = 0; i < 10; i++)
    {
        var sut = DndCharacter.Generate();
        Assert.InRange(sut.Strength, 3, 18);
        Assert.InRange(sut.Dexterity, 3, 18);
        Assert.InRange(sut.Constitution, 3, 18);
        Assert.InRange(sut.Intelligence, 3, 18);
        Assert.InRange(sut.Wisdom, 3, 18);
        Assert.InRange(sut.Charisma, 3, 18);
        test:assertEquals(sut.Hitpoints, 10 + DndCharacter.Modifier(sut.Constitution));
    }
}

@test:Config {
    enable: false
}
function eachAbilityIsOnlyCalculatedOnce() {
    for (var i = 0; i < 10; i++)
    {
        var sut = DndCharacter.Generate();
        test:assertEquals(sut.Strength, sut.Strength);
        test:assertEquals(sut.Dexterity, sut.Dexterity);
        test:assertEquals(sut.Constitution, sut.Constitution);
        test:assertEquals(sut.Intelligence, sut.Intelligence);
        test:assertEquals(sut.Wisdom, sut.Wisdom);
        test:assertEquals(sut.Charisma, sut.Charisma);
    }
}

@test:Config {
    enable: false
}
function randomAbilityIsDistributedCorrectly() {
    var expectedDistribution = new Dictionary<int, int>
    {
        [3] = 1,        [4] = 4,
        [5] = 10,       [6] = 21,
        [7] = 38,       [8] = 62,
        [9] = 91,       [10] = 122,
        [11] = 148,     [12] = 167,
        [13] = 172,     [14] = 160,
        [15] = 131,     [16] = 94,
        [17] = 54,      [18] = 21
    };
 
    var actualDistribution = new Dictionary<int, int>(expectedDistribution);
    foreach (var key in actualDistribution.Keys)
        actualDistribution[key] = 0;        
 
    const int times = 250;
    const int possibleCombinationsCount = 6*6*6*6; // 4d6
    for (var i = 0; i < times * possibleCombinationsCount; i++)
        actualDistribution[DndCharacter.Ability()]++;
 
    const double minTimes = times * 0.8;
    const double maxTimes = times * 1.2;
    foreach (var k in expectedDistribution.Keys)
        Assert.InRange(actualDistribution[k], expectedDistribution[k] * minTimes, expectedDistribution[k] * maxTimes);
}
