import ballerina/test;

@test:Config {
    enable: false
}
function justTheHeaderIfNoInput() {
    var rows = "";
    var expected = "Team                           | MP |  W |  D |  L |  P";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function aWinIsThreePointsALossIsZeroPoints() {
    var rows = "Allegoric Alaskans;Blithering Badgers;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3\n" +
        "Blithering Badgers             |  1 |  0 |  0 |  1 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function aWinCanAlsoBeExpressedAsALoss() {
    var rows = "Blithering Badgers;Allegoric Alaskans;loss";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3\n" +
        "Blithering Badgers             |  1 |  0 |  0 |  1 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function aDifferentTeamCanWin() {
    var rows = "Blithering Badgers;Allegoric Alaskans;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Blithering Badgers             |  1 |  1 |  0 |  0 |  3\n" +
        "Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function aDrawIsOnePointEach() {
    var rows = "Allegoric Alaskans;Blithering Badgers;draw";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1\n" +
        "Blithering Badgers             |  1 |  0 |  1 |  0 |  1";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function thereCanBeMoreThanOneMatch() {
    var rows = 
        "Allegoric Alaskans;Blithering Badgers;win\n" +
        "Allegoric Alaskans;Blithering Badgers;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6\n" +
        "Blithering Badgers             |  2 |  0 |  0 |  2 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function thereCanBeMoreThanOneWinner() {
    var rows = 
        "Allegoric Alaskans;Blithering Badgers;loss\n" +
        "Allegoric Alaskans;Blithering Badgers;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3\n" +
        "Blithering Badgers             |  2 |  1 |  0 |  1 |  3";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function thereCanBeMoreThanTwoTeams() {
    var rows = 
        "Allegoric Alaskans;Blithering Badgers;win\n" +
        "Blithering Badgers;Courageous Californians;win\n" +
        "Courageous Californians;Allegoric Alaskans;loss";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6\n" +
        "Blithering Badgers             |  2 |  1 |  0 |  1 |  3\n" +
        "Courageous Californians        |  2 |  0 |  0 |  2 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function typicalInput() {
    var rows = 
        "Allegoric Alaskans;Blithering Badgers;win\n" +
        "Devastating Donkeys;Courageous Californians;draw\n" +
        "Devastating Donkeys;Allegoric Alaskans;win\n" +
        "Courageous Californians;Blithering Badgers;loss\n" +
        "Blithering Badgers;Devastating Donkeys;loss\n" +
        "Allegoric Alaskans;Courageous Californians;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7\n" +
        "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6\n" +
        "Blithering Badgers             |  3 |  1 |  0 |  2 |  3\n" +
        "Courageous Californians        |  3 |  0 |  1 |  2 |  1";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function incompleteCompetitionNotAllPairsHavePlayed_() {
    var rows = 
        "Allegoric Alaskans;Blithering Badgers;loss\n" +
        "Devastating Donkeys;Allegoric Alaskans;loss\n" +
        "Courageous Californians;Blithering Badgers;draw\n" +
        "Allegoric Alaskans;Courageous Californians;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6\n" +
        "Blithering Badgers             |  2 |  1 |  1 |  0 |  4\n" +
        "Courageous Californians        |  2 |  0 |  1 |  1 |  1\n" +
        "Devastating Donkeys            |  1 |  0 |  0 |  1 |  0";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function tiesBrokenAlphabetically() {
    var rows = 
        "Courageous Californians;Devastating Donkeys;win\n" +
        "Allegoric Alaskans;Blithering Badgers;win\n" +
        "Devastating Donkeys;Allegoric Alaskans;loss\n" +
        "Courageous Californians;Blithering Badgers;win\n" +
        "Blithering Badgers;Devastating Donkeys;draw\n" +
        "Allegoric Alaskans;Courageous Californians;draw";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7\n" +
        "Courageous Californians        |  3 |  2 |  1 |  0 |  7\n" +
        "Blithering Badgers             |  3 |  0 |  1 |  2 |  1\n" +
        "Devastating Donkeys            |  3 |  0 |  1 |  2 |  1";
    test:assertEquals(expected, RunTally(rows));
}

@test:Config {
    enable: false
}
function ensurePointsSortedNumerically() {
    var rows = 
        "Devastating Donkeys;Blithering Badgers;win\n" +
        "Devastating Donkeys;Blithering Badgers;win\n" +
        "Devastating Donkeys;Blithering Badgers;win\n" +
        "Devastating Donkeys;Blithering Badgers;win\n" +
        "Blithering Badgers;Devastating Donkeys;win";
    var expected = 
        "Team                           | MP |  W |  D |  L |  P\n" +
        "Devastating Donkeys            |  5 |  4 |  0 |  1 | 12\n" +
        "Blithering Badgers             |  5 |  1 |  0 |  4 |  3";
    test:assertEquals(expected, RunTally(rows));
}

private string RunTally(string input)
    var encoding = new UTF8Encoding();
    using (var inStream = new MemoryStream(encoding.GetBytes(input)))
    using (var outStream = new MemoryStream())
    {
        Tournament.Tally(inStream, outStream);
        return encoding.GetString(outStream.ToArray());
    }
}
