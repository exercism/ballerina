import ballerina_exercism/http_billion_dollar_question.billionairehub_server as _;
import ballerina_exercism/http_billion_dollar_question.billionairehub_client as billionairehubClient;

type Billionaire record {|
    string name;
    float netWorth;
|};

# Returns the top billionaires of the given countries.
#
# + countries - countries to search for billionaires
# + x - number of billionaires to return
# + return - list of billionaires
public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    billionairehubClient:BillionaireClient cl = check new;

    // TODO Write your logic here
    return [];
}
