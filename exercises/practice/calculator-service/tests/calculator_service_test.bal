import ballerina/test;
import ballerina/http;

@test:Config
function testFunc() returns error? {
    http:Client httpEndpoint = check new ("http://localhost:9090");
    float opr1 = 10.1;
    float opr2 = 4.2;

    json res_j = check httpEndpoint->post("/calc", {"operand1": opr1, "operand2": opr2, "operator": "+"});
    float result = <float>check res_j.result;
    test:assertEquals(result, opr1 + opr2);
    test:assertEquals(res_j.expression, "10.1+4.2");

    res_j = check httpEndpoint->post("/calc", {"operand1": 1, "operand2": 1, "operator": "$"});
    test:assertEquals(res_j.result, 0);
    test:assertEquals(res_j.expression, "1$1");


    
}
