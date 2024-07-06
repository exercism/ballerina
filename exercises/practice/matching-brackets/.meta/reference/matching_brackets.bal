map<string> pairs = {
    "[": "]",
    "{": "}",
    "(": ")"
};

string[] closers = pairs.keys().map(k => pairs.get(k));

#
# Check whether the brackets in a given string are balanced.
# 
# + value - the string to check
# + return - true if the brackets are balanced, false otherwise
function isPaired(string value) returns boolean {
    string:Char[] stack = [];

    foreach string:Char chr in value {
        if pairs.hasKey(chr) {
            stack.push(chr);
        }
        else if closers.indexOf(chr) is int  {
            if stack.length() == 0 {
                return false;
            }

            string:Char last = stack.pop();

            match [last, chr] {
                ["[", _] if chr != "]" => {
                    return false;
                }
                ["{", _] if chr != "}" => {
                    return false;
                }
                ["(", _] if chr != ")" => {
                    return false;
                }
                _ => {
                    continue;
                }
            }
        }
    }

    return stack.length() == 0;
}