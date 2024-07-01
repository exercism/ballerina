# Encodes the input text using the rotational cipher technique
#
# + text - the text to encode
# + shiftKey - the number of positions to shift each alphabetic character
# + return - the encoded text
function rotate(string text, int shiftKey) returns string {
    string result = "";
    foreach string chr in text {
        int codePoint = string:'toCodePointInt(chr);
        int newCodePoint = codePoint;

        if (codePoint >= 65 && codePoint <= 90) {
            newCodePoint = 65 + (codePoint - 65 + shiftKey) % 26;
        }
        else if (codePoint >= 97 && codePoint <= 122) {
            newCodePoint = 97 + (codePoint - 97 + shiftKey) % 26;
        }

        string|error rotated = string:'fromCodePointInt(newCodePoint);
        if (rotated is string) {
            result += rotated;
        }
    }

    return result;
}
