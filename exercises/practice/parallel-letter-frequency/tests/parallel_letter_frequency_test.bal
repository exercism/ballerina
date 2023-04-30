import ballerina/test;

// Poem by Friedrich Schiller. The corresponding music is the European Anthem.
private const string OdeAnDieFreude =
    "Freude schöner Götterfunken\n" +
    "Tochter aus Elysium,\n" +
    "Wir betreten feuertrunken,\n" +
    "Himmlische, dein Heiligtum!\n" +
    "Deine Zauber binden wieder\n" +
    "Was die Mode streng geteilt;\n" +
    "Alle Menschen werden Brüder,\n" +
    "Wo dein sanfter Flügel weilt.";

// Dutch national anthem
private const string Wilhelmus =
    "Wilhelmus van Nassouwe\n" +
    "ben ik, van Duitsen bloed,\n" +
    "den vaderland getrouwe\n" +
    "blijf ik tot in den dood.\n" +
    "Een Prinse van Oranje\n" +
    "ben ik, vrij, onverveerd,\n" +
    "den Koning van Hispanje\n" +
    "heb ik altijd geëerd.";

// American national anthem
private const string StarSpangledBanner =
    "O say can you see by the dawn's early light,\n" +
    "What so proudly we hailed at the twilight's last gleaming,\n" +
    "Whose broad stripes and bright stars through the perilous fight,\n" +
    "O'er the ramparts we watched, were so gallantly streaming?\n" +
    "And the rockets' red glare, the bombs bursting in air,\n" +
    "Gave proof through the night that our flag was still there;\n" +
    "O say does that star-spangled banner yet wave,\n" +
    "O'er the land of the free and the home of the brave?\n";

@test:Config {
    enable: false
}
function noTextsMeanNoLetters() {
    var input = Enumerable.Empty<string>();
    var actual = ParallelLetterFrequency.Calculate(input);
    var expected = new Dictionary<char, int>();
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function oneLetter() {
    var input = [ "a" ];
    var actual = ParallelLetterFrequency.Calculate(input);
    var expected = new Dictionary<char, int>
    {
        { 'a', 1 }
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function caseInsensitivity() {
    var input = [ "aA" ];
    var actual = ParallelLetterFrequency.Calculate(input);
    var expected = new Dictionary<char, int>
    {
        { 'a', 2 }
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function manyEmptyTextsStillMeanNoLetters() {
    var input = Enumerable.Repeat("  ", 10000);
    var actual = ParallelLetterFrequency.Calculate(input);
    var expected = new Dictionary<char, int>();
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function manyTimesTheSameTextGivesAPredictableResult() {
    var input = Enumerable.Repeat("abc", 1000);
    var actual = ParallelLetterFrequency.Calculate(input);
    var expected = new Dictionary<char, int>
    {
        { 'a', 1000 },
        { 'b', 1000 },
        { 'c', 1000 }
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function punctuationDoesntCount() {
    var input = [ OdeAnDieFreude ];
    var actual = ParallelLetterFrequency.Calculate(input);
    test:assertFalse(actual.ContainsKey(','));
}

@test:Config {
    enable: false
}
function numbersDontCount() {
    var input = [ "Testing, 1, 2, 3" ];
    var actual = ParallelLetterFrequency.Calculate(input);
    test:assertFalse(actual.ContainsKey('1'));
}

@test:Config {
    enable: false
}
function allThreeAnthemsTogether() {
    var input = [ OdeAnDieFreude, Wilhelmus, StarSpangledBanner ];
    var actual = ParallelLetterFrequency.Calculate(input);
    test:assertEquals(49, actual['a']);
    test:assertEquals(56, actual['t']);
    test:assertEquals(2, actual['ü']);
}
