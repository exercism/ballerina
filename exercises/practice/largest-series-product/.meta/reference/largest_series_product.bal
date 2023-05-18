const int ZERO = 48;    // codepoint of '0'

# Find the largest product of the digits of a substring
#
# + digits - the sequence of digits as a string
# + span - the substring size
# + return - the maximum product, or an error
public function largestProduct(string digits, int span) returns int|error {
    if span < 0 {
        return error("span must not be negative");
    }
    if span > digits.length() {
        return error("span must be smaller than string length");
    }

    int[] ds = from int codepoint in digits.toCodePointInts()
               let int d = codepoint - ZERO
               where 0 <= d && d <= 9
               select d;

    if ds.length() != digits.length() {
        return error("digits input must only contain digits");
    }
    
    var multiply = function(int a, int b) returns int => a * b;
    var product = function(int[] a) returns int => a.reduce(multiply, 1);

    int largest = -1;
    foreach int i in int:range(0, ds.length() - span + 1, 1) {
        largest = int:max(largest, product(ds.slice(i, i+span)));
    }
    return largest;
}

