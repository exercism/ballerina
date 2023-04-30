import ballerina/test;

private readonly Robot robot = new Robot();

@test:Config {
    enable: false
}
function robotHasAName() {
    Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
}

@test:Config {
    enable: false
}
function nameIsTheSameEachTime() {
    test:assertEquals(robot.Name, robot.Name);
}

@test:Config {
    enable: false
}
function differentRobotsHaveDifferentNames() {
    var robot2 = new Robot();
    Assert.NotEqual(robot2.Name, robot.Name);
}

@test:Config {
    enable: false
}
function canResetTheName() {
    var originalName = robot.Name;
    robot.Reset();
    Assert.NotEqual(originalName, robot.Name);
}

@test:Config {
    enable: false
}
function afterResetTheNameIsValid() {
    robot.Reset();
    Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
}

@test:Config {
    enable: false
}
function robotNamesAreUnique() {
    const int robotsCount = 10_000;
    var robots = new List<Robot>(robotsCount); // Needed to keep a reference to the robots as IDs of recycled robots may be re-issued
    var names = new HashSet<string>(robotsCount);
    for (int i = 0; i < robotsCount; i++) {
        var robot = new Robot();
        robots.Add(robot);
        test:assertTrue(names.Add(robot.Name));
        Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
    }
}

@test:Config {
    enable: false
}
function robotNamesShouldGenerateEdgeCaseA() {
    const int robotsCount = 10_000;
    var robots = Enumerable.Range(0,robotsCount).Select( x => new Robot());
    Assert.Contains(robots, robot => robot.Name.Contains('A'));
}

@test:Config {
    enable: false
}
function robotNamesShouldGenerateEdgeCaseZ() {
    const int robotsCount = 10_000;
    var robots = Enumerable.Range(0,robotsCount).Select( x => new Robot());
    Assert.Contains(robots, robot => robot.Name.Contains('Z'));
}
