import ballerina_exercism/http_billion_dollar_question.billionarehub_server as _;
import ballerina_exercism/http_billion_dollar_question.billionarehub_client as billionarehubClient;

type Billionaire record {
    string name;
    float netWorth;
};

# Returns the top billionares of the given countries.
#
# + countries - countries to search for billionares
# + x - number of billionares to return
# + return - list of billionares
public function getTopXBillionaires(string[] countries, int x) returns string[]|error {
    billionarehubClient:BillionareClient cl = check new();

    // TODO Write your logic here
    return [];
}
