import ballerina/http;
import ballerina/io;

final http:Client brainyQuoteClient = check new ("http://localhost:9095/brainyquote");

final http:Client legacyClient = check new ("http://localhost:6060/legacyquote");

// The `main` function should return `error?` in order to use the `check` expression
public function main() returns error? {
    // Use the `brainyQuoteClient` to retrieve a quote
    // You can use `-><resource path>` to call an endpoint. In this case, the resource path is just `/`
    string|error response1 = brainyQuoteClient->/;
    // Using type-guard to narrow the type of the `response1` variable
    if response1 is string {
        // Inside this block, the type of the `response1` is `string`
        io:println(response1);
    } else {
        // Inside the else block, the type of the `response1` is `error`, so you can access the error message
        io:println(response1.message());
    }

    // Using similar logic to retrieve a response from the `legacyClient`
    string|error response2 = legacyClient->/;
    if response2 is string {
        io:println(response2);
    } else {
        io:println(response2.message());
    }

    // Now, using the `check` expression. When the `check` expression is used, if an error occurred, it will be returned
    // wihout executing the function further. Since the `check` expression is used, the response type will be `string`
    string response3 = check legacyClient->/;
    io:println(response3);
}
