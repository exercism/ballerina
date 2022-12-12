# Go Figure Monitor Rush

## Problem Statement

You are an employee of a software company called "Go Figure" with 97 employees. A newly rented office space, however, only has 65 cubicles. Every employee wants to work in the new office because each cubicle has state-of-the-art monitors. The HR department is overwhelmed with such requests and came up with a cubicle allocation system with the help of its digital operations team.

They assigned a number to each cubicle from 1 to 65. Employees who want to work in the new office must send allocation requests for cubicles by 7:30 AM every weekday. An employee can only send one allocation request. Each such request can contain only one cubicle number.

The HR department takes the following actions for each cubicle allocation request:

- If the requested cubicle is available, assign it to the requester.
- If the requested cubicle is already assigned, reject the request.

You are the digital operations team member responsible for automating this allocation process. The input is an `int[]` request containing all employee requests submitted by 7:30 AM. Each element of the array represents a cubicle number. Your task is to return an `int[]` containing the assigned numbers of the allocated cubicles. Then, sort the cubicle numbers in ascending order.

## Constraints

- 0 <= Input array size <= 97
- Each member in the input array will be between 1 and 65, inclusive

## Example 1

- Input: `65 1 56`
- Output: `1 56 65`

## Example 2

- Input: `5 6 18 56 18 8 1`
- Output: `1 5 6 8 18 56`
- Explanation: There are two requests for cubicle number 18
