public type LinkedList record {|
    Node? head = ();
    Node? tail = ();
|};

type Node record {|
    int value;
    Node? next = ();
    Node? prev = ();
|};


# Adds a new value to the tail of a linked list
#
# + list - the linked list
# + value - integer value to add
public function push(LinkedList list, int value) {
    Node node = {value};
    Node? tail = list.tail;
    if tail == () {
        list.head = node;
    } else {
        tail.next = node;
        node.prev = tail;
    }
    list.tail = node;
}

# Adds a new value to the head of a linked list
#
# + list - the linked list
# + value - integer value to add
public function unshift(LinkedList list, int value) {
    Node node = {value};
    Node? head = list.head;
    if head == () {
        list.tail = node;
    } else {
        head.prev = node;
        node.next = head;
    }
    list.head = node;
}

# Remove a value from the tail of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function pop(LinkedList list) returns int? {
    Node? node = list.tail;
    if node == () {
        return;
    }
    Node? prev = node.prev;
    list.tail = prev;
    if prev == () {
        list.head = ();
    } else {
        prev.next = ();
        node.prev = ();
    }
    return node.value;
}

# Remove a value from the head of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function shift(LinkedList list) returns int? {
    Node? node = list.head;
    if node == () {
        return;
    }
    Node? next = node.next;
    list.head = next;
    if next == () {
        list.tail = ();
    } else {
        next.prev = ();
        node.next = ();
    }
    return node.value;
}

# Count the number of values in a list
#
# + list - the linked list
# + return - the number of values, or zero for an empty list
public function count(LinkedList list) returns int {
    int n = 0;
    Node? node = list.head;
    while node != () {
        n += 1;
        node = node.next;
    }
    return n;
}

# Delete the given value from the linked list
#
# + list - the linked list
# + value - integer value to delete
public function delete(LinkedList list, int value) {
    Node? node = list.head;
    while node != () {
        if node.value != value {
            node = node.next;
            continue;
        }

        Node? prev = node.prev;
        Node? next = node.next;
        if prev == () {
            // this is the head
            _ = shift(list);
        } else if next == () {
            // this is the tail
            _ = pop(list);
        } else {
            prev.next = next;
            next.prev = prev;
            node.prev = ();
            node.next = ();
        }
        return;
    }
}
