enum TriangleType {
    EQUILATERAL,
    ISOSCELES,
    SCALENE
}

# Determines the type of triangle based on the sides
# 
# + sides - The sides of the triangle
# + t - The type of triangle
# + return - Whether the sides form the triangle type
function kind(float[]|int[] sides, TriangleType t) returns boolean {
    if !valid(sides) {
        return false;
    }

    match t {
        EQUILATERAL => {
            return sides[0] == sides[1] && sides[1] == sides[2];
        }
        ISOSCELES => {
            return sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2];
        }
        SCALENE => {
            return sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2];
        }
    }

    return false;
}

# Determines if the sides form a valid triangle
# 
# + sides - The sides of the triangle
# + return - Whether the sides form a valid triangle
function valid(int[]|float[] sides) returns boolean {
    if sides is float[] {
        float[] sorted = sides.sort();
        return sorted.every(function(float num) returns boolean => num > 0.0) && sorted[0] + sorted[1] > sorted[2];
    } else if sides is int[]{
        int[] sorted = sides.sort();
        return sorted.every(function(int num) returns boolean => num > 0) && sorted[0] + sorted[1] > sorted[2];
    }

    return false;
}