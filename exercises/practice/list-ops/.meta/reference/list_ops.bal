type IntAccumulator function (int acc, int el) returns int;
type IntFilter function (int num) returns boolean;
type IntMapper function (int num) returns int;

public function append(int[] list1, int[] list2) returns int[] {
    int[][] lists = [list1, list2];
    return <int[]>concatenate(lists);
}

public function concatenate(int[][]|int[][][] lists) returns int[]|int[][] {
    if lists is int[][] {
        int[] results = [];
        foreach int[] list in lists {
            results.push(...list);
        }
        return results;
    }
    if lists is int[][][] {
        int[][] results = [];
        foreach int[][] list in lists {
            results.push(...list);
        }
        return results;
    }

    return <int[]>[];
}

public function filter(int[] list, IntFilter fn) returns int[] {
    int[] results = [];
    foreach int item in list {
        if fn(item) {
            results.push(item);
        }
    }
    return results;
}

public function length(int[] list) returns int {
    IntAccumulator fn = function (int acc, int elt) returns int => acc + 1;
    return foldl(list, fn, 0);
}

public function myMap(int[] list, IntMapper fn) returns int[] {
    int[] results = [];
    foreach int item in list {
        int val = fn(item);
        results.push(val);
    }
    return results;
}

public function foldl(int[] list, IntAccumulator fn, int initial) returns int {
    int results = initial;
    foreach int item in list {
        results = fn(results, item);
    }
    return results;
}

public function foldr(int[] list, IntAccumulator fn, int initial) returns int {
    if list.length() == 0 {
        return initial;
    }

    int last = list.pop();
    return foldr(list, fn, fn(initial, last));
}

public function reverse(int[]|int[][] list) returns int[]|int[][] {
    var doReverse = function(int[]|int[][] results) returns int[]|int[][] {
        int len = list.length() - 1;
        foreach int i in int:range(len, -1, -1) {
            results.push(list[i]);
        }
        return results;
    };

    if list is int[][] {
        int[][] results = [];
        return doReverse(results);
    }

    int[] results = [];
    return doReverse(results);
}
