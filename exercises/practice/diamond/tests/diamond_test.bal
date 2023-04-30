import ballerina/test;

public static readonly char[] AllLetters = GetLetterRange('A', 'Z');
private static string[] Rows(string x) => x.Split(new[] { '\n' }, StringSplitOptions.None);

private static string LeadingSpaces(string x) => x.Substring(0, x.IndexOfAny(AllLetters));
private static string TrailingSpaces(string x) => x.Substring(x.LastIndexOfAny(AllLetters) + 1);
private static char[] GetLetterRange(char min, char max) => Enumerable.Range(min, max - min + 1).Select(i => (char)i).ToArray();

[DiamondProperty]
function diamondIsNotEmpty(char letter) {
    var actual = Diamond.Make(letter);

    Assert.NotEmpty(actual);
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function firstRowContainsA(char letter) {
    var actual = Diamond.Make(letter);
    var rows = Rows(actual);
    var firstRowCharacters = rows.First().Trim();

    test:assertEquals("A", firstRowCharacters);
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function allRowsMustHaveSymmetricContour(char letter) {
    var actual = Diamond.Make(letter);
    var rows = Rows(actual);

    Assert.All(rows, row =>
    {
        test:assertEquals(LeadingSpaces(row), TrailingSpaces(row));
    });
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function topOfFigureHasLettersInCorrectOrder(char letter) {
    var actual = Diamond.Make(letter);
    var rows = Rows(actual);

    var expected = GetLetterRange('A', letter);
    var firstNonSpaceLetters = rows.Take(expected.Length).Select(row => row.Trim()[0]);

    test:assertEquals(firstNonSpaceLetters, expected);
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function figureIsSymmetricAroundTheHorizontalAxis(char letter) {
    var actual = Diamond.Make(letter);

    var rows = Rows(actual);
    var top = rows.TakeWhile(row => !row.Contains(letter));
    var bottom = rows.Reverse().TakeWhile(row => !row.Contains(letter));

    test:assertEquals(bottom, top);
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function diamondHasSquareShape(char letter) {
    var actual = Diamond.Make(letter);

    var rows = Rows(actual);
    var expected = rows.Length;

    Assert.All(rows, row =>
    {
        test:assertEquals(expected, row.Length);
    });
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function allRowsExceptTopAndBottomHaveTwoIdenticalLetters(char letter) {
    var actual = Diamond.Make(letter);

    var rows = Rows(actual).Where(row => !row.Contains('A'));

    Assert.All(rows, row =>
    {
        var twoCharacters = row.Replace(" ", "").Length == 2;
        var identicalCharacters = row.Replace(" ", "").Distinct().Count() == 1;
        test:assertTrue(twoCharacters && identicalCharacters, "Does not have two identical letters");
    });
}

[DiamondProperty(Skip = "Remove this Skip property to run this test")]
function bottomLeftCornerSpacesAreTriangle(char letter) {
    var actual = Diamond.Make(letter);

    var rows = Rows(actual);

    var cornerSpaces = rows.Reverse().SkipWhile(row => !row.Contains(letter)).Select(LeadingSpaces);
    var spaceCounts = cornerSpaces.Select(row => row.Length).ToList();
    var expected = Enumerable.Range(0, spaceCounts.Count).Select(i => i).ToList();

    test:assertEquals(expected, spaceCounts);
}
}

public DiamondPropertyAttribute()
    Arbitrary = [ typeof(LettersOnlyStringArbitrary) ];
}
}

public static class LettersOnlyStringArbitrary
public static Arbitrary<char> Chars()
    return Arb.Default.Char().Filter(x => x >= 'A' && x <= 'Z');
}
