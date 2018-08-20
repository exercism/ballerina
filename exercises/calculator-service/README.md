# Hello World Service

In this exercise, you will build a simple service calculator service which can run basic arithmetic operations. 
You are sending the operands and operate in the form of a JSON message to the service and service also responds with the results inside a JSON. 

The objectives are:

- Write a simple HTTP service that accepts HTTP POST requests in JSON format. 
- Extract operands and operator from JSON request message. 
- Type conversions of JSON to basic types such as int, float and string. 
- Executing arithmetic operations. 


#Running the tests

If you haven't initialized the environment, please execute the following command. 
```sh
[~/Exercism/ballerina]$ ballerina init
```
You can run all the tests for an exercise by entering 
```sh
[~/Exercism/ballerina]$ ballerina test calculator-service
```
in your terminal.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.