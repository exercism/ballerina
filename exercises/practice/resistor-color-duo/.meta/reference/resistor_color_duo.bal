# Calculates the resistor value for the passed band colors
#
# + colors - The colors of the resistor bands
# + return - The value of the resistor bands
function value(string[] colors) returns int {
    int tens = colorCode(colors[0]);
    int ones = colorCode(colors[1]);
    return tens * 10 + ones;
}

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
