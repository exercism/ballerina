import ballerina/http;
import ballerina/io;
import ballerina/runtime;
import ballerina/math; 

endpoint http:Listener listener {
    port:9095
}; 

int req_counter = 0; 

@http:ServiceConfig {basePath:"/brainyquote"}
service<http:Service> QuoteService bind listener {

    @http:ResourceConfig{
        path: "/",  methods: ["GET"]
    }
    getQuote (endpoint caller, http:Request request) {
        http:Response response;
        string payload = getDefaultQuote();
        _ = caller -> respond(payload);
    } 
}


function getDefaultQuote () returns (string) {
    string[] quotes = [ "Many of life’s failures are people who did not realize how close they were to success when they gave up. - Thomas A. Edison\n"];
    return quotes[0]; 
}