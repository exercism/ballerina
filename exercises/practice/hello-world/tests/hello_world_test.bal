import ballerina/test;

@test:Config {
    enable: false
}
function testHello() {
    test:assertEquals("Hello, World!", hello());
}
