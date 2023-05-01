function collatzSteps(int number) returns int|error {
    if number < 1 {
        return error("Only positive integers are allowed");
    }

    int steps = 0;
    int n = number;

    while n > 1 {
        n = n % 2 == 0 ? n/2 : 3*n + 1;
        steps += 1;
    }
    return steps;
}
