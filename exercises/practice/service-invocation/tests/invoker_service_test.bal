import ballerina/test;
import ballerina/io;
import ballerina/http;

@test:Config {}
function testFunc() {
    http:Client httpEndpoint = new("http://localhost:9090");
    var response = httpEndpoint->get("/quote");
    if (response is http:Response) {
        test:assertEquals(response.statusCode, 200);
        var payload = response.getTextPayload();
        if (payload is string) {
            boolean quoteFound = false;
            quotes.foreach(function(string quote) {
                if (quote == payload) {
                    quoteFound = true;
                }
            });
            test:assertEquals(quoteFound, true , msg = "Invalid quote received.");
        } else {
            test:assertFail(msg = "Invalid response payload received.");
        }
    } else {
        test:assertFail(msg = "Failed to call the endpoint:");
    }
}
