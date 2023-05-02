# Determine how many actions are required to measure an exact number of liters
# by strategically transferring fluid between the buckets.
#
# + bucketOne - the size of the first bucket
# + bucketTwo - the size of the second bucket
# + goal - the desired number of litres to reach 
# + startBucket - the name of the first bucket to fill
# + return - a TestBucketResult record or an error
public function measure(int bucketOne, int bucketTwo, int goal, string startBucket) returns TwoBucketSolution|error {
    if !validate(bucketOne, bucketTwo, goal) {
        return error("goal is impossible");
    }

    Bucket b1 = new Bucket("one", bucketOne);
    Bucket b2 = new Bucket("two", bucketTwo);

    return startBucket == "one" 
            ? solve(b1, b2, goal) 
            : solve(b2, b1, goal);
}

function gcd(int a, int b) returns int {
    if b == 0 {
        return a;
    }
    return gcd(b, a % b);
}

function validate(int bucketOne, int bucketTwo, int goal) returns boolean {
    if goal > int:max(bucketOne, bucketTwo) {
        return false;
    }

    int G = gcd(bucketOne, bucketTwo);
    return G == 1 || goal % G == 0;
}

function solve(Bucket a, Bucket b, int goal) returns TwoBucketSolution {
    int moves = 0;

    a.fill();
    moves += 1;

    if b.getSize() == goal {
        b.fill();
        moves += 1;
    }

    while true {
        if a.getAmount() == goal {
            return {moves, goalBucket: a.getName(), otherBucket: b.getAmount()};
        }
        if b.getAmount() == goal {
            return {moves, goalBucket: b.getName(), otherBucket: a.getAmount()};
        }

        if a.isEmpty() {
            a.fill();
        } else if b.isFull() {
            b.empty();
        } else {
            a.pourInto(b);
        }

        moves += 1;
    }
}
