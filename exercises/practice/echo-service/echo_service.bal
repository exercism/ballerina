import ballerina/http;

@http:ServiceConfig {
    basePath: "/"
}
service EchoService on new http:Listener(9090) {

    // Resource returns the same request payload back to the client.
    @http:ResourceConfig {
        methods: ["POST"]
    }
    resource function echo(http:Caller caller, http:Request req) returns error? {
        // Extract the payload from the response and return back to the client
        // as a response.

    }
}
