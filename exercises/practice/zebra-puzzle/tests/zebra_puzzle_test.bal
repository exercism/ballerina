import ballerina/test;

@test:Config {
    enable: false
}
function residentWhoDrinksWater() {
    test:assertEquals(Nationality.Norwegian, ZebraPuzzle.DrinksWater());
}

@test:Config {
    enable: false
}
function residentWhoOwnsZebra() {
    test:assertEquals(Nationality.Japanese, ZebraPuzzle.OwnsZebra());
}
