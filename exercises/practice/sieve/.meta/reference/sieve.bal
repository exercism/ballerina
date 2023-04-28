# Returns the prime numbers less than or equal to the given limit.
#
# + 'limit - as an int
# + return - prime numbers as an array of int
public function primes(int 'limit) returns int[] {
    // 1. set the array of candidates
    boolean[] candidates = [false, false]; // 0 and 1 are not prime
    foreach int _ in 2 ... 'limit {
        candidates.push(true);
    }

    // 2. mark all composite numbers as not prime
    var markMultiples = function(int prime) {
        int step = prime == 2 ? prime : prime * 2;
        int i = prime * prime;
        while i <= 'limit {
            candidates[i] = false;
            i += step;
        }
    };

    markMultiples(2);
    int 'sqrt = <int>((<float>'limit).sqrt().floor());
    int n = 3;
    while n <= 'sqrt {
        if candidates[n] {
            markMultiples(n);
        }
        n += 2;
    }

    // 3. collect the primes
    return from [int, boolean] [i, isPrime] in candidates.enumerate()
           where isPrime
           select i;
}
