import ballerina/test;

@test:Config {
    enable: false
}
function parsesNormalTextAsAParagraph() {
    var markdown = "This will be a paragraph";
    var expected = "<p>This will be a paragraph</p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function parsingItalics() {
    var markdown = "_This will be italic_";
    var expected = "<p><em>This will be italic</em></p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function parsingBoldText() {
    var markdown = "__This will be bold__";
    var expected = "<p><strong>This will be bold</strong></p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function mixedNormalItalicsAndBoldText() {
    var markdown = "This will Be_ _Mixed__";
    var expected = "<p>This will <em>be</em> <strong>mixed</strong></p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH1HeaderLevel() {
    var markdown = "# This will be an h1";
    var expected = "<h1>This will be an h1</h1>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH2HeaderLevel() {
    var markdown = "## This will be an h2";
    var expected = "<h2>This will be an h2</h2>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH3HeaderLevel() {
    var markdown = "### This will be an h3";
    var expected = "<h3>This will be an h3</h3>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH4HeaderLevel() {
    var markdown = "#### This will be an h4";
    var expected = "<h4>This will be an h4</h4>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH5HeaderLevel() {
    var markdown = "##### This will be an h5";
    var expected = "<h5>This will be an h5</h5>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withH6HeaderLevel() {
    var markdown = "###### This will be an h6";
    var expected = "<h6>This will be an h6</h6>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function h7HeaderLevelIsAParagraph() {
    var markdown = "####### This will not be an h7";
    var expected = "<p>####### This will not be an h7</p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function unorderedLists() {
    var markdown = 
        "* Item 1\n" +
        "* Item 2";
    var expected = "<ul><li>Item 1</li><li>Item 2</li></ul>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withALittleBitOfEverything() {
    var markdown = 
        "# Header!\n" +
        "* __Bold Item__\n" +
        "* _Italic Item_";
    var expected = "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withMarkdownSymbolsInTheHeaderTextThatShouldNotBeInterpreted() {
    var markdown = "# This is a header with # and * in the text";
    var expected = "<h1>This is a header with # and * in the text</h1>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withMarkdownSymbolsInTheListItemTextThatShouldNotBeInterpreted() {
    var markdown = 
        "* Item 1 with a # in the text\n" +
        "* Item 2 with * in the text";
    var expected = "<ul><li>Item 1 with a # in the text</li><li>Item 2 with * in the text</li></ul>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function withMarkdownSymbolsInTheParagraphTextThatShouldNotBeInterpreted() {
    var markdown = "This is a paragraph with # and * in the text";
    var expected = "<p>This is a paragraph with # and * in the text</p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}

@test:Config {
    enable: false
}
function unorderedListsCloseProperlyWithPrecedingAndFollowingLines() {
    var markdown = 
        "# Start a list\n" +
        "* Item 1\n" +
        "* Item 2\n" +
        "End a list";
    var expected = "<h1>Start a list</h1><ul><li>Item 1</li><li>Item 2</li></ul><p>End a list</p>";
    test:assertEquals(expected, Markdown.Parse(markdown));
}
