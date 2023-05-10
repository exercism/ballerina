public type Position record {
    int x;
    int y;
};

public enum Direction {
    NORTH, EAST, SOUTH, WEST
}

public type Robot record {
    Position position;
    Direction direction;
};

public function newRobot(
        Position position = {"x": 0, "y": 0}, 
        Direction direction = NORTH
) returns Robot => {position, direction};

public function move(Robot robot, string instructions) returns Robot {
    Robot r = robot.clone();
    foreach string:Char instr in instructions {
        match instr {
            "R" => { r = turnRight(r); }
            "L" => { r = turnLeft(r); }
            "A" => { r = advance(r); }
        }
    }
    return r;
}

function turnRight(Robot robot) returns Robot {
    Direction dir = robot.direction;
    match dir {
        NORTH => { dir = EAST; }
        EAST  => { dir = SOUTH; }
        SOUTH => { dir = WEST; }
        WEST  => { dir = NORTH; }
    }
    return newRobot(robot.position, dir);
}

function turnLeft(Robot robot) returns Robot {
    Direction dir = robot.direction;
    match dir {
        NORTH => { dir = WEST; }
        EAST  => { dir = NORTH; }
        SOUTH => { dir = EAST; }
        WEST  => { dir = SOUTH; }
    }
    return newRobot(robot.position, dir);
}

function advance(Robot robot) returns Robot {
    Position pos = robot.position;
    match robot.direction {
        NORTH => { pos.y += 1; }
        EAST  => { pos.x += 1; }
        SOUTH => { pos.y -= 1; }
        WEST  => { pos.x -= 1; }
    }
    return newRobot(pos, robot.direction);
}
