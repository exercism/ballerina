import ballerina/test;

@test:Config {
    enable: false
}
function chromaticScaleWithSharps() {
    var expected = [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ];
    test:assertEquals(expected, ScaleGenerator.Chromatic("C"));
}

@test:Config {
    enable: false
}
function chromaticScaleWithFlats() {
    var expected = [ "F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E" ];
    test:assertEquals(expected, ScaleGenerator.Chromatic("F"));
}

@test:Config {
    enable: false
}
function simpleMajorScale() {
    var expected = [ "C", "D", "E", "F", "G", "A", "B", "C" ];
    test:assertEquals(expected, ScaleGenerator.Interval("C", "MMmMMMm"));
}

@test:Config {
    enable: false
}
function majorScaleWithSharps() {
    var expected = [ "G", "A", "B", "C", "D", "E", "F#", "G" ];
    test:assertEquals(expected, ScaleGenerator.Interval("G", "MMmMMMm"));
}

@test:Config {
    enable: false
}
function majorScaleWithFlats() {
    var expected = [ "F", "G", "A", "Bb", "C", "D", "E", "F" ];
    test:assertEquals(expected, ScaleGenerator.Interval("F", "MMmMMMm"));
}

@test:Config {
    enable: false
}
function minorScaleWithSharps() {
    var expected = [ "F#", "G#", "A", "B", "C#", "D", "E", "F#" ];
    test:assertEquals(expected, ScaleGenerator.Interval("f#", "MmMMmMM"));
}

@test:Config {
    enable: false
}
function minorScaleWithFlats() {
    var expected = [ "Bb", "C", "Db", "Eb", "F", "Gb", "Ab", "Bb" ];
    test:assertEquals(expected, ScaleGenerator.Interval("bb", "MmMMmMM"));
}

@test:Config {
    enable: false
}
function dorianMode() {
    var expected = [ "D", "E", "F", "G", "A", "B", "C", "D" ];
    test:assertEquals(expected, ScaleGenerator.Interval("d", "MmMMMmM"));
}

@test:Config {
    enable: false
}
function mixolydianMode() {
    var expected = [ "Eb", "F", "G", "Ab", "Bb", "C", "Db", "Eb" ];
    test:assertEquals(expected, ScaleGenerator.Interval("Eb", "MMmMMmM"));
}

@test:Config {
    enable: false
}
function lydianMode() {
    var expected = [ "A", "B", "C#", "D#", "E", "F#", "G#", "A" ];
    test:assertEquals(expected, ScaleGenerator.Interval("a", "MMMmMMm"));
}

@test:Config {
    enable: false
}
function phrygianMode() {
    var expected = [ "E", "F", "G", "A", "B", "C", "D", "E" ];
    test:assertEquals(expected, ScaleGenerator.Interval("e", "mMMMmMM"));
}

@test:Config {
    enable: false
}
function locrianMode() {
    var expected = [ "G", "Ab", "Bb", "C", "Db", "Eb", "F", "G" ];
    test:assertEquals(expected, ScaleGenerator.Interval("g", "mMMmMMM"));
}

@test:Config {
    enable: false
}
function harmonicMinor() {
    var expected = [ "D", "E", "F", "G", "A", "Bb", "Db", "D" ];
    test:assertEquals(expected, ScaleGenerator.Interval("d", "MmMMmAm"));
}

@test:Config {
    enable: false
}
function octatonic() {
    var expected = [ "C", "D", "D#", "F", "F#", "G#", "A", "B", "C" ];
    test:assertEquals(expected, ScaleGenerator.Interval("C", "MmMmMmMm"));
}

@test:Config {
    enable: false
}
function hexatonic() {
    var expected = [ "Db", "Eb", "F", "G", "A", "B", "Db" ];
    test:assertEquals(expected, ScaleGenerator.Interval("Db", "MMMMMM"));
}

@test:Config {
    enable: false
}
function pentatonic() {
    var expected = [ "A", "B", "C#", "E", "F#", "A" ];
    test:assertEquals(expected, ScaleGenerator.Interval("A", "MMAMA"));
}

@test:Config {
    enable: false
}
function enigmatic() {
    var expected = [ "G", "G#", "B", "C#", "D#", "F", "F#", "G" ];
    test:assertEquals(expected, ScaleGenerator.Interval("G", "mAMMMmm"));
}
