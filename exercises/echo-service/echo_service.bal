
import ballerina/http;
import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
    basePath: "/"
}
service<http:Service> EchoService bind { port: 9090 } {

    // Resource returns the same request payload back to the client. 
    // ToDo: Restrict the resource to only accept HTTP POST requests 
    echo(endpoint caller, http:Request req) {
        http:Response res; 
        res.setPayload("payload"); 
        // Extract the payload from the response and return back to the client 
        // as a response. 
        _ = caller->respond(res); 
    }
}
