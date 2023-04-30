import ballerina/test;

@test:Config {
    enable: false
}
function shouldAcceptAnInitialGameGridAndATargetSearchWord() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = "jefblpepre";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = null
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateOneWordWrittenLeftToRight() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 1), (7, 1))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateTheSameWordWrittenLeftToRightInADifferentPosition() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = "mtclojurer";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((3, 1), (9, 1))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateADifferentLeftToRightWord() {
    var wordsToSearchFor = [ "coffee" ];
    var grid = "coffeelplx";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["coffee"] = ((1, 1), (6, 1))
    };
    test:assertEquals(expected["coffee"], actual["coffee"]);
}

@test:Config {
    enable: false
}
function shouldLocateThatDifferentLeftToRightWordInADifferentPosition() {
    var wordsToSearchFor = [ "coffee" ];
    var grid = "xcoffeezlp";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["coffee"] = ((2, 1), (7, 1))
    };
    test:assertEquals(expected["coffee"], actual["coffee"]);
}

@test:Config {
    enable: false
}
function shouldLocateALeftToRightWordInTwoLineGrid() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = 
        "jefblpepre\n" +
        "tclojurerm";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((2, 2), (8, 2))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateALeftToRightWordInThreeLineGrid() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = 
        "camdcimgtc\n" +
        "jefblpepre\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 3), (7, 3))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateALeftToRightWordInTenLineGrid() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateThatLeftToRightWordInADifferentPositionInATenLineGrid() {
    var wordsToSearchFor = [ "clojure" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "clojurermt\n" +
        "jalaycalmp";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 9), (7, 9))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
}

@test:Config {
    enable: false
}
function shouldLocateADifferentLeftToRightWordInATenLineGrid() {
    var wordsToSearchFor = [ "fortran" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "fortranftw\n" +
        "alxhpburyi\n" +
        "clojurermt\n" +
        "jalaycalmp";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["fortran"] = ((1, 7), (7, 7))
    };
    test:assertEquals(expected["fortran"], actual["fortran"]);
}

@test:Config {
    enable: false
}
function shouldLocateMultipleWords() {
    var wordsToSearchFor = [ "fortran", "clojure" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "fortranftw\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["fortran"] = ((1, 7), (7, 7))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["fortran"], actual["fortran"]);
}

@test:Config {
    enable: false
}
function shouldLocateASingleWordWrittenRightToLeft() {
    var wordsToSearchFor = [ "elixir" ];
    var grid = "rixilelhrs";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["elixir"] = ((6, 1), (1, 1))
    };
    test:assertEquals(expected["elixir"], actual["elixir"]);
}

@test:Config {
    enable: false
}
function shouldLocateMultipleWordsWrittenInDifferentHorizontalDirections() {
    var wordsToSearchFor = [ "elixir", "clojure" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenTopToBottom() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenBottomToTop() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenTopLeftToBottomRight() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust", "java" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2)),
        ["java"] = ((1, 1), (4, 4))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
    test:assertEquals(expected["java"], actual["java"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenBottomRightToTopLeft() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust", "java", "lua" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2)),
        ["java"] = ((1, 1), (4, 4)),
        ["lua"] = ((8, 9), (6, 7))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
    test:assertEquals(expected["java"], actual["java"]);
    test:assertEquals(expected["lua"], actual["lua"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenBottomLeftToTopRight() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2)),
        ["java"] = ((1, 1), (4, 4)),
        ["lua"] = ((8, 9), (6, 7)),
        ["lisp"] = ((3, 6), (6, 3))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
    test:assertEquals(expected["java"], actual["java"]);
    test:assertEquals(expected["lua"], actual["lua"]);
    test:assertEquals(expected["lisp"], actual["lisp"]);
}

@test:Config {
    enable: false
}
function shouldLocateWordsWrittenTopRightToBottomLeft() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp", "ruby" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2)),
        ["java"] = ((1, 1), (4, 4)),
        ["lua"] = ((8, 9), (6, 7)),
        ["lisp"] = ((3, 6), (6, 3)),
        ["ruby"] = ((8, 6), (5, 9))
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
    test:assertEquals(expected["java"], actual["java"]);
    test:assertEquals(expected["lua"], actual["lua"]);
    test:assertEquals(expected["lisp"], actual["lisp"]);
    test:assertEquals(expected["ruby"], actual["ruby"]);
}

@test:Config {
    enable: false
}
function shouldFailToLocateAWordThatIsNotInThePuzzle() {
    var wordsToSearchFor = [ "clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp", "ruby", "haskell" ];
    var grid = 
        "jefblpepre\n" +
        "camdcimgtc\n" +
        "oivokprjsm\n" +
        "pbwasqroua\n" +
        "rixilelhrs\n" +
        "wolcqlirpc\n" +
        "screeaumgr\n" +
        "alxhpburyi\n" +
        "jalaycalmp\n" +
        "clojurermt";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["clojure"] = ((1, 10), (7, 10)),
        ["elixir"] = ((6, 5), (1, 5)),
        ["ecmascript"] = ((10, 1), (10, 10)),
        ["rust"] = ((9, 5), (9, 2)),
        ["java"] = ((1, 1), (4, 4)),
        ["lua"] = ((8, 9), (6, 7)),
        ["lisp"] = ((3, 6), (6, 3)),
        ["ruby"] = ((8, 6), (5, 9)),
        ["haskell"] = null
    };
    test:assertEquals(expected["clojure"], actual["clojure"]);
    test:assertEquals(expected["elixir"], actual["elixir"]);
    test:assertEquals(expected["ecmascript"], actual["ecmascript"]);
    test:assertEquals(expected["rust"], actual["rust"]);
    test:assertEquals(expected["java"], actual["java"]);
    test:assertEquals(expected["lua"], actual["lua"]);
    test:assertEquals(expected["lisp"], actual["lisp"]);
    test:assertEquals(expected["ruby"], actual["ruby"]);
    test:assertEquals(expected["haskell"], actual["haskell"]);
}

@test:Config {
    enable: false
}
function shouldFailToLocateWordsThatAreNotOnHorizontalVerticalOrDiagonalLines() {
    var wordsToSearchFor = [ "aef", "ced", "abf", "cbd" ];
    var grid = 
        "abc\n" +
        "def";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["aef"] = null,
        ["ced"] = null,
        ["abf"] = null,
        ["cbd"] = null
    };
    test:assertEquals(expected["aef"], actual["aef"]);
    test:assertEquals(expected["ced"], actual["ced"]);
    test:assertEquals(expected["abf"], actual["abf"]);
    test:assertEquals(expected["cbd"], actual["cbd"]);
}

@test:Config {
    enable: false
}
function shouldNotConcatenateDifferentLinesToFindAHorizontalWord() {
    var wordsToSearchFor = [ "elixir" ];
    var grid = 
        "abceli\n" +
        "xirdfg";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["elixir"] = null
    };
    test:assertEquals(expected["elixir"], actual["elixir"]);
}

@test:Config {
    enable: false
}
function shouldNotWrapAroundHorizontallyToFindAWord() {
    var wordsToSearchFor = [ "lisp" ];
    var grid = "silabcdefp";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["lisp"] = null
    };
    test:assertEquals(expected["lisp"], actual["lisp"]);
}

@test:Config {
    enable: false
}
function shouldNotWrapAroundVerticallyToFindAWord() {
    var wordsToSearchFor = [ "rust" ];
    var grid = 
        "s\n" +
        "u\n" +
        "r\n" +
        "a\n" +
        "b\n" +
        "c\n" +
        "t";
    var sut = new WordSearch(grid);
    var actual = sut.Search(wordsToSearchFor);
    var expected = new Dictionary<string, ((int, int), (int, int))?>
    {
        ["rust"] = null
    };
    test:assertEquals(expected["rust"], actual["rust"]);
}
