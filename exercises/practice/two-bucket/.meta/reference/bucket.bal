class Bucket {
    private final string name;
    private final int size;
    private int amount;

    function init(string name, int size) {
        self.name = name;
        self.size = size;
        self.amount = 0;
    }

    function getName() returns string => self.name;
    function getSize() returns int => self.size;
    function getAmount() returns int => self.amount;

    function fill() {
        self.amount = self.size;
    }

    function empty() {
        self.amount = 0;
    }

    function isFull() returns boolean => self.amount == self.size;
    function isEmpty() returns boolean => self.amount == 0;

    function capacity() returns int => self.size - self.amount;

    function add(int amount) {
        self.amount += amount;
    }

    function pourInto(Bucket other) {
        int quantity = int:min(self.amount, other.capacity());
        other.add(quantity);
        self.add(-quantity);
    }
}
