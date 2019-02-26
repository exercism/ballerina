import ballerina/http;

// define an 'orderMap' map that can hold json objects


// Create service config and attach service base path to "/ordermgt"
service OrderMgtService on new http:Listener(9090) {

    // HTTP GET resource
    // path -> "order/{orderId}"
    resource function findOrder(http:Caller caller, http:Request req, string orderId) {
        // Get the matching order from the orders map using order ID.
        // Set the content of the JSON retrived as the message payload.
        // Send the response back to the client.
    }

    // HTTP POST resource
    // path -> "/order"
    resource function addOrder(http:Caller caller, http:Request req) {
        // Add incoming payload content into the orders map.

        // Create a response JSON format with { status: "Order Created.", orderId: <id> }

        // Use the status code of the response as 201.
        // Set the 'Location' header of the response to `` http://localhost:9090/ordermgt/order/ ``

        // Send the response back to the caller.
    }


    // HTTP PUT resource
    // path -> "/order/{orderId}"

    // Create resource with orderId as an input parameter read from the path variables.
    resource function updateOrder(http:Caller caller, http:Request req) {
        // retrive the requested order which has to be updated.

        // Update retrived order based on the updated order content.
        // Set the updated order content as the payload.

        // Send back to the caller with the response payload with the content for updated order.
    }

    // HTTP DELETE resource
    // Path -> /orders/{orderId}
    // Include orderId as an input parameter from the path variables.
    resource function cancelOrder(http:Caller caller, http:Request req, string orderId) {
        // Remove the order from the map
        // Send back the res
    }
}