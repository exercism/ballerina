import ballerina/io;
import ims/billionairehub;

configurable string clientId = ?;
configurable string clientSecret = ?;

public function main() returns error? {
    billionairehub:Client cl = check new ({auth: {clientId, clientSecret}});
    billionairehub:Billionaire[] billionaires = check cl->getBillionaires("France");
    io:println(billionaires);

    map<boolean> industries = {};
    check from var b in billionaires
        do {
            industries[b.industry] = true;
        };
    io:println(industries.keys());
}

public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    billionairehub:Billionaire[] billionaires = [];
    foreach string country in countries {
        billionaires.push(...check getTopXBillionairesByCountry(country, x));
    }

    return from var b in billionaires
        order by b.netWorth descending
        limit x
        select b.name;
}

function getTopXBillionairesByCountry(string country, int x) returns billionairehub:Billionaire[]|error {
    billionairehub:Client cl = check new ({auth: {clientId, clientSecret}});
    billionairehub:Billionaire[] billionaires = check cl->getBillionaires(country);
    return from var b in billionaires
        order by b.netWorth descending
        limit x
        select b;
}
