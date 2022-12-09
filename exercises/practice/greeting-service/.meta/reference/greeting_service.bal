import ballerina/http;

service on new http:Listener(9090) {
    resource function post greeting(@http:Payload string payload) returns string|error {
        // return the greeting with appending the payload
        return string `Hello, ${payload}!`;
    }
}
