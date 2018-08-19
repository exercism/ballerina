import ballerina/http;
import ballerina/io;
import ballerina/log;


endpoint http:Client quoteEp {
  url: "http://localhost:9095/"  
};

@http:ServiceConfig {
  basePath: "/quote"
}
service<http:Service> WeatherInfoService bind { port:9090 } {
  @http:ResourceConfig {
    path: "/"
  }
  invoke (endpoint caller, http:Request request) {
    http:Response response = new; 
    http:Response quote = check quoteEp->get("/brainyquote"); 
    string payload = untaint check quote.getTextPayload();
    response.setTextPayload(payload);
    log:printInfo("Quote :" + payload);
    _ = caller -> respond(response);
  }
}