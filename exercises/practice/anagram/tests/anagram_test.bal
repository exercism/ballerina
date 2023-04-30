import ballerina/test;

@test:Config {
    enable: false
}
function noMatches() {
    var candidates = [ "hello", "world", "zombies", "pants" ];
    var sut = new Anagram("diaper");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsTwoAnagrams() {
    var candidates = [ "lemons", "cherry", "melons" ];
    var sut = new Anagram("solemn");
    var expected = [ "lemons", "melons" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function doesNotDetectAnagramSubsets() {
    var candidates = [ "dog", "goody" ];
    var sut = new Anagram("good");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsAnagram() {
    var candidates = [ "enlists", "google", "inlets", "banana" ];
    var sut = new Anagram("listen");
    var expected = [ "inlets" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsThreeAnagrams() {
    var candidates = [ "gallery", "ballerina", "regally", "clergy", "largely", "leading" ];
    var sut = new Anagram("allergy");
    var expected = [ "gallery", "regally", "largely" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsMultipleAnagramsWithDifferentCase() {
    var candidates = [ "Eons", "ONES" ];
    var sut = new Anagram("nose");
    var expected = [ "Eons", "ONES" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function doesNotDetectNonAnagramsWithIdenticalChecksum() {
    var candidates = [ "last" ];
    var sut = new Anagram("mass");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsAnagramsCaseInsensitively() {
    var candidates = [ "cashregister", "Carthorse", "radishes" ];
    var sut = new Anagram("Orchestra");
    var expected = [ "Carthorse" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsAnagramsUsingCaseInsensitiveSubject() {
    var candidates = [ "cashregister", "carthorse", "radishes" ];
    var sut = new Anagram("Orchestra");
    var expected = [ "carthorse" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function detectsAnagramsUsingCaseInsensitivePossibleMatches() {
    var candidates = [ "cashregister", "Carthorse", "radishes" ];
    var sut = new Anagram("orchestra");
    var expected = [ "Carthorse" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function doesNotDetectAnAnagramIfTheOriginalWordIsRepeated() {
    var candidates = [ "go Go GO" ];
    var sut = new Anagram("go");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function anagramsMustUseAllLettersExactlyOnce() {
    var candidates = [ "patter" ];
    var sut = new Anagram("tapper");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function wordsAreNotAnagramsOfThemselves() {
    var candidates = [ "BANANA" ];
    var sut = new Anagram("BANANA");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function wordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsPartiallyDifferent() {
    var candidates = [ "Banana" ];
    var sut = new Anagram("BANANA");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function wordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsCompletelyDifferent() {
    var candidates = [ "banana" ];
    var sut = new Anagram("BANANA");
    Assert.Empty(sut.FindAnagrams(candidates));
}

@test:Config {
    enable: false
}
function wordsOtherThanThemselvesCanBeAnagrams() {
    var candidates = [ "LISTEN", "Silent" ];
    var sut = new Anagram("LISTEN");
    var expected = [ "Silent" ];
    test:assertEquals(expected, sut.FindAnagrams(candidates));
}
