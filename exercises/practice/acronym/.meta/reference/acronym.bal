// sequences of spaces and/or hyphens separate words, 
// and capture any non-alphabet chars following the separator.
string:RegExp separator = re `[-\s]+[^A-Za-z]*`;

function abbreviate(string phrase) returns string {
    string[] letters = separator.split(phrase.trim()).'map(w => w[0]);
    return string:'join("", ...letters).toUpperAscii();
}
