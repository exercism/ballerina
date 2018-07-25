import ballerina/http;
import ballerina/io;

endpoint http:Listener listener {
  port:9090
};

service<http:Service> greeting bind listener {

  greet (endpoint caller, http:Request request) {
    http:Response response = new; 
    response.setTextPayload("Dummy Response");
    _ = caller -> respond(response);
  }
}