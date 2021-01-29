import ballerina/http;
import ballerina/io;
import ballerina/log;

http:Client quoteEp = new("http://localhost:9095/");

@http:ServiceConfig {
    basePath: "/quote"
}
service InvokerService on new http:Listener(9090) {
    @http:ResourceConfig {
        path: "/"
    }
    resource function invoke(http:Caller caller, http:Request request) returns error? {
        http:Response response = new;
        http:Response quote = check quoteEp->get("/brainyquote");
        string payload = untaint check quote.getTextPayload();
        response.setTextPayload(payload);
        log:printInfo("Quote :" + payload);
        var responseResult = caller->respond(response);
        if (responseResult is error) {
            log:printError("error responding back to client.", err = responseResult);
        }
    }
}