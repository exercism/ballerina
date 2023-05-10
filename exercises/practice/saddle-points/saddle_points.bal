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
    // TODO implement this function
}
