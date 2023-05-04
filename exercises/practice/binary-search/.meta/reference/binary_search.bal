# Search an array for a value and return the index.
#
# + array - a sorted array of integers
# + value - the integer item to find
# + return - the index of the value, or nil if the value is not found
public function find(int[] array, int value) returns int? {
    int i = 0;
    int j = array.length() - 1;

    while i <= j {
        int mid = (i + j) / 2;
        if value == array[mid] {
            return mid;
        }
        [i, j] = value < array[mid] ? [i, mid-1] : [mid+1, j];
    }

    return;
}
