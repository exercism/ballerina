import ballerina/http;
import ballerina/mime;
import ballerina/random;

configurable int port = 8080;

enum CakeKind {
    BUTTER_CAKE = "Butter Cake",
    CHOCOLATE_CAKE = "Chocolate Cake",
    TRES_LECHES = "Tres Leches"
}

const map<int> MENU = {
    "Butter Cake" : 15,
    "Chocolate Cake" : 20,
    "Tres Leches" : 25
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

    resource function post orders(@http:Payload Order & readonly newOrder) returns http:Created|http:BadRequest|error {
        // Write your code here
        return <http:Created>{
            body: {},
            mediaType: mime:APPLICATION_JSON
        };
    }

    resource function get orders/[string orderId]() returns http:Ok|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }

    resource function put orders/[string orderId](@http:Payload OrderUpdate & readonly updatedOrder) returns http:Ok|http:BadRequest|http:Forbidden|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }

    resource function delete orders/[string orderId]() returns http:Ok|http:Forbidden|http:NotFound {
        // Write your code here
        return <http:Ok>{};
    }
}

function generateOrderId() returns string|error {
    lock {
        while true {
            string orderId = (check random:createIntInRange(1, 100)).toString();
        
            if !orders.hasKey(orderId) {
                return orderId;
            }
        }
    }
}

function computeSum(OrderDetail[] items) returns int|(http:BadRequest & readonly) {
    if items.length() == 0 {
        return {};
    }

    int total = 0;

    string[] cakeTypes = MENU.keys();

    foreach OrderDetail {item, quantity} in items {
        int? index = cakeTypes.indexOf(item);
        if quantity < 1 || index is () {
            return {};
        }

        _ = cakeTypes.remove(index);

        total += MENU.get(item) * quantity;
    }

    return total;
}
