import ballerina/http;
# The exchange rate API base URL
configurable string apiUrl = "http://localhost:8080";

type Response record {|
    string base;
    map<decimal> rates;
|};

# Convert provided salary to local currency
#
# + salary - Salary in source currency
# + sourceCurrency - Soruce currency
# + localCurrency - Employee's local currency
# + return - Salary in local currency or error
public function convertSalary(decimal salary, string sourceCurrency, string localCurrency) returns decimal|error {
    
    http:Client cl = check new (apiUrl);
    Response response = check cl->/rates/[sourceCurrency];
    decimal localRate = check trap response.rates.get(localCurrency);
    return localRate * salary;
}
