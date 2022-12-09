import ballerina/test;
import ballerina/io;
import ballerina/http;

@test:Config
function testFunc() returns error? {
    http:Client orderMgtEp = new("http://localhost:9090/ordermgt");
    http:Request req = new;
    string order_id = "100500"; 
    string order_name = "XYZ"; 
    string order_desc = "Sample order."; 
    // POST 
    json order_req = { "Order": { "ID": order_id, "Name": order_name, "Description": order_desc}}; 
    req.setPayload(order_req); 
    http:Response res = check orderMgtEp->post("/order", req); 
    test:assertEquals(res.statusCode, 201); 
    json res_j = check res.getJsonPayload(); 
    test:assertEquals(res_j.orderId, order_id);

    // GET
    res = check orderMgtEp->get("/order/" + order_id);
    test:assertEquals(res.statusCode, 200); 
    res_j = check res.getJsonPayload(); 
    test:assertEquals(res_j.Order.ID, order_id);
    test:assertEquals(res_j.Order.Name, order_name);
    test:assertEquals(res_j.Order.Description, order_desc);

    // PUT 
    string upd_desc = "Updated order."; 
    json update_req = { "Order": {"Name": "XYZ", "Description": upd_desc}}; 
    req.setPayload(update_req); 
    res =  check orderMgtEp->put("/order" + order_id, req);
    res_j = check res.getJsonPayload(); 
    test:assertEquals(res_j.Order.ID, order_id);

    // DELETE 
    res = check orderMgtEp->delete("/order" + order_id, null); 
    res_j = check res.getJsonPayload(); 
    test:assertEquals(res.statusCode, 200);
    res = check orderMgtEp->get("/order/" + order_id);
    test:assertEquals(res_j.Order.ID, ());
}
