import ballerina/http;
import ballerina/io;

type Billionaire record {|
    string name;
    float netWorth;
|};

service / on new http:Listener(9090) {
    map<Billionaire[]> topbillionaires = {};

    resource function get getBillionaires(string country) returns Billionaire[]|error {
        if self.topbillionaires.length() == 0 {
            json billionaireDetails = check io:fileReadJson("modules/billionairehub_server/resources/billionaires.json");
            self.topbillionaires = check billionaireDetails.cloneWithType();
        }
        Billionaire[]? billionaires = self.topbillionaires[country];
        if billionaires is Billionaire[] {
            return billionaires;
        }
        return error(country + " is not found in the sample dataset.");
    }
}
