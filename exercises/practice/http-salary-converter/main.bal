import http_salary_converter.backend as _;

# The exchange rate API base URL
configurable string apiUrl = "http://localhost:8080";

# Convert provided salary to local currency
#
# + salary - Salary in source currency
# + sourceCurrency - Soruce currency
# + localCurrency - Employee's local currency
# + return - Salary in local currency or error
public function convertSalary(decimal salary, string sourceCurrency, string localCurrency) returns decimal|error {
    // TODO: Write your code here
    return 0;
}
