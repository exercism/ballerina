import ballerina/test;

@test:Config {
    enable: false
}
function zeroPieces() {
    var strings = Array.Empty<string>();
    var expected = Array.Empty<string>();
    test:assertEquals(expected, Proverb.Recite(strings));
}

@test:Config {
    enable: false
}
function onePiece() {
    var strings = new[]
    {
        "nail"
    };
    var expected = new[]
    {
        "And all for the want of a nail."
    };
    test:assertEquals(expected, Proverb.Recite(strings));
}

@test:Config {
    enable: false
}
function twoPieces() {
    var strings = new[]
    {
        "nail",
        "shoe"
    };
    var expected = new[]
    {
        "For want of a nail the shoe was lost.",
        "And all for the want of a nail."
    };
    test:assertEquals(expected, Proverb.Recite(strings));
}

@test:Config {
    enable: false
}
function threePieces() {
    var strings = new[]
    {
        "nail",
        "shoe",
        "horse"
    };
    var expected = new[]
    {
        "For want of a nail the shoe was lost.",
        "For want of a shoe the horse was lost.",
        "And all for the want of a nail."
    };
    test:assertEquals(expected, Proverb.Recite(strings));
}

@test:Config {
    enable: false
}
function fullProverb() {
    var strings = new[]
    {
        "nail",
        "shoe",
        "horse",
        "rider",
        "message",
        "battle",
        "kingdom"
    };
    var expected = new[]
    {
        "For want of a nail the shoe was lost.",
        "For want of a shoe the horse was lost.",
        "For want of a horse the rider was lost.",
        "For want of a rider the message was lost.",
        "For want of a message the battle was lost.",
        "For want of a battle the kingdom was lost.",
        "And all for the want of a nail."
    };
    test:assertEquals(expected, Proverb.Recite(strings));
}

@test:Config {
    enable: false
}
function fourPiecesModernized() {
    var strings = new[]
    {
        "pin",
        "gun",
        "soldier",
        "battle"
    };
    var expected = new[]
    {
        "For want of a pin the gun was lost.",
        "For want of a gun the soldier was lost.",
        "For want of a soldier the battle was lost.",
        "And all for the want of a pin."
    };
    test:assertEquals(expected, Proverb.Recite(strings));
}
