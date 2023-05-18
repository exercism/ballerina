# Returns the saddle points in the given matrix.
#
# A saddle point is an value that is:
# - equal to the maximum value in its row, and
# - equal to the minimum value in its column.
#
# + matrix - an array of int arrays (i.e. two-dimensional matrix)
# + return - an array of maps [{"row": x, "column": y}, ...]
public function saddlePoints(int[][] matrix) returns map<int>[] {
    int[] rowMax = [];
    foreach int[] row in matrix {
        rowMax.push(int:max(int:MIN_VALUE, ...row));
    }

    int[] colMin = [];
    foreach int col in int:range(0, matrix[0].length(), 1) {
        int[] column = matrix.map(row => row[col]);
        colMin.push(int:min(int:MAX_VALUE, ...column));
    }

    map<int>[] result = [];
    foreach int r in int:range(0, matrix.length(), 1) {
        foreach int c in int:range(0, matrix[0].length(), 1) {
            if matrix[r][c] == rowMax[r] && matrix[r][c] == colMin[c] {
                result.push({"row": r + 1, "column": c + 1});
            }
        }
    }

    return result;
}
