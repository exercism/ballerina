# Find the unique multiples of the given factors that are less than the limit.
# Return the sum of the multiples.
#
# + factors - an array of integers
# + 'limit - the upper limit of the multiples
# + return - the sum of the multiples
public function sum(int[] factors, int 'limit) returns int {
    int sum = 0;
    foreach int n in int:range(1, 'limit, 1) {
        if factors.some(f => f > 0 && n % f == 0) {
            sum += n;
        }
    }

    return sum;
}
