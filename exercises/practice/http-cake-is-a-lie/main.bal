import ballerina/http;
import ballerina/mime;

configurable int port = 8080;

enum CakeKind {
    BUTTER_CAKE = "Butter Cake",
    CHOCOLATE_CAKE = "Chocolate Cake",
    TRES_LECHES = "Tres Leches"
}

const map<int> MENU = {
    "Butter Cake": 15,
    "Chocolate Cake": 20,
    "Tres Leches": 25
};

enum OrderStatus {
    PENDING = "pending",
    IN_PROGRESS = "in progress",
    COMPLETED = "completed"
}

type OrderDetail record {|
    CakeKind item;
    int quantity;
|};

type Order record {|
    string username;
    OrderDetail[] order_items;
|};

type OrderUpdate record {|
    OrderDetail[] order_items;
|};

map<Order> orders = {};
map<OrderStatus> orderStatus = {};

service on new http:Listener(port) {
    resource function get menu() returns MENU => MENU;

    resource function post 'order(@http:Payload Order & readonly newOrder) returns http:Created|http:BadRequest|error {
        // Write your code here
        return <http:Created>{
            body: {},
            mediaType: mime:APPLICATION_JSON
        };
    }

    resource function get 'order/[string orderId]() returns http:Ok|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }

    resource function put 'order/[string orderId](@http:Payload OrderUpdate & readonly updatedOrder) returns http:Ok|http:BadRequest|http:Forbidden|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }

    resource function delete 'order/[string orderId]() returns http:Ok|http:Forbidden|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }
}

//Implement the following function to generate a random orderId
function generateOrderId() returns string|error {
    return "";
}

//Implement the following function to validate order items and calulate the total
function computeSum(OrderDetail[] items) returns int|(http:BadRequest & readonly) {
    int total = 0;
    return total;
}
