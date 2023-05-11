string[] ACTIONS = [
    "wink",
    "double blink",
    "close your eyes",
    "jump"
];

# Find the secret handshake.
#
# + code - the number to decipher
# + return - the encoded commands as a list of strings.
public function commands(int code) returns string[] {
    string[] handshake = [];
    foreach [int, string] [idx, cmd] in ACTIONS.enumerate() {
        if (code >> idx & 1) == 1 {
            handshake.push(cmd);
        }
    }
    if (code >> ACTIONS.length() & 1) == 1 {
        return handshake.reverse();
    }
    return handshake;
}
