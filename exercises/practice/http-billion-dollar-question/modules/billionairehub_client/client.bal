import ballerina/http;

type Billionaire record {|
    string name;
    float netWorth;
|};

const CLIENT_URL = "http://localhost:9090";

public client class BillionaireClient {
    private final http:Client httpClient;

    public function init() returns error? {
        self.httpClient = check new (CLIENT_URL);
    }

    remote function getBillionaires(string country) returns Billionaire[]|error {
        return self.httpClient->/getBillionaires(country=country);
    }
}
