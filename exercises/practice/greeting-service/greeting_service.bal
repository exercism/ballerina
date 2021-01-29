import ballerina/http;

listener http:Listener listenerEP = new(9090);

service greeting on listenerEP {

    @http:ResourceConfig {
        path: "/",
        methods: ["POST"]
    }
    resource function greet(http:Caller caller, http:Request request) returns error? {
        // Extract payload content and append it with the content of the greeting message.
        // Send the response back to the caller.

    }
}
