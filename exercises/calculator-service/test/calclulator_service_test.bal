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
    float opr1 = 10.1; 
    float opr2 = 4.2; 
    int id = 12345; 

    json req_j = { "operand1": opr1, "operand2": opr2, "operator": "+", "caller_id": id }; 
    req.setPayload(req_j); 

    var response = httpEndpoint->post("/calc", req); 
    match response {
        http:Response resp => {
            test:assertEquals(resp.statusCode, 200); 
            json res_j = check resp.getJsonPayload(); 
            float result = check <float> res_j.result; 
            test:assertEquals(result, opr1 + opr2);
        }
        error err => test:assertFail(msg = "Failed to call the endpoint:");
    }
}

function stopService() {
}