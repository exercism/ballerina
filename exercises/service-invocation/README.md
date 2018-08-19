# Service Invocation

In this exercise, you will build a simple service that is exposed over HTTP and it accepts HTTP GET requests
The service invokes another HTTP service(quote service) via sending a HTTP GET request and the backend responds with a famous quote. 


The objectives are:

- Write an HTTP service that can invoke another backend HTTP service. 
- Extract payload content and log it.  

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