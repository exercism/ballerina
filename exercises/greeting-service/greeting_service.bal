import ballerina/http;

listener http:Listener listenerEP = new(9090);

service greeting on listenerEP {


    resource function greet(http:Caller caller, http:Request request) returns error? {

        string resPayload = "Dummy Response";
        _ = caller->respond(resPayload);
    }
}
