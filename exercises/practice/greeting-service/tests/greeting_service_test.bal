import ballerina/http;
import ballerina/test;

@test:Config
function testFunc() {
    http:Client httpEndpoint = new("http://localhost:9090");

    string payload = "Ballerina";

    var response = httpEndpoint->post("/greeting", payload);
    if (response is http:Response) {
        var res = response.getTextPayload();
        if (res is string) {
            test:assertEquals(res, "Hello, " + payload + "!");
        } else {
            test:assertFail(msg = "Failed to get the text payload from response.");
        }
    } else {
        test:assertFail(msg = "Failed to call the endpoint.");
    }
}
