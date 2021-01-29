# Order Manager RESTful Service 

In this exercise, you will build an Order management service which follows the RESTful service principles. 

The objectives are:

- Design a RESTful service with that encapsulate four resources for order management 
operations what includes create, read, update and delete. 

- Create Order : To place a new order, use an HTTP POST request that contains order details, and then send the request to the http://localhost:9090/order endpoint. 
If the request is successful, the service should respond with a 201 Created HTTP response that has the location header pointing to the newly created resource at http://localhost:9090/order/123456.
- Retrieve Order : To retrieve order details, send an HTTP GET request to the appropriate URL that includes the order ID.http://localhost:9090/order/.
- Update Order : To update an existing order, send an HTTP PUT request with content for the order update.
- Delete Order : To delete an existing order, send an HTTP DELETE request to the http://localhost:9090/order/ endpoint.
- All incoming and outgoing order request are sent in JSON format with the following structure:  
    Sample order req : `` { "Order": { "ID": "100500", "Name": "my order", "Description": "my order desc"}} `` 
- Order are stored in an in-memory map which is defined at the service level. 
- You can assume that following request and response messages are sent by the service. 


1. Create Order

HTTP POST on `` http://localhost:9090/ordermgt/order ``with the following payload : 

``'{ "Order": { "ID": "100500", "Name": "XYZ", "Description": "Sample order."}}'  ``

Expected response: HTTP 201 with Location header and order status. 
  
``` 
< HTTP/1.1 201 Created
< Content-Type: application/json
< Location: http://localhost:9090/ordermgt/order/100500
< content-length: 46
< server: ballerina/0.981.0
{"status":"Order Created.","orderId":"100500"} 
```

2. Retrieve Order

HTTP GET request on : `` http://localhost:9090/ordermgt/order/100500 `` 

Output : 
`` {"Order":{"ID":"100500","Name":"XYZ","Description":"Sample order."}}``


3. Update Order on http://localhost:9090/ordermgt/order/100500 

`` { "Order": {"Name": "XYZ", "Description": "Updated order."}}`` 


Output : 
``` 
{"Order":{"ID":"100500","Name":"XYZ","Description":"Updated order."}}
```


4. Cancel Order

HTTP Delete on `` http://localhost:9090/ordermgt/order/100500`` 

Output:
`` "Order : 100500 removed." `` 


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