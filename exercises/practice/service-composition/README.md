# Service Invocation

In this exercise, you will build a composite service that communicate with multiple downstream services. 
The use case is to model a travel reservation service which talks to three other services; airline reservation, hotel reservation and car rental service.
 
The objectives are:

- Invoking multiple endpoints with different message payloads. 
- Transforming message payloads using native types of Ballerina 
- Validation of input messages as well as the response messages from different services.  

You can follow the instruction on the exercise to get more information of the steps that you need to follow. 
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