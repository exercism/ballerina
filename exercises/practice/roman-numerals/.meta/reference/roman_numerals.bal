// a list of tuples
[int, string][] & readonly numerals = [
    [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
     [100, "C"],  [90, "XC"],  [50, "L"],  [40, "XL"],
      [10, "X"],   [9, "IX"],   [5, "V"],   [4, "IV"],
       [1, "I"]
];

function roman(int number) returns string {
    string roman = "";
    int n = number;

    foreach [int, string] [dec, rom] in numerals {
        while n >= dec {
            n -= dec;
            roman += rom;
        }
    }

    return roman;
}
