import ballerina/http;
import ballerina/io;
import ballerina/runtime;
import ballerina/math; 

endpoint http:Listener listener {
    port:9095
}; 

@http:ServiceConfig {basePath:"/brainyquote"}
service<http:Service> legacy_quote bind listener {


    @http:ResourceConfig{
        path: "/",  methods: ["GET"]
    }
    getQuoteRetry (endpoint caller, http:Request request) {
        http:Response response;
        string payload = getRandomQuote();
        _ = caller -> respond(payload);
    } 
}


function getRandomQuote () returns (string) {
    string[] quotes = [ "Many of life’s failures are people who did not realize how close they were to success when they gave up. - Thomas A. Edison\n",
                        "Believe you can and you’re halfway there. — Theodore Roosevelt\n",
                        "Be sure you put your feet in the right place, then stand firm. - Abraham Lincoln\n",
                        "Strive not to be a success, but rather to be of value. — Albert Einstein\n",
                        "A person who never made a mistake never tried anything new.—— Albert Einstein\n",
                        "We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light. — Plato\n"
                        ];

    int index = math:randomInRange(0, lengthof quotes); 
    string quote = quotes[index]; 
    return quote; 
}