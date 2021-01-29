# Service Invocation

In this exercise, you will build a simple service; 'InvokerService' that is exposed over HTTP and it accepts HTTP GET requests. 
This service invokes another HTTP service; 'quote service' via sending a HTTP GET request and the backend responds with a famous quote. 
The quote service runs on http://localhost:9095/brainyquote and you need to invoke it by sending a HTTP GET request from your code. 
(You don't need to implement the Quote Service as it's already included with the test cases). 

The objectives are:

- Write an HTTP service that can invoke another backend HTTP service. 
- Extract response payload content, log it and send it back to the caller.   

#Running the tests

If you haven't initialized the environment, please execute the following command. 
```sh
[~/Exercism/ballerina]$ ballerina init
```
You can run all the tests for an exercise by entering 
```sh
[~/Exercism/ballerina]$ ballerina test service-invocation
```
in your terminal.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.