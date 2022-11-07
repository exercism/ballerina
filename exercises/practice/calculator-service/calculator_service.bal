import ballerina/http;

# Add the necessary attributes to this record to accept two operands and an operator
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2 - Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
|};

service / on new http:Listener(9090) {

    // Add HTTP resource function to accept a POST request on path '/calc'
    // The function should accept the above Calculation record as the payload and return a generic json object
    resource {

        // Check for each operator '+', '-', 'x' or '*' and '/'. and do the calculation

        // Covert the two operands and the expression into a string representation with no whitespace.

        // Return the result as a json object with the calculation expressed as a string e.g. { result: 0.0, expression: "0+0" };
    }
}