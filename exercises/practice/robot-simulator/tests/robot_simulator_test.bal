import ballerina/test;

@test:Config {
    enable: false
}
function createRobotAtOriginFacingNorth() {
    var sut = new RobotSimulator(Direction.North, 0, 0);
    test:assertEquals(Direction.North, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function createRobotAtNegativePositionFacingSouth() {
    var sut = new RobotSimulator(Direction.South, -1, -1);
    test:assertEquals(Direction.South, sut.Direction);
    test:assertEquals(-1, sut.X);
    test:assertEquals(-1, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingClockwiseChangesNorthToEast() {
    var sut = new RobotSimulator(Direction.North, 0, 0);
    sut.Move("R");
    test:assertEquals(Direction.East, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingClockwiseChangesEastToSouth() {
    var sut = new RobotSimulator(Direction.East, 0, 0);
    sut.Move("R");
    test:assertEquals(Direction.South, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingClockwiseChangesSouthToWest() {
    var sut = new RobotSimulator(Direction.South, 0, 0);
    sut.Move("R");
    test:assertEquals(Direction.West, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingClockwiseChangesWestToNorth() {
    var sut = new RobotSimulator(Direction.West, 0, 0);
    sut.Move("R");
    test:assertEquals(Direction.North, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingCounterClockwiseChangesNorthToWest() {
    var sut = new RobotSimulator(Direction.North, 0, 0);
    sut.Move("L");
    test:assertEquals(Direction.West, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingCounterClockwiseChangesWestToSouth() {
    var sut = new RobotSimulator(Direction.West, 0, 0);
    sut.Move("L");
    test:assertEquals(Direction.South, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingCounterClockwiseChangesSouthToEast() {
    var sut = new RobotSimulator(Direction.South, 0, 0);
    sut.Move("L");
    test:assertEquals(Direction.East, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function rotatingCounterClockwiseChangesEastToNorth() {
    var sut = new RobotSimulator(Direction.East, 0, 0);
    sut.Move("L");
    test:assertEquals(Direction.North, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function movingForwardOneFacingNorthIncrementsY() {
    var sut = new RobotSimulator(Direction.North, 0, 0);
    sut.Move("A");
    test:assertEquals(Direction.North, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(1, sut.Y);
}

@test:Config {
    enable: false
}
function movingForwardOneFacingSouthDecrementsY() {
    var sut = new RobotSimulator(Direction.South, 0, 0);
    sut.Move("A");
    test:assertEquals(Direction.South, sut.Direction);
    test:assertEquals(0, sut.X);
    test:assertEquals(-1, sut.Y);
}

@test:Config {
    enable: false
}
function movingForwardOneFacingEastIncrementsX() {
    var sut = new RobotSimulator(Direction.East, 0, 0);
    sut.Move("A");
    test:assertEquals(Direction.East, sut.Direction);
    test:assertEquals(1, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function movingForwardOneFacingWestDecrementsX() {
    var sut = new RobotSimulator(Direction.West, 0, 0);
    sut.Move("A");
    test:assertEquals(Direction.West, sut.Direction);
    test:assertEquals(-1, sut.X);
    test:assertEquals(0, sut.Y);
}

@test:Config {
    enable: false
}
function followSeriesOfInstructionsMovingEastAndNorthFromReadme() {
    var sut = new RobotSimulator(Direction.North, 7, 3);
    sut.Move("RAALAL");
    test:assertEquals(Direction.West, sut.Direction);
    test:assertEquals(9, sut.X);
    test:assertEquals(4, sut.Y);
}

@test:Config {
    enable: false
}
function followSeriesOfInstructionsMovingWestAndNorth() {
    var sut = new RobotSimulator(Direction.North, 0, 0);
    sut.Move("LAAARALA");
    test:assertEquals(Direction.West, sut.Direction);
    test:assertEquals(-4, sut.X);
    test:assertEquals(1, sut.Y);
}

@test:Config {
    enable: false
}
function followSeriesOfInstructionsMovingWestAndSouth() {
    var sut = new RobotSimulator(Direction.East, 2, -7);
    sut.Move("RRAAAAALA");
    test:assertEquals(Direction.South, sut.Direction);
    test:assertEquals(-3, sut.X);
    test:assertEquals(-8, sut.Y);
}

@test:Config {
    enable: false
}
function followSeriesOfInstructionsMovingEastAndNorth() {
    var sut = new RobotSimulator(Direction.South, 8, 4);
    sut.Move("LAAARRRALLLL");
    test:assertEquals(Direction.North, sut.Direction);
    test:assertEquals(11, sut.X);
    test:assertEquals(5, sut.Y);
}
