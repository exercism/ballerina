import ballerina/lang.regexp;

public function encode(string phrase) returns string {
    string result = "";
    int chunk_size = 0;
    foreach string:Char chr in phrase {
        if isAlphanumeric(chr) {
            if chunk_size == 5 {
                result += " ";
                chunk_size = 0;
            }
            
            result += encodeChar(chr);
            chunk_size += 1;
        }
    }

    return result;
}

public function decode(string phrase) returns string {
    string result = "";

    foreach string:Char chr in phrase {
        if chr != " " {
            result += encodeChar(chr);
        }
    }

    return result;
}

function encodeChar(string:Char chr) returns string {
    string lowered = chr.toLowerAscii();
    int codePoint = lowered.getCodePoint(0);
    if codePoint >= 97 && codePoint <= 122 {
        codePoint = 97 + 122 - codePoint;
    }
    
    return checkpanic string:fromCodePointInt(codePoint);
}

function isAlphanumeric(string:Char chr) returns boolean {
    string:RegExp r = re `[a-zA-Z0-9]`;
    return r.find(chr) is regexp:Span;
}
