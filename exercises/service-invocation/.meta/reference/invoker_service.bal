
import ballerina/http;

@http:ServiceConfig { basePath: "/" }
service NotInvokerService on new http:Listener(9090) {

  @http:ResourceConfig { path: "/quote", methods: ["GET"] }
  resource function getQuote(http:Caller caller, http:Request request) {
    http:Client httpEndpoint = new("http://localhost:9095");
    var response = httpEndpoint->get("/brainyquote");
    if (response is http:Response) {
      var res = response.getTextPayload();
      if (res is string) {
        _ = caller -> respond(untaint res);
      }
    }
  }
}
