import ballerina/http;

endpoint http:Listener listener {
    port: 9090
};


// define an 'orderMap' map that can hold json objects


// Create service config and attach service base path to "/ordermgt"
service<http:Service> OrderMgtService bind listener {

    // HTTP GET resource
    // path -> "order/{orderId}"
    findOrder(endpoint client, http:Request req, string orderId) {
        // Get the matching order from the orders map using order ID.
        // Set the content of the JSON retrived as the message payload.
        // Send the response back to the client.
    }

    // HTTP POST resource
    // path -> "/order"
    addOrder(endpoint client, http:Request req) {
        // Add incoming payload content into the orders map.

        // Create a response JSON format with { status: "Order Created.", orderId: <id> }

        // Use the status code of the response as 201.
        // Set the 'Location' header of the response to `` http://localhost:9090/ordermgt/order/ ``

        // Send the response back to the caller.
    }


    // HTTP PUT resource
    // path -> "/order/{orderId}"

    // Create resource with orderId as an input parameter read from the path variables.
    updateOrder(endpoint client, http:Request req) {
        // retrive the requested order which has to be updated.

        // Update retrived order based on the updated order content.
        // Set the updated order content as the payload.

        // Send back to the caller with the response payload with the content for updated order.
    }

    // HTTP DELETE resource
    // Path -> /orders/{orderId}
    // Include orderId as an input parameter from the path variables.
    cancelOrder(endpoint client, http:Request req, string orderId) {
        // Remove the order from the map
        // Send back the res
    }
}