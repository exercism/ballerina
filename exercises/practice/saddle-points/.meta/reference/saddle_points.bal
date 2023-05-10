public type SaddlePoint record {
    int row;
    int column;
};

# Returns the saddle points in the given matrix.
#
# A saddle point is an value that is:
# - equal to the maximum value in its row, and
# - equal to the minimum value in its column.
#
# + matrix - an array of int arrays (i.e. two-dimensional matrix)
# + return - an array of SaddlePoints
public function saddlePoints(int[][] matrix) returns SaddlePoint[] {
    int[] rowMax = [];
    foreach int[] row in matrix {
        rowMax.push(int:max(int:MIN_VALUE, ...row));
    }

    int[] colMin = [];
    foreach int col in int:range(0, matrix[0].length(), 1) {
        int[] column = matrix.map(row => row[col]);
        colMin.push(int:min(int:MAX_VALUE, ...column));
    }

    SaddlePoint[] result = [];
    foreach int row in int:range(0, matrix.length(), 1) {
        foreach int col in int:range(0, matrix[0].length(), 1) {
            if matrix[row][col] == rowMax[row] && matrix[row][col] == colMin[col] {
                result.push({row: row + 1, column: col + 1});
            }

        }
    }

    return result;
}
