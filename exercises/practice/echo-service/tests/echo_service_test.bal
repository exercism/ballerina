import ballerina/http;
import ballerina/test;

http:Client testClient = check new ("http://localhost:8080");

@test:Config
public function testEcho() returns error? {
    string payload = "Hello";
    http:Response response = check testClient->get("/echo?sound=" + payload);
    var res = response.getTextPayload();
    if (res is string) {
        test:assertEquals(res, payload);
    } else {
        test:assertFail(msg = "Failed to get the text payload from response.");
    }
}

@test:Config
public function testEchoDefinition() returns error? {
    http:Response response = check testClient->get("/echo/definition");
    var res = response.getTextPayload();
    if (res is string) {
        test:assertEquals(res, "A sound or series of sounds caused by the reflection of sound waves from a surface back to the listener.");
    } else {
        test:assertFail(msg = "Failed to get the text payload from response.");
    }
}
