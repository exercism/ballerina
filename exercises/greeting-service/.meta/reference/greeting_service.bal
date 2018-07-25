import ballerina/http;
import ballerina/io;

endpoint http:Listener listener {
  port:9090
};

@http:ServiceConfig {
    basePath:"/greeting"
}
service<http:Service> greeting bind listener {

  @http:ResourceConfig{
    path: "/",
    methods: ["POST"]
  }
  greet (endpoint caller, http:Request request) {
    http:Response response = new; 
    string reqPayload = check request.getPayloadAsString();
    response.setTextPayload("Hello, " + untaint reqPayload
                  + "!\n");
    _ = caller -> respond(response);
  }
}