import ballerina/test;

@test:Config
function testEmptyString() {
    test:assertEquals(reverse(""), "");
}

@test:Config {
    enable: false
}
function testAWord() {
    test:assertEquals(reverse("robot"), "tobor");
}

@test:Config {
    enable: false
}
function testACapitalizedWord() {
    test:assertEquals(reverse("Ramen"), "nemaR");
}

@test:Config {
    enable: false
}
function testASentenceWithPunctuation() {
    test:assertEquals(reverse("I'm hungry!"), "!yrgnuh m'I");
}

@test:Config {
    enable: false
}
function testAPalindrome() {
    test:assertEquals(reverse("racecar"), "racecar");
}

@test:Config {
    enable: false
}
function testAnEvenSizedWord() {
    test:assertEquals(reverse("drawer"), "reward");
}
