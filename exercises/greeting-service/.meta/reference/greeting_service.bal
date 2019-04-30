import ballerina/http;
import ballerina/log;

listener http:Listener listenerEP = new(9090);

service greeting on listenerEP {

    @http:ResourceConfig {
        path: "/",
        methods: ["POST"]
    }
    resource function greet(http:Caller caller, http:Request request) returns error? {
        string reqPayload = check request.getTextPayload();
        string resPayload = "Hello, " + untaint reqPayload + "!";
        var responseResult = caller->respond(resPayload);
        if (responseResult is error) {
            log:printError("error responding back to client.", err = responseResult);
        }
    }
}
