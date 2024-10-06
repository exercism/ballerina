public function isArmstrongNumber(int number) returns boolean {
    int sum = 0;
    int working = number;
    float length = <float> number.toString().length();
    while (working > 0) {
        float digit = <float> working % 10;
        sum += <int> float:pow(digit, length);
        working /= 10;
    }
    return sum == number;
}
