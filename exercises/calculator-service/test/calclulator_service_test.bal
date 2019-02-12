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
    http:Client httpEndpoint = new("http://localhost:9090");
    http:Request req = new;     
    float opr1 = 10.1; 
    float opr2 = 4.2; 
    int id = 12345; 

    json req_j = { "operand1": opr1, "operand2": opr2, "operator": "+", "caller_id": id }; 
    req.setPayload(req_j); 

    var response = httpEndpoint->post("/calc", req); 
    if (response is http:Response) {
        test:assertEquals(response.statusCode, 200);
        json res_j = <json> response.getJsonPayload();
        float result = <float> res_j.result; 
        test:assertEquals(result, opr1 + opr2);  
    } else {
        test:assertFail(msg = "Failed to call the endpoint:");
    }
}

function stopService() {
}