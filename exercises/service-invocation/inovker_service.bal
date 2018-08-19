import ballerina/http;
import ballerina/io;
import ballerina/log;


// The quote service runs on http://localhost:9095/brainyquote and you neeed to invoke it by sending a
// HTTP GET request.

// InvokerService is pinned on the URI path "/quote"
service<http:Service> InvokerService bind { port:9090 } {
  @http:ResourceConfig {
    path: "/"
  }
  invoke (endpoint caller, http:Request request) {
      // Invoke quote service and send a HTTP GET request
      // Extract and log the quote from the response message.
      // Send the responce back to the caller.
  }
}