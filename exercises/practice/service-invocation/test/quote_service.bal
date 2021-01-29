import ballerina/http;
import ballerina/io;
import ballerina/runtime;
import ballerina/math; 

string[] quotes = [ "Many of life’s failures are people who did not realize how close they were to success when they gave up. - Thomas A. Edison\n",
                    "Believe you can and you’re halfway there. — Theodore Roosevelt\n",
                    "Be sure you put your feet in the right place, then stand firm. - Abraham Lincoln\n",
                    "Strive not to be a success, but rather to be of value. — Albert Einstein\n",
                    "A person who never made a mistake never tried anything new.—— Albert Einstein\n",
                    "We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light. — Plato\n"
                    ];

@http:ServiceConfig {
    basePath: "/brainyquote"
}
service QuoteService on new http:Listener(9095) {

    @http:ResourceConfig {
        path: "/",
        methods: ["GET"]
    }
    resource function getQuote (http:Caller caller, http:Request request) {
        string payload = getRandomQuote();
        var responseResult = caller->respond(payload);
        if (responseResult is error) {
            io:println("error responding back to client.");
        }
    } 
}

function getRandomQuote () returns string {
    int index = math:randomInRange(0, quotes.length());
    string quote = quotes[index]; 
    return quote; 
}