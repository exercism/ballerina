import ims/billionairehub;

# Client ID and Client Secret to connect to the billionaire API
configurable string clientId = ?;
configurable string clientSecret = ?;

public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    // Create the client connector
    billionairehub:Client cl = check new ({auth: {clientId, clientSecret}});

    // TODO Write your logic here
    return [];
}
