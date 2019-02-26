import ballerina/test;
import ballerina/io;
import ballerina/http;

@test:Config {}
function testFunc() {
    http:Client httpEndpoint = new("http://localhost:9090");
    var response = httpEndpoint->get("/quote");
    if (response is http:Response) {
        test:assertEquals(response.statusCode, 200);
    } else {
        test:assertFail(msg = "Failed to call the endpoint:");
    }
}
