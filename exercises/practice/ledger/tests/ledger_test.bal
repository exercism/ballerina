import ballerina/test;

@test:Config {
    enable: false
}
function emptyLedger() {
    var currency = "USD";
    var locale = "en-US";
    var entries = [];
    var expected =
        "Date       | Description               | Change       ";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function oneEntry() {
    var currency = "USD";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-01", "Buy present", -1000)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Buy present               |      ($10.00)";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function creditAndDebit() {
    var currency = "USD";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-02", "Get present", 1000),
        Ledger.CreateEntry("2015-01-01", "Buy present", -1000)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Buy present               |      ($10.00)\n" +
        "01/02/2015 | Get present               |       $10.00 ";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function multipleEntriesOnSameDateOrderedByDescription() {
    var currency = "USD";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-01", "Buy present", -1000),
        Ledger.CreateEntry("2015-01-01", "Get present", 1000)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Buy present               |      ($10.00)\n" +
        "01/01/2015 | Get present               |       $10.00 ";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function finalOrderTieBreakerIsChange() {
    var currency = "USD";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-01", "Something", 0),
        Ledger.CreateEntry("2015-01-01", "Something", -1),
        Ledger.CreateEntry("2015-01-01", "Something", 1)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Something                 |       ($0.01)\n" +
        "01/01/2015 | Something                 |        $0.00 \n" +
        "01/01/2015 | Something                 |        $0.01 ";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function overlongDescriptions() {
    var currency = "USD";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-01", "Freude schoner Gotterfunken", -123456)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Freude schoner Gotterf... |   ($1,234.56)";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function euros() {
    var currency = "EUR";
    var locale = "en-US";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-01-01", "Buy present", -1000)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "01/01/2015 | Buy present               |      (€10.00)";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function dutchLocale() {
    var currency = "USD";
    var locale = "nl-NL";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-03-12", "Buy present", 123456)
    };
    var expected =
        "Datum      | Omschrijving              | Verandering  \n" +
        "12-03-2015 | Buy present               |   $ 1.234,56 ";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function dutchNegativeNumberWith_3DigitsBeforeDecimalPoint() {
    var currency = "USD";
    var locale = "nl-NL";
    var entries = new[] 
    {
        Ledger.CreateEntry("2015-03-12", "Buy present", -12345)
    };
    var expected =
        "Datum      | Omschrijving              | Verandering  \n" +
        "12-03-2015 | Buy present               |     $ -123,45";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}

@test:Config {
    enable: false
}
function americanNegativeNumberWith_3DigitsBeforeDecimalPoint() {
    var currency = "USD";
    var locale = "en-US";
    var entries =   new[] 
    {
        Ledger.CreateEntry("2015-03-12", "Buy present", -12345)
    };
    var expected =
        "Date       | Description               | Change       \n" +
        "03/12/2015 | Buy present               |     ($123.45)";

    test:assertEquals(expected, Ledger.Format(currency, locale, entries));
}
