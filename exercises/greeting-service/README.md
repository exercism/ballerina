# Hello World Service

In this exercise, you will build a simple service that is exposed over HTTP and it accepts HTTP POST request and send back a greeting message to the consumer by appending the payload of the request to the greeting message.


The objectives are:

- Write an HTTP service that accepts only POST requests on a specific path (e.g. '/greet')
- Extract payload content and append it with the content of the greeting message. 

#Running the tests

If you haven't initialized the environment, please execute the following command. 
```sh
[~/Exercism/ballerina]$ ballerina init
```
You can run all the tests for an exercise by entering 
```sh
[~/Exercism/ballerina]$ ballerina test greeting-service
```
in your terminal.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.