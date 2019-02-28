import ballerina/http;
import ballerina/io;
import ballerina/log;


// The quote service runs on http://localhost:9095/brainyquote and you neeed to invoke it by sending a
// HTTP GET request.
http:Client quoteEp = new("http://localhost:9095/");
// InvokerService is pinned on the URI path "/quote"
@http:ServiceConfig { basePath:"/quote" }
service InvokerService on new http:Listener(9090) {
  @http:ResourceConfig {
    path: "/"
  }
  resource function invokeService(http:Caller caller, http:Request request) returns error? {
      // Invoke quote service and send a HTTP GET request
      // Extract and log the quote from the response message.
      // Send the responce back to the caller.
  }
}