import ballerina/http;

@http:ServiceConfig {
  basePath: "/"
}
service CalculatorService on new http:Listener(9090) {

  @http:ResourceConfig {
    path: "/calc",
    methods: ["POST"],
    consumes: ["application/json"],
    produces: ["application/json"]
  }
  resource function calc (http:Caller caller, http:Request request) {
    http:Response response = new; 
    json request_j = <json> request.getJsonPayload(); 

    float opr1 =  <float> float.convert(request_j.operand1); 
    float opr2 = <float> float.convert(request_j.operand2); 
    string operator = <string> string.convert(request_j.operator); 
    int id = <int> int.convert(request_j.caller_id); 

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