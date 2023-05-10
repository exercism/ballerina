# Instructions

The Collatz Conjecture, also known as the 3x+1 problem, can be summarized as follows:

Take any positive integer n.
If n is even, divide it by 2 to get n / 2.
If n is odd, multiply it by 3 and add 1 to get 3n + 1.
Repeat this process indefinitely.
The conjecture states that regardless of the starting number, it will always eventually reach the value 1.

Given a number n, the task is to determine the number of steps required to reach 1.

## Examples

Starting with n = 12, the steps would be as follows:

0. 12
1. 6
2. 3
3. 10
4. 5
5. 16
6. 8
7. 4
8. 2
9. 1

Resulting in 9 steps.
So for input n = 12, the return value would be 9.
