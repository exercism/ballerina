import ballerina_exercism/http_billion_dollar_question.billionairehub_server as _;
import ballerina_exercism/http_billion_dollar_question.billionairehub_client as billionairehubClient;

type Billionaire record {|
    string name;
    float netWorth;
|};

public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    Billionaire[] billionaires = [];
    foreach string country in countries {
        billionaires.push(...check getTopXBillionairesByCountry(country, x));
    }

    return from var b in billionaires
        order by b.netWorth descending
        limit x
        select b.name;
}

function getTopXBillionairesByCountry(string country, int x) returns Billionaire[]|error {
    billionairehubClient:BillionaireClient cl = check new();
    Billionaire[] billionaires = check cl->getBillionaires(country);
    return from var b in billionaires
        order by b.netWorth descending
        limit x
        select b;
}
