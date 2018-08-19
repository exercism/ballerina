import ballerina/test;
import ballerina/io;
import ballerina/http;

boolean serviceStarted;

function startService() {
}

@test:Config {
    before: "startService",
    after: "stopService"
}
function testFunc() {
    endpoint http:Client httpEndpoint { url: "http://localhost:9090" };
    http:Request req;     
    var response = httpEndpoint->get("/quote"); 
    match response {
        http:Response resp => {
            test:assertEquals(resp.statusCode, 200); 
        }
        error err => test:assertFail(msg = "Failed to call the endpoint:");
    }
}

function stopService() {
}