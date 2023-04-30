import ballerina/test;

@test:Config {
    enable: false
}
function oneFileOneMatchNoFlags() {
    var pattern = "Agamemnon";
    var flags = "";
    var files = [ "iliad.txt" ];
    var expected = "Of Atreus, Agamemnon, King of men.";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchPrintLineNumbersFlag() {
    var pattern = "Forbidden";
    var flags = "-n";
    var files = [ "paradise-lost.txt" ];
    var expected = "2:Of that Forbidden Tree, whose mortal tast";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchCaseInsensitiveFlag() {
    var pattern = "FORBIDDEN";
    var flags = "-i";
    var files = [ "paradise-lost.txt" ];
    var expected = "Of that Forbidden Tree, whose mortal tast";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchPrintFileNamesFlag() {
    var pattern = "Forbidden";
    var flags = "-l";
    var files = [ "paradise-lost.txt" ];
    var expected = "paradise-lost.txt";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchMatchEntireLinesFlag() {
    var pattern = "With loss of Eden, till one greater Man";
    var flags = "-x";
    var files = [ "paradise-lost.txt" ];
    var expected = "With loss of Eden, till one greater Man";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchMultipleFlags() {
    var pattern = "OF ATREUS, Agamemnon, KIng of MEN.";
    var flags = "-n -i -x";
    var files = [ "iliad.txt" ];
    var expected = "9:Of Atreus, Agamemnon, King of men.";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesNoFlags() {
    var pattern = "may";
    var flags = "";
    var files = [ "midsummer-night.txt" ];
    var expected = 
        "Nor how it may concern my modesty,\n" +
        "But I beseech your grace that I may know\n" +
        "The worst that may befall me in this case,";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesPrintLineNumbersFlag() {
    var pattern = "may";
    var flags = "-n";
    var files = [ "midsummer-night.txt" ];
    var expected = 
        "3:Nor how it may concern my modesty,\n" +
        "5:But I beseech your grace that I may know\n" +
        "6:The worst that may befall me in this case,";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesMatchEntireLinesFlag() {
    var pattern = "may";
    var flags = "-x";
    var files = [ "midsummer-night.txt" ];
    var expected = "";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesCaseInsensitiveFlag() {
    var pattern = "ACHILLES";
    var flags = "-i";
    var files = [ "iliad.txt" ];
    var expected = 
        "Achilles sing, O Goddess! Peleus' son;\n" +
        "The noble Chief Achilles from the son";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesInvertedFlag() {
    var pattern = "Of";
    var flags = "-v";
    var files = [ "paradise-lost.txt" ];
    var expected = 
        "Brought Death into the World, and all our woe,\n" +
        "With loss of Eden, till one greater Man\n" +
        "Restore us, and regain the blissful Seat,\n" +
        "Sing Heav'nly Muse, that on the secret top\n" +
        "That Shepherd, who first taught the chosen Seed";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileNoMatchesVariousFlags() {
    var pattern = "Gandalf";
    var flags = "-n -l -x -i";
    var files = [ "iliad.txt" ];
    var expected = "";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileOneMatchFileFlagTakesPrecedenceOverLineFlag() {
    var pattern = "ten";
    var flags = "-n -l";
    var files = [ "iliad.txt" ];
    var expected = "iliad.txt";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function oneFileSeveralMatchesInvertedAndMatchEntireLinesFlags() {
    var pattern = "Illustrious into Ades premature,";
    var flags = "-x -v";
    var files = [ "iliad.txt" ];
    var expected = 
        "Achilles sing, O Goddess! Peleus' son;\n" +
        "His wrath pernicious, who ten thousand woes\n" +
        "Caused to Achaia's host, sent many a soul\n" +
        "And Heroes gave (so stood the will of Jove)\n" +
        "To dogs and to all ravening fowls a prey,\n" +
        "When fierce dispute had separated once\n" +
        "The noble Chief Achilles from the son\n" +
        "Of Atreus, Agamemnon, King of men.";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesOneMatchNoFlags() {
    var pattern = "Agamemnon";
    var flags = "";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = "iliad.txt:Of Atreus, Agamemnon, King of men.";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesNoFlags() {
    var pattern = "may";
    var flags = "";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "midsummer-night.txt:Nor how it may concern my modesty,\n" +
        "midsummer-night.txt:But I beseech your grace that I may know\n" +
        "midsummer-night.txt:The worst that may befall me in this case,";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesPrintLineNumbersFlag() {
    var pattern = "that";
    var flags = "-n";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "midsummer-night.txt:5:But I beseech your grace that I may know\n" +
        "midsummer-night.txt:6:The worst that may befall me in this case,\n" +
        "paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast\n" +
        "paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesOneMatchPrintFileNamesFlag() {
    var pattern = "who";
    var flags = "-l";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "iliad.txt\n" +
        "paradise-lost.txt";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesCaseInsensitiveFlag() {
    var pattern = "TO";
    var flags = "-i";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "iliad.txt:Caused to Achaia's host, sent many a soul\n" +
        "iliad.txt:Illustrious into Ades premature,\n" +
        "iliad.txt:And Heroes gave (so stood the will of Jove)\n" +
        "iliad.txt:To dogs and to all ravening fowls a prey,\n" +
        "midsummer-night.txt:I do entreat your grace to pardon me.\n" +
        "midsummer-night.txt:In such a presence here to plead my thoughts;\n" +
        "midsummer-night.txt:If I refuse to wed Demetrius.\n" +
        "paradise-lost.txt:Brought Death into the World, and all our woe,\n" +
        "paradise-lost.txt:Restore us, and regain the blissful Seat,\n" +
        "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesInvertedFlag() {
    var pattern = "a";
    var flags = "-v";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "iliad.txt:Achilles sing, O Goddess! Peleus' son;\n" +
        "iliad.txt:The noble Chief Achilles from the son\n" +
        "midsummer-night.txt:If I refuse to wed Demetrius.";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesOneMatchMatchEntireLinesFlag() {
    var pattern = "But I beseech your grace that I may know";
    var flags = "-x";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = "midsummer-night.txt:But I beseech your grace that I may know";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesOneMatchMultipleFlags() {
    var pattern = "WITH LOSS OF EDEN, TILL ONE GREATER MAN";
    var flags = "-n -i -x";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = "paradise-lost.txt:4:With loss of Eden, till one greater Man";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesNoMatchesVariousFlags() {
    var pattern = "Frodo";
    var flags = "-n -l -x -i";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = "";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesFileFlagTakesPrecedenceOverLineNumberFlag() {
    var pattern = "who";
    var flags = "-n -l";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "iliad.txt\n" +
        "paradise-lost.txt";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

@test:Config {
    enable: false
}
function multipleFilesSeveralMatchesInvertedAndMatchEntireLinesFlags() {
    var pattern = "Illustrious into Ades premature,";
    var flags = "-x -v";
    var files = [ "iliad.txt", "midsummer-night.txt", "paradise-lost.txt" ];
    var expected = 
        "iliad.txt:Achilles sing, O Goddess! Peleus' son;\n" +
        "iliad.txt:His wrath pernicious, who ten thousand woes\n" +
        "iliad.txt:Caused to Achaia's host, sent many a soul\n" +
        "iliad.txt:And Heroes gave (so stood the will of Jove)\n" +
        "iliad.txt:To dogs and to all ravening fowls a prey,\n" +
        "iliad.txt:When fierce dispute had separated once\n" +
        "iliad.txt:The noble Chief Achilles from the son\n" +
        "iliad.txt:Of Atreus, Agamemnon, King of men.\n" +
        "midsummer-night.txt:I do entreat your grace to pardon me.\n" +
        "midsummer-night.txt:I know not by what power I am made bold,\n" +
        "midsummer-night.txt:Nor how it may concern my modesty,\n" +
        "midsummer-night.txt:In such a presence here to plead my thoughts;\n" +
        "midsummer-night.txt:But I beseech your grace that I may know\n" +
        "midsummer-night.txt:The worst that may befall me in this case,\n" +
        "midsummer-night.txt:If I refuse to wed Demetrius.\n" +
        "paradise-lost.txt:Of Mans First Disobedience, and the Fruit\n" +
        "paradise-lost.txt:Of that Forbidden Tree, whose mortal tast\n" +
        "paradise-lost.txt:Brought Death into the World, and all our woe,\n" +
        "paradise-lost.txt:With loss of Eden, till one greater Man\n" +
        "paradise-lost.txt:Restore us, and regain the blissful Seat,\n" +
        "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top\n" +
        "paradise-lost.txt:Of Oreb, or of Sinai, didst inspire\n" +
        "paradise-lost.txt:That Shepherd, who first taught the chosen Seed";
    test:assertEquals(expected, Grep.Match(pattern, flags, files));
}

private const string IliadFileName = "iliad.txt";
private const string IliadContents =
    "Achilles sing, O Goddess! Peleus' son;\n" +
    "His wrath pernicious, who ten thousand woes\n" +
    "Caused to Achaia's host, sent many a soul\n" +
    "Illustrious into Ades premature,\n" +
    "And Heroes gave (so stood the will of Jove)\n" +
    "To dogs and to all ravening fowls a prey,\n" +
    "When fierce dispute had separated once\n" +
    "The noble Chief Achilles from the son\n" +
    "Of Atreus, Agamemnon, King of men.\n";

private const string MidsummerNightFileName = "midsummer-night.txt";
private const string MidsummerNightContents =
    "I do entreat your grace to pardon me.\n" +
    "I know not by what power I am made bold,\n" +
    "Nor how it may concern my modesty,\n" +
    "In such a presence here to plead my thoughts;\n" +
    "But I beseech your grace that I may know\n" +
    "The worst that may befall me in this case,\n" +
    "If I refuse to wed Demetrius.\n";

private const string ParadiseLostFileName = "paradise-lost.txt";
private const string ParadiseLostContents =
    "Of Mans First Disobedience, and the Fruit\n" +
    "Of that Forbidden Tree, whose mortal tast\n" +
    "Brought Death into the World, and all our woe,\n" +
    "With loss of Eden, till one greater Man\n" +
    "Restore us, and regain the blissful Seat,\n" +
    "Sing Heav'nly Muse, that on the secret top\n" +
    "Of Oreb, or of Sinai, didst inspire\n" +
    "That Shepherd, who first taught the chosen Seed\n";

public GrepTests()
    Directory.SetCurrentDirectory(Path.GetTempPath());
    File.WriteAllText(IliadFileName, IliadContents);
    File.WriteAllText(MidsummerNightFileName, MidsummerNightContents);
    File.WriteAllText(ParadiseLostFileName, ParadiseLostContents);
}

function dispose() {
    Directory.SetCurrentDirectory(Path.GetTempPath());
    File.Delete(IliadFileName);
    File.Delete(MidsummerNightFileName);
    File.Delete(ParadiseLostFileName);
}
