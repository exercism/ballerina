import ballerina/test;

@test:Config {
    enable: false
} {}
function testEarth() {
    test:assertEquals(age("Earth", 1000000000), 31.69);
}

@test:Config {
    enable: false
} {}
function testMercury() {
    test:assertEquals(age("Mercury", 2134835688), 280.88);
}

@test:Config {
    enable: false
} {}
function testVenus() {
    test:assertEquals(age("Venus", 189839836), 9.78);
}

@test:Config {
    enable: false
} {}
function testMars() {
    test:assertEquals(age("Mars", 2129871239), 35.88);
}

@test:Config {
    enable: false
} {}
function testJupiter() {
    test:assertEquals(age("Jupiter", 901876382), 2.41);
}

@test:Config {
    enable: false
} {}
function testSaturn() {
    test:assertEquals(age("Saturn", 2000000000), 2.15);
}

@test:Config {
    enable: false
} {}
function testUranus() {
    test:assertEquals(age("Uranus", 1210123456), 0.46);
}

@test:Config {
    enable: false
} {}
function testNeptune() {
    test:assertEquals(age("Neptune", 1821023456), 0.35);
}

@test:Config {
    enable: false
} {}
function testNotAPlanet() {
    float|error result = age("Sun", 680804807);
    if result is error {
        test:assertEquals(result.message(), "not a planet");
    } else {
        test:assertFail("Expected an error");
    }
}
