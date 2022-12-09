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

    resource function post 'order(@http:Payload Order & readonly newOrder) returns http:Created|http:BadRequest|error {
        if newOrder.username == "" {
            return <http:BadRequest>{};
        }

        int|http:BadRequest total = computeSum(newOrder.order_items);

        if total is http:BadRequest {
            return total;
        }

        string orderId = check generateOrderId();

        lock {
            orders[orderId] = newOrder;
        }

        lock {
            orderStatus[orderId] = PENDING;
        }

        return <http:Created>{
            body: {order_id: orderId, total},
            mediaType: mime:APPLICATION_JSON
        };
    }

    resource function get 'order/[string orderId]() returns http:Ok|http:NotFound {
        lock {
            if !orderStatus.hasKey(orderId) {
                return <http:NotFound>{};
            }

            return <http:Ok>{
                body: {order_id: orderId, status: orderStatus.get(orderId)},
                mediaType: mime:APPLICATION_JSON
            };
        }
    }

    resource function put 'order/[string orderId](@http:Payload OrderUpdate & readonly updatedOrder) returns http:Ok|http:BadRequest|http:Forbidden|http:NotFound {
        final OrderDetail[] & readonly orderItems;
        final int total;

        lock {
            if !orderStatus.hasKey(orderId) {
                return <http:NotFound>{};
            }

            if orderStatus.get(orderId) != PENDING {
                return <http:Forbidden>{};
            }

            orderItems = updatedOrder.order_items;
            int|(http:BadRequest & readonly) sumRes = computeSum(orderItems);

            if sumRes is http:BadRequest {
                return sumRes;
            }

            _ = orderStatus.remove(orderId);
            total = sumRes;
        }

        string username;
        lock {
            Order existingOrder = orders.remove(orderId);
            username = existingOrder.username;
        }

        lock {
            orders[orderId] = {username, order_items: orderItems};
        }

        lock {
            orderStatus[orderId] = PENDING;
        }

        return <http:Ok>{
            body: {order_id: orderId, total},
            mediaType: mime:APPLICATION_JSON
        };
    }

    resource function delete 'order/[string orderId]() returns http:Ok|http:Forbidden|http:NotFound {
        lock {
            if !orderStatus.hasKey(orderId) {
                return <http:NotFound>{};
            }

            if orderStatus.get(orderId) != PENDING {
                return <http:Forbidden>{};
            }
            _ = orderStatus.remove(orderId);
        }

        lock {
            _ = orders.remove(orderId);
        }

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
