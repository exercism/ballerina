import ballerina/http;

# Add the necessary attributes to this record to accept two operands and an operator
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2 - Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

# Add the necessary attributes to this record to include the result value and the expression.
#
# + result - The result of the operation
# + expression - The evaluated expression that used to calculate the result
public type Response record {|
    float result;
    string expression;
|};

service / on new http:Listener(9090) {
    // The HTTP method POST is used under the path "/calc" by the function name.
    // The @http:Payload will map any incoming json to the specified record type.
    // a generic type `json` can be returned or a return record type could be created.
    resource function post calc(@http:Payload Calculation calculation) returns Response {

        string operator = calculation.operator;
        float operand1 = calculation.operand1;
        float operand2 = calculation.operand2;
        float result = 0f;

        // The `match` operator can be used to check a value against a set of possible values.
        // This is equalent to switch-case in some other languages
        match operator {
            "+" => {
                result = operand1 + operand2;
            }
            "-" => {
                result = operand1 - operand2;
            }
            "*"|"x" => {
                result = operand1 * operand2;
            }
            "/" => {
                result = operand1 / operand2;
            }
        }

        // The result is returned as a `Response` record
        return {
            result: result,
            // A Ballerina string template is used to build the expression
            expression: string `${operand1}${operator}${operand2}`
        };
    }
}
