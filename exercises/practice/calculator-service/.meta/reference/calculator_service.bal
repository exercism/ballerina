import ballerina/http;

# A simple record that ensures the proper structure
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2 - Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

service / on new http:Listener(9090) {

    // The HTTP method POST is used under the path "/calc" by the function name.
    // The @http:Payload will map any incoming json to the specified record type.
    // a generic type `json` can be returned or a return record type could be created.
    resource function post calc(@http:Payload Calculation cal) returns json {
        float opr1 =  cal.operand1;
        float opr2 = cal.operand2;
        float? result = 0.0;


        // The match statement is suited for checking one variable against possibilities
        match cal.operator {
            "+" => {
                result = opr1 + opr2;
            }
            "-" => {
                result = opr1 - opr2;
            }
            "*"|"x" => {
                result = opr1 * opr2;
            } 
            "/" => {
                result = opr1 / opr2;
            }
            // The generic `any` match will handle any extra issues
            _ => {
                // () is Nil and will result in a 0 value being returned in the json
                result = ();
            }
        }

        // An untyped `{}` object is returned as JSON
        return {
            expression: float:toFixedString(opr1, ()) + cal.operator + float:toFixedString(opr2, ()),
            result: result
        };
    }
}
