import ballerina/http;
import ballerina/io;


// Use the following endpoints to send HTTP GET request to get quotes

// This is an existing endpoint (which will be automatically spawned by the test framework)
endpoint http:Client clientEP1 {
    url:"http://localhost:9095/brainyquote"
};

// This is a non-existing endpoint.
endpoint http:Client clientEP2 {
    url:"http://localhost:6060/legacyquote"
};


public function main(string... args) {

    // Invoke clientEP1 using HTTP GET request on "/"
    // Invocation returns an 'union type' which can either be an 'http:Response' type or an 'error' type.
    // Assign it to 'Var' variable (The type of the declared variable is inferred from the expression on the right-hand side.)


    // Create a match caluse to handle
    // 1. http:Response
    // 2. error

    // For case with http:Response, you need to get the text payload from the response message and print it the console (io:println).
    // You may use 'match' again to handle the union type that can be string or error. So, you can simply use 'check' to explicitely get the
    // string type if exists or pass the error to the caller.


    // For error case just print the error message to the console (io:println)



    // Similarly implement the same logic for the invocation of the clientEP2

}
