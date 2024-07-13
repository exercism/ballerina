# Generates Pascal's Triangle up to a given number of rows
# 
# + count - The number of rows to generate
# + return - A two-dimensional array representing the final triangle
function rows(int count) returns int[][] {
    int[][] results = [];

    foreach int i in 0...count-1 {
        int[] row = [];
        foreach int j in 0...i {
            if (j == 0 || j == i) {
                row.push(1);
            } else {
                row.push(results[i-1][j-1] + results[i-1][j]);
            }
        }
        results.push(row);
    }

    return results;
}