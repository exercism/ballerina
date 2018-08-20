import ballerina/http;

endpoint http:Listener listener {
    port: 9090
};

@http:ServiceConfig {
    basePath: "/"
}
service<http:Service> CalculatorService bind listener {

    // Add HTTP reosurce configuration to accept request on path '/calc' and specify in and out content types
    // to 'application/json' using consumes and produces annotations.
    // Suppose that incoming JSON request is in the
    // form '{ "operand1": opr1, "operand2": opr2, "operator": "+", "caller_id": id }'.

    calc(endpoint caller, http:Request request) {
        http:Response response;

        // Extract the JSON payload from the request.

        // Extract operand1, operand2, operator, caller_id from the incoming JSON request and convert them
        // to required type.


        // result are stored here.
        float result = 0.0;

        // Check for each operator '+', '-', 'x' or '*' and '/'. and do the calculation


        // Create the response with the form e.g. { result: 0.0, callerId: 111 };

        // Set the JSON payload to the request as an untaint value

        _ = caller->respond(response);
    }
}