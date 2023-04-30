import ballerina/test;

@test:Config {
    enable: false
}
function wordBeginningWithA() {
    test:assertEquals("appleay", PigLatin.Translate("apple"));
}

@test:Config {
    enable: false
}
function wordBeginningWithE() {
    test:assertEquals("earay", PigLatin.Translate("ear"));
}

@test:Config {
    enable: false
}
function wordBeginningWithI() {
    test:assertEquals("iglooay", PigLatin.Translate("igloo"));
}

@test:Config {
    enable: false
}
function wordBeginningWithO() {
    test:assertEquals("objectay", PigLatin.Translate("object"));
}

@test:Config {
    enable: false
}
function wordBeginningWithU() {
    test:assertEquals("underay", PigLatin.Translate("under"));
}

@test:Config {
    enable: false
}
function wordBeginningWithAVowelAndFollowedByAQu() {
    test:assertEquals("equalay", PigLatin.Translate("equal"));
}

@test:Config {
    enable: false
}
function wordBeginningWithP() {
    test:assertEquals("igpay", PigLatin.Translate("pig"));
}

@test:Config {
    enable: false
}
function wordBeginningWithK() {
    test:assertEquals("oalakay", PigLatin.Translate("koala"));
}

@test:Config {
    enable: false
}
function wordBeginningWithX() {
    test:assertEquals("enonxay", PigLatin.Translate("xenon"));
}

@test:Config {
    enable: false
}
function wordBeginningWithQWithoutAFollowingU() {
    test:assertEquals("atqay", PigLatin.Translate("qat"));
}

@test:Config {
    enable: false
}
function wordBeginningWithCh() {
    test:assertEquals("airchay", PigLatin.Translate("chair"));
}

@test:Config {
    enable: false
}
function wordBeginningWithQu() {
    test:assertEquals("eenquay", PigLatin.Translate("queen"));
}

@test:Config {
    enable: false
}
function wordBeginningWithQuAndAPrecedingConsonant() {
    test:assertEquals("aresquay", PigLatin.Translate("square"));
}

@test:Config {
    enable: false
}
function wordBeginningWithTh() {
    test:assertEquals("erapythay", PigLatin.Translate("therapy"));
}

@test:Config {
    enable: false
}
function wordBeginningWithThr() {
    test:assertEquals("ushthray", PigLatin.Translate("thrush"));
}

@test:Config {
    enable: false
}
function wordBeginningWithSch() {
    test:assertEquals("oolschay", PigLatin.Translate("school"));
}

@test:Config {
    enable: false
}
function wordBeginningWithYt() {
    test:assertEquals("yttriaay", PigLatin.Translate("yttria"));
}

@test:Config {
    enable: false
}
function wordBeginningWithXr() {
    test:assertEquals("xrayay", PigLatin.Translate("xray"));
}

@test:Config {
    enable: false
}
function yIsTreatedLikeAConsonantAtTheBeginningOfAWord() {
    test:assertEquals("ellowyay", PigLatin.Translate("yellow"));
}

@test:Config {
    enable: false
}
function yIsTreatedLikeAVowelAtTheEndOfAConsonantCluster() {
    test:assertEquals("ythmrhay", PigLatin.Translate("rhythm"));
}

@test:Config {
    enable: false
}
function yAsSecondLetterInTwoLetterWord() {
    test:assertEquals("ymay", PigLatin.Translate("my"));
}

@test:Config {
    enable: false
}
function aWholePhrase() {
    test:assertEquals("ickquay astfay unray", PigLatin.Translate("quick fast run"));
}
