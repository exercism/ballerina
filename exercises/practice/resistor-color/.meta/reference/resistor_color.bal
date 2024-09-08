final string[] colorList = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
];

# Calculates the resistor value for the passed band color
# 
# + color - The color of the resistor band
# + return - The value of the resistor band
function colorCode(string color) returns int {
    return colorList.indexOf(color) ?: 0;
}

# Returns the list of colors in the resistor color code
# + return - The list of colors
function colors() returns string[] {
   return colorList;
}