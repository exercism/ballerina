import ballerina/http;
import ballerina/io;

endpoint http:Client clientEP1 {
    url:"http://localhost:9095/brainyquote"
};

endpoint http:Client clientEP2 {
    url:"http://localhost:6060/legacyquote"
};


public function main(string... args) {
    var resp1 = clientEP1->get("/");        
    match resp1 {
        http:Response response1 => {
            string res = check response1.getTextPayload(); 
            io:println(res);
        }
        error err => io:println(err.message);
    }

    var resp2 = clientEP2->get("/"); 
    match resp2 {
        http:Response response2 => {
            string res = check response2.getTextPayload(); 
            io:println(res);
        }
        error err => io:println(err.message);
    }
}
