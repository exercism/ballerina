import ballerina/http;
import ballerina/io;

http:Client clientEP1 = new("http://localhost:9095/brainyquote");

http:Client clientEP2 = new("http://localhost:6060/legacyquote");


public function main() {
    var resp1 = clientEP1->get("/");
    if (resp1 is http:Response) {
        var res = resp1.getTextPayload();
        if (res is string) {
            io:println(res);
        } else {
            io:println(res.detail().message);
        }
    } else {
        io:println(resp1.detail().message);
    }

    var resp2 = clientEP2->get("/");
    if (resp2 is http:Response) {
        var res = resp2.getTextPayload();
        if (res is string) {
            io:println(res);
        } else {
            io:println(res.detail().message);
        }
    } else {
        io:println(resp2.detail().message);
    }
}
