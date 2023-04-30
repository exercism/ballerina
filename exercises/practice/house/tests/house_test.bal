import ballerina/test;

@test:Config {
    enable: false
}
function verseOneTheHouseThatJackBuilt() {
    var expected = "This is the house that Jack built.";
    test:assertEquals(expected, House.Recite(1));
}

@test:Config {
    enable: false
}
function verseTwoTheMaltThatLay() {
    var expected = "This is the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(2));
}

@test:Config {
    enable: false
}
function verseThreeTheRatThatAte() {
    var expected = "This is the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(3));
}

@test:Config {
    enable: false
}
function verseFourTheCatThatKilled() {
    var expected = "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(4));
}

@test:Config {
    enable: false
}
function verseFiveTheDogThatWorried() {
    var expected = "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(5));
}

@test:Config {
    enable: false
}
function verseSixTheCowWithTheCrumpledHorn() {
    var expected = "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(6));
}

@test:Config {
    enable: false
}
function verseSevenTheMaidenAllForlorn() {
    var expected = "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(7));
}

@test:Config {
    enable: false
}
function verseEightTheManAllTatteredAndTorn() {
    var expected = "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(8));
}

@test:Config {
    enable: false
}
function verseNineThePriestAllShavenAndShorn() {
    var expected = "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(9));
}

@test:Config {
    enable: false
}
function verse_10TheRoosterThatCrowedInTheMorn() {
    var expected = "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(10));
}

@test:Config {
    enable: false
}
function verse_11TheFarmerSowingHisCorn() {
    var expected = "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(11));
}

@test:Config {
    enable: false
}
function verse_12TheHorseAndTheHoundAndTheHorn() {
    var expected = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(12));
}

@test:Config {
    enable: false
}
function multipleVerses() {
    var expected = 
        "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(4, 8));
}

@test:Config {
    enable: false
}
function fullRhyme() {
    var expected = 
        "This is the house that Jack built.\n" +
        "This is the malt that lay in the house that Jack built.\n" +
        "This is the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(1, 12));
}
