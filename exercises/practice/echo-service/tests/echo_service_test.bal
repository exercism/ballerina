import ballerina/http;
import ballerina/test;

@test:Config
function testFunc() {
    http:Client httpEndpoint = new("http://localhost:9090");
    string payload = "Hello, World!";
    var response = httpEndpoint->post("/echo", payload);
    if (response is http:Response) {
        var res = response.getTextPayload();
        if (res is string) {
            test:assertEquals(res, payload);
        } else {
            test:assertFail(msg = "Failed to get the text payload from response.");
        }
    } else {
        test:assertFail(msg = "Failed to call the endpoint.");
    }
}
