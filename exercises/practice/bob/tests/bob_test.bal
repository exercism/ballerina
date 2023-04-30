import ballerina/test;

@test:Config {
    enable: false
}
function statingSomething() {
    test:assertEquals("Whatever.", Bob.Response("Tom-ay-to, tom-aaaah-to."));
}

@test:Config {
    enable: false
}
function shouting() {
    test:assertEquals("Whoa, chill out!", Bob.Response("WATCH OUT!"));
}

@test:Config {
    enable: false
}
function shoutingGibberish() {
    test:assertEquals("Whoa, chill out!", Bob.Response("FCECDFCAAB"));
}

@test:Config {
    enable: false
}
function askingAQuestion() {
    test:assertEquals("Sure.", Bob.Response("Does this cryogenic chamber make me look fat?"));
}

@test:Config {
    enable: false
}
function askingANumericQuestion() {
    test:assertEquals("Sure.", Bob.Response("You are, what, like 15?"));
}

@test:Config {
    enable: false
}
function askingGibberish() {
    test:assertEquals("Sure.", Bob.Response("fffbbcbeab?"));
}

@test:Config {
    enable: false
}
function talkingForcefully() {
    test:assertEquals("Whatever.", Bob.Response("Hi there!"));
}

@test:Config {
    enable: false
}
function usingAcronymsInRegularSpeech() {
    test:assertEquals("Whatever.", Bob.Response("It's OK if you don't want to go work for NASA."));
}

@test:Config {
    enable: false
}
function forcefulQuestion() {
    test:assertEquals("Calm down, I know what I'm doing!", Bob.Response("WHAT'S GOING ON?"));
}

@test:Config {
    enable: false
}
function shoutingNumbers() {
    test:assertEquals("Whoa, chill out!", Bob.Response("1, 2, 3 GO!"));
}

@test:Config {
    enable: false
}
function noLetters() {
    test:assertEquals("Whatever.", Bob.Response("1, 2, 3"));
}

@test:Config {
    enable: false
}
function questionWithNoLetters() {
    test:assertEquals("Sure.", Bob.Response("4?"));
}

@test:Config {
    enable: false
}
function shoutingWithSpecialCharacters() {
    test:assertEquals("Whoa, chill out!", Bob.Response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"));
}

@test:Config {
    enable: false
}
function shoutingWithNoExclamationMark() {
    test:assertEquals("Whoa, chill out!", Bob.Response("I HATE THE DENTIST"));
}

@test:Config {
    enable: false
}
function statementContainingQuestionMark() {
    test:assertEquals("Whatever.", Bob.Response("Ending with ? means a question."));
}

@test:Config {
    enable: false
}
function nonLettersWithQuestion() {
    test:assertEquals("Sure.", Bob.Response(":) ?"));
}

@test:Config {
    enable: false
}
function prattlingOn() {
    test:assertEquals("Sure.", Bob.Response("Wait! Hang on. Are you going to be OK?"));
}

@test:Config {
    enable: false
}
function silence() {
    test:assertEquals("Fine. Be that way!", Bob.Response(""));
}

@test:Config {
    enable: false
}
function prolongedSilence() {
    test:assertEquals("Fine. Be that way!", Bob.Response("          "));
}

@test:Config {
    enable: false
}
function alternateSilence() {
    test:assertEquals("Fine. Be that way!", Bob.Response("\t\t\t\t\t\t\t\t\t\t"));
}

@test:Config {
    enable: false
}
function multipleLineQuestion() {
    test:assertEquals("Whatever.", Bob.Response("\nDoes this cryogenic chamber make me look fat?\nNo."));
}

@test:Config {
    enable: false
}
function startingWithWhitespace() {
    test:assertEquals("Whatever.", Bob.Response("         hmmmmmmm..."));
}

@test:Config {
    enable: false
}
function endingWithWhitespace() {
    test:assertEquals("Sure.", Bob.Response("Okay if like my  spacebar  quite a bit?   "));
}

@test:Config {
    enable: false
}
function otherWhitespace() {
    test:assertEquals("Fine. Be that way!", Bob.Response("\n\r \t"));
}

@test:Config {
    enable: false
}
function nonQuestionEndingWithWhitespace() {
    test:assertEquals("Whatever.", Bob.Response("This is a statement ending with whitespace      "));
}
