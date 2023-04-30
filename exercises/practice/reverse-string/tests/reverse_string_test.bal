import ballerina/test;

@test:Config {
    enable: false
}
function anEmptyString() {
    test:assertEquals("", ReverseString.Reverse(""));
}

@test:Config {
    enable: false
}
function aWord() {
    test:assertEquals("tobor", ReverseString.Reverse("robot"));
}

@test:Config {
    enable: false
}
function aCapitalizedWord() {
    test:assertEquals("nemaR", ReverseString.Reverse("Ramen"));
}

@test:Config {
    enable: false
}
function aSentenceWithPunctuation() {
    test:assertEquals("!yrgnuh m'I", ReverseString.Reverse("I'm hungry!"));
}

@test:Config {
    enable: false
}
function aPalindrome() {
    test:assertEquals("racecar", ReverseString.Reverse("racecar"));
}

@test:Config {
    enable: false
}
function anEvenSizedWord() {
    test:assertEquals("reward", ReverseString.Reverse("drawer"));
}
