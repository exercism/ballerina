import ballerina/test;

@test:Config
function testPartialGardenForAlice1() {
    KindergartenGarden garden = new KindergartenGarden("RC\nGG");
    test:assertEquals(garden.plants("Alice"), ["radishes", "clover", "grass", "grass"]);
}

@test:Config {
    enable: false
}
function testPartialGardenForAlice2() {
    KindergartenGarden garden = new KindergartenGarden("VC\nRC");
    test:assertEquals(garden.plants("Alice"), ["violets", "clover", "radishes", "clover"]);
}

@test:Config {
    enable: false
}
function testPartialGardenForBob1() {
    KindergartenGarden garden = new KindergartenGarden("VVCG\nVVRC");
    test:assertEquals(garden.plants("Bob"), ["clover", "grass", "radishes", "clover"]);
}

@test:Config {
    enable: false
}
function testPartialGardenForBob2() {
    KindergartenGarden garden = new KindergartenGarden("VVCCGG\nVVCCGG");
    test:assertEquals(garden.plants("Bob"), ["clover", "clover", "clover", "clover"]);
}

@test:Config {
    enable: false
}
function testPartialGardenForCharlie() {
    KindergartenGarden garden = new KindergartenGarden("VVCCGG\nVVCCGG");
    test:assertEquals(garden.plants("Charlie"), ["grass", "grass", "grass", "grass"]);
}

@test:Config {
    enable: false
}
function testFullGardenForAlice() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Alice"), ["violets", "radishes", "violets", "radishes"]);
}

@test:Config {
    enable: false
}
function testFullGardenForBob() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Bob"), ["clover", "grass", "clover", "clover"]);
}

@test:Config {
    enable: false
}
function testFullGardenForCharlie() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Charlie"), ["violets", "violets", "clover", "grass"]);
}

@test:Config {
    enable: false
}
function testFullGardenForDavid() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("David"), ["radishes", "violets", "clover", "radishes"]);
}

@test:Config {
    enable: false
}
function testFullGardenForEve() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Eve"), ["clover", "grass", "radishes", "grass"]);
}

@test:Config {
    enable: false
}
function testFullGardenForFred() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Fred"), ["grass", "clover", "violets", "clover"]);
}

@test:Config {
    enable: false
}
function testFullGardenForGinny() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Ginny"), ["clover", "grass", "grass", "clover"]);
}

@test:Config {
    enable: false
}
function testFullGardenForHarriet() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Harriet"), ["violets", "radishes", "radishes", "violets"]);
}

@test:Config {
    enable: false
}
function testFullGardenForIleana() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Ileana"), ["grass", "clover", "violets", "clover"]);
}

@test:Config {
    enable: false
}
function testFullGardenForJoseph() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Joseph"), ["violets", "clover", "violets", "grass"]);
}

@test:Config {
    enable: false
}
function testFullGardenForKincaid() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Kincaid"), ["grass", "clover", "clover", "grass"]);
}

@test:Config {
    enable: false
}
function testFullGardenForLarry() {
    KindergartenGarden garden = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals(garden.plants("Larry"), ["grass", "violets", "clover", "violets"]);
}