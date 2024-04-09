type IntFilter function (int num) returns boolean;
type IntMapper function (int num) returns int;
type IntAccumulator function (int acc, int el) returns int;

public function append(int[] list1, int[] list2) returns int[] {
    // TODO: implement this function
}

public function concatenate(int[][]|int[][][] lists) returns int[]|int[][] {
    // TODO: implement this function
}

public function filter(int[] list, IntFilter fn) returns int[] {
    // TODO: implement this function
}

public function length(int[] list) returns int {
    // TODO: implement this function
}

public function myMap(int[] list, IntMapper fn) returns int[] {
    // TODO: implement this function
}

public function foldl(int[] list, IntAccumulator fn, int initial) returns int {
    // TODO: implement this function
}

public function foldr(int[] list, IntAccumulator fn, int initial) returns int {
    // TODO: implement this function
}

public function reverse(int[]|int[][] list) returns int[]|int[][] {
    // TODO: implement this function
}
