import ballerina/lang.array;

class CircularBuffer {
    final int capacity;
    int size;
    int readIndex;
    int writeIndex;
    int[] data;

    function init(int capacity) {
        self.capacity = capacity;
        self.size = 0;
        int[] data = [];
        data.setLength(self.capacity);
        self.data = data;
        self.readIndex = 0;
        self.writeIndex = 0;
    }

    function read() returns int|error {
        if self.size == 0 {
            return error("Empty buffer");
        }

        int value = self.data[self.readIndex];
        self.size -= 1;
        self.readIndex = (self.readIndex + 1) % self.capacity;

        return value;
    }

    function write(int value) returns error? {
        if self.size >= self.capacity {
            return error("Full buffer");
        }

        self.data[self.writeIndex] = value;
        self.size += 1;
        self.writeIndex = (self.writeIndex + 1) % self.capacity;
    }

    function overwrite(int value) returns error? {
        if self.size == self.capacity {
            _ = check self.read();
        }

        return self.write(value);
    }

    function clear() {
        self.size = 0;
        int[] data = [];
        data.setLength(self.capacity);
        self.data = data;
        self.readIndex = 0;
        self.writeIndex = 0;
    }
}
