map<string> PROTEINS = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP"
};

# Translate a sequence of codons to a list of proteins.
#
# + strand - an RNA strand as a string
# + return - array of protein names, or error
public function proteins(string strand) returns string[]|error {
    string[] proteins = [];
    string s = strand;

    while s.length() > 0 {
        if s.length() < 3 {
            return error("Invalid codon");
        }

        string codon = s.substring(0, 3);
        if !PROTEINS.hasKey(codon) {
            return error("Invalid codon");
        }

        string protein = PROTEINS.get(codon);
        if protein == "STOP" {
            break;
        }

        proteins.push(protein);
        s = s.substring(3);
    }

    return proteins;
}
