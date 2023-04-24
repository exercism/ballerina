import ballerina/io;
import ballerina/http;

final http:Client brainyQuoteClient = check new ("http://localhost:9095/brainyquote");

public function main() {

    // Invoke the HTTP client and try to retrive a quote. This result should be a union type consisting `string` and
    // `error`
    string|error quote = brainyQuoteClient->/;

    // If the quote is received, print it to the console (using `io:println()`).
    // If an `error` has occurred, print the error message to the console
    if quote is string {
        io:println(quote);
    } else {
        io:println(quote.message());
    }
}
