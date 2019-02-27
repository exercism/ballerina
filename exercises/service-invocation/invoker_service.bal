import ballerina/http;

// The quote service runs on http://localhost:9095/brainyquote and you neeed to invoke it by sending a
// HTTP GET request.

@http:ServiceConfig { basePath: "/" }
service InvokerService on new http:Listener(9090) {
  
  @http:ResourceConfig { path: "/quote", methods: ["GET"] }
  resource function invokeService(http:Caller caller, http:Request request) {
      // Invoke quote service and send a HTTP GET request
      // Extract and log the quote from the response message.
      // Send the responce back to the caller.  
  }
}