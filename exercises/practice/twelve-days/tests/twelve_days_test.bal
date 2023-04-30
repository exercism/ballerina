import ballerina/test;

@test:Config {
    enable: false
}
function firstDayAPartridgeInAPearTree() {
    var expected = "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(1));
}

@test:Config {
    enable: false
}
function secondDayTwoTurtleDoves() {
    var expected = "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(2));
}

@test:Config {
    enable: false
}
function thirdDayThreeFrenchHens() {
    var expected = "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(3));
}

@test:Config {
    enable: false
}
function fourthDayFourCallingBirds() {
    var expected = "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(4));
}

@test:Config {
    enable: false
}
function fifthDayFiveGoldRings() {
    var expected = "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(5));
}

@test:Config {
    enable: false
}
function sixthDaySixGeeseALaying() {
    var expected = "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(6));
}

@test:Config {
    enable: false
}
function seventhDaySevenSwansASwimming() {
    var expected = "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(7));
}

@test:Config {
    enable: false
}
function eighthDayEightMaidsAMilking() {
    var expected = "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(8));
}

@test:Config {
    enable: false
}
function ninthDayNineLadiesDancing() {
    var expected = "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(9));
}

@test:Config {
    enable: false
}
function tenthDayTenLordsALeaping() {
    var expected = "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(10));
}

@test:Config {
    enable: false
}
function eleventhDayElevenPipersPiping() {
    var expected = "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(11));
}

@test:Config {
    enable: false
}
function twelfthDayTwelveDrummersDrumming() {
    var expected = "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(12));
}

@test:Config {
    enable: false
}
function recitesFirstThreeVersesOfTheSong() {
    var expected = 
        "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n" +
        "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(1, 3));
}

@test:Config {
    enable: false
}
function recitesThreeVersesFromTheMiddleOfTheSong() {
    var expected = 
        "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(4, 6));
}

@test:Config {
    enable: false
}
function recitesTheWholeSong() {
    var expected = 
        "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n" +
        "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n" +
        "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";
    test:assertEquals(expected, TwelveDays.Recite(1, 12));
}
