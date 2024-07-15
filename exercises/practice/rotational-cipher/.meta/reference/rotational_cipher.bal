# Encodes the input text using the rotational cipher technique
#
# + text - the text to encode
# + shiftKey - the number of positions to shift each alphabetic character
# + return - the encoded text
function rotate(string text, int shiftKey) returns string {
    string result = "";
    foreach string:Char chr in text {
        int codePoint = chr.toCodePointInt();
        int newCodePoint = codePoint;

        if codePoint >= 65 && codePoint <= 90 {
            newCodePoint = 65 + (codePoint - 65 + shiftKey) % 26;
        }
        else if codePoint >= 97 && codePoint <= 122 {
            newCodePoint = 97 + (codePoint - 97 + shiftKey) % 26;
        }

        // Checkpanic since this shouldn't return an error
        string rotated = checkpanic string:'fromCodePointInt(newCodePoint);
        result += rotated;
    }

    return result;
}
