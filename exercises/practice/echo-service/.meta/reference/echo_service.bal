import ballerina/http;

service / on new http:Listener(8080) {

    // Resource returns the same request payload back to the client.
    resource function get echo(string sound) returns string {
        // Extract the payload from the response and return back to the client as a response.
        return sound;
    }

    // You can combine the base path and the relative path to get the path of the resource (i.e., `/echo/definition`).
    resource function get echo/definition() returns string {
        return "A sound or series of sounds caused by the reflection of sound waves from a surface back to the listener.";
    }
}
