import ballerina/http;

endpoint http:Listener listener {
  port:9090
};

@http:ServiceConfig {
  basePath: "/"
}
service<http:Service> CalculatorService bind listener {

  @http:ResourceConfig {
    path: "/calc",
    methods: ["POST"],
    consumes: "application/json"
    produces: "application/json"
  }
  calc (endpoint caller, http:Request request) {
    http:Response response; 
    json request_j = check request.getJsonPayload(); 

    float opr1 =  check <float> request_j.operand1; 
    float opr2 = check <float> request_j.operand2; 
    string operator = check <string> request_j.operator; 
    int id = check <int> request_j.caller_id; 

    float result = 0.0; 
    if (operator == "+") {
      result = opr1 + opr2; 
    } else if (operator == "-") {
      result = opr1 - opr2;       
    } else if (operator == "*" || operator == "x") {
      result = opr1 * opr2;       
    } else if (operator == "/") {
      result = opr1/opr2;       
    }

    json result_j = {result:result, callerId:id};
    response.setPayload(untaint result_j); 
    _ = caller -> respond(response);
  }
}