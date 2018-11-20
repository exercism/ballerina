import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
    basePath: "/"
}
service<http:Service> EchoService bind { port: 9090 } {

    // Invoke all resources with arguments of server connector and request.

    @http:ResourceConfig {
        methods: ["POST"]
    }
    echo(endpoint caller, http:Request req) {
        http:Response res; 
        string payload = check req.getPayloadAsString(); 
        res.setPayload(untaint payload);
        _ = caller->respond(res); 
    }
}
