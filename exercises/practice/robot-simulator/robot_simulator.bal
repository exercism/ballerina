public type Position record {
    int x;
    int y;
};

public enum Direction {
    NORTH, EAST, SOUTH, WEST
}

// TODO define a Robot type

public function newRobot(Position position, Direction direction) returns Robot {
    // TODO implement this function
}

public function move(Robot robot, string instructions) returns Robot {
    // TODO implement this function
}
