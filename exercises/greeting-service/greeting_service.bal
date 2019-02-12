import ballerina/http;

listener http:Listener listenerEP = new(9090);

service greeting on listenerEP {

    @http:ResourceConfig {
        path: "/",
        methods: ["POST"]
    }
    resource function greet(http:Caller caller, http:Request request) returns error? {
        string reqPayload = check request.getPayloadAsString();
        string resPayload = "Hello, " + untaint reqPayload + "!";
        _ = caller->respond(resPayload);
    }
}
