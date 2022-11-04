import ballerina/http;
import ballerina/test;

@test:Config
function testFunc() returns error? {
    // Invoking the main function
    final http:Client httpEndpoint = check new ("http://localhost:9090");

    string payload = "Hello, World!";

    // Send a GET request to the specified endpoint
    http:Response response = check httpEndpoint->get("/greeting");
    var res = response.getTextPayload();
    if (res is string) {
        test:assertEquals(res, payload);
    } else {
        test:assertFail(msg = "Failed to get the text payload from response.");
    }
}
