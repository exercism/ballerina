public function reverse(string str) returns string {

    string reversed = "";

    foreach string chr in str {
        reversed = chr + reversed;
    }

    return reversed;
}
