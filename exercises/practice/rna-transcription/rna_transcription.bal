public function toRna(string dna) returns string {
    string[] results = [];
    foreach string c in dna {
        string complement = "";
        if c == "C" {
            complement = "G";
        } else if c == "G" {
            complement = "C";
        } else if c == "T" {
            complement = "A";
        } else if c == "A" {
            complement = "U";
        }

        results.push(complement);
    }

    return string:concat(...results);
}
