public type TwoBucketSolution record {|
    int moves;
    string goalBucket;
    int otherBucket;
|};

public type TwoBucketResult TwoBucketSolution|error;
