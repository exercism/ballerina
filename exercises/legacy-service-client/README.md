# Legacy Service Client

In this exercise, you will build a simple HTTP client to invoke two HTTP services. One HTTP service is running normally and the second service is not up and running. So, you will be writing the service invocation logic so that you can explicitly handle the successful responses as well as the errors when calling those services. 

The objectives are:

- Write a simple HTTP client program(main) that invokes HTTP services.  
- Define two endpoints and invoke them sequentially, while handling any errors that could be thrown from those service invocations. 
- Use the type guard check (`is` check) to handle union-type returns: if the result value is an HTTP:Response - normal processing happens.
 If the result is an 'error' - we use error-handling logic instead.

#Running the tests

If you haven't initialized the environment, please execute the following command. 
```sh
[~/Exercism/ballerina]$ ballerina init
```
You can run all the tests for an exercise by entering 
```sh
[~/Exercism/ballerina]$ ballerina test legacy-service-client
```
in your terminal.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.