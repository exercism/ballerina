# Returns the prime numbers less than or equal to the given limit.
#
# + 'limit - as an int
# + return - prime numbers as an array of int
public function primes(int 'limit) returns int[] {
    boolean[] candidates = [];

    foreach int _ in int:range(0, 'limit + 1, 1) {
        candidates.push(true);
    }
    candidates[0] = false;
    candidates[1] = false;

    var markMultiples = function(int prime) {
        int step = prime == 2 ? prime : prime * 2;
        foreach int i in int:range(prime * prime, 'limit + 1, step) {
            candidates[i] = false;
        }
    };

    markMultiples(2);

    int 'sqrt = <int>((<float>'limit).sqrt().floor());
    foreach int n in int:range(3, 'sqrt + 1, 2) {
        if candidates[n] {
            markMultiples(n);
        }
    }

    int[] primes = [];
    foreach [int, boolean] [i, isPrime] in candidates.enumerate() {
        if isPrime {
            primes.push(i);
        }
    }

    return primes;
}
