import ballerina/test;

@test:Config {
    enable: false
}
function countOneWord() {
    var actual = WordCount.CountWords("word");
    var expected = new Dictionary<string, int>
    {
        ["word"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function countOneOfEachWord() {
    var actual = WordCount.CountWords("one of each");
    var expected = new Dictionary<string, int>
    {
        ["one"] = 1,
        ["of"] = 1,
        ["each"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function multipleOccurrencesOfAWord() {
    var actual = WordCount.CountWords("one fish two fish red fish blue fish");
    var expected = new Dictionary<string, int>
    {
        ["one"] = 1,
        ["fish"] = 4,
        ["two"] = 1,
        ["red"] = 1,
        ["blue"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function handlesCrampedLists() {
    var actual = WordCount.CountWords("one,two,three");
    var expected = new Dictionary<string, int>
    {
        ["one"] = 1,
        ["two"] = 1,
        ["three"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function handlesExpandedLists() {
    var actual = WordCount.CountWords("one,\ntwo,\nthree");
    var expected = new Dictionary<string, int>
    {
        ["one"] = 1,
        ["two"] = 1,
        ["three"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function ignorePunctuation() {
    var actual = WordCount.CountWords("car: carpet as java: javascript!!&@$%^&");
    var expected = new Dictionary<string, int>
    {
        ["car"] = 1,
        ["carpet"] = 1,
        ["as"] = 1,
        ["java"] = 1,
        ["javascript"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function includeNumbers() {
    var actual = WordCount.CountWords("testing, 1, 2 testing");
    var expected = new Dictionary<string, int>
    {
        ["testing"] = 2,
        ["1"] = 1,
        ["2"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function normalizeCase() {
    var actual = WordCount.CountWords("go Go GO Stop stop");
    var expected = new Dictionary<string, int>
    {
        ["go"] = 3,
        ["stop"] = 2
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function withApostrophes() {
    var actual = WordCount.CountWords("'First: don't laugh. Then: don't cry. You're getting it.'");
    var expected = new Dictionary<string, int>
    {
        ["first"] = 1,
        ["don't"] = 2,
        ["laugh"] = 1,
        ["then"] = 1,
        ["cry"] = 1,
        ["you're"] = 1,
        ["getting"] = 1,
        ["it"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function withQuotations() {
    var actual = WordCount.CountWords("Joe can't tell between 'large' and large.");
    var expected = new Dictionary<string, int>
    {
        ["joe"] = 1,
        ["can't"] = 1,
        ["tell"] = 1,
        ["between"] = 1,
        ["large"] = 2,
        ["and"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function substringsFromTheBeginning() {
    var actual = WordCount.CountWords("Joe can't tell between app, apple and a.");
    var expected = new Dictionary<string, int>
    {
        ["joe"] = 1,
        ["can't"] = 1,
        ["tell"] = 1,
        ["between"] = 1,
        ["app"] = 1,
        ["apple"] = 1,
        ["and"] = 1,
        ["a"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function multipleSpacesNotDetectedAsAWord() {
    var actual = WordCount.CountWords(" multiple   whitespaces");
    var expected = new Dictionary<string, int>
    {
        ["multiple"] = 1,
        ["whitespaces"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function alternatingWordSeparatorsNotDetectedAsAWord() {
    var actual = WordCount.CountWords(",\n,one,\n ,two \n 'three'");
    var expected = new Dictionary<string, int>
    {
        ["one"] = 1,
        ["two"] = 1,
        ["three"] = 1
    };
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function quotationForWordWithApostrophe() {
    var actual = WordCount.CountWords("can, can't, 'can't'");
    var expected = new Dictionary<string, int>
    {
        ["can"] = 1,
        ["can't"] = 2
    };
    test:assertEquals(expected, actual);
}
