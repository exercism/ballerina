import ballerina/http;
import ballerina/io;
import ballerina/runtime;
import ballerina/math;


@http:ServiceConfig { basePath: "/brainyquote" }
service QuoteService on new http:Listener(9095) {

    @http:ResourceConfig{
        path: "/",  methods: ["GET"]
    }
    resource function getQuote (http:Caller caller, http:Request request) {
        http:Response response;
        string payload = getDefaultQuote();
        var responseResult = caller->respond(payload);
        if (responseResult is error) {
            io:println("error responding back to client.");
        }
    }
}

function getDefaultQuote () returns (string) {
    string[] quotes = [ "Many of life’s failures are people who did not realize how close they were to success when they gave up. - Thomas A. Edison\n"];
    return quotes[0];
}