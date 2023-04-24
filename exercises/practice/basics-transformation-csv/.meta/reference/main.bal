import ballerina/io;

type FillUpEmployee record {|
    readonly int employeeId;
    int gasFillUpCount;
    decimal totalFuelCost;
    decimal totalGallons;
    int totalMilesAccrued;
    int currentOdometerReading;
|};

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    table<FillUpEmployee> key(employeeId) fillUpTable = table [];
    string[][] inputCSV = check io:fileReadCsv(inputFilePath);
    foreach var line in inputCSV {
        var [employeeId, odometerReading, gallons, gasPrice] = check readCSVLine(line);
        if fillUpTable.hasKey(employeeId) {
            FillUpEmployee fillUp = fillUpTable.get(employeeId);
            fillUp.gasFillUpCount += 1;
            fillUp.totalFuelCost += fuelCost(gallons, gasPrice);
            fillUp.totalGallons += gallons;
            fillUp.totalMilesAccrued += odometerReading - fillUp.currentOdometerReading;
            fillUp.currentOdometerReading = odometerReading;
        } else {
            FillUpEmployee fillUp = {
                employeeId,
                gasFillUpCount: 1,
                totalFuelCost: fuelCost(gallons, gasPrice),
                totalGallons: gallons,
                totalMilesAccrued: 0,
                currentOdometerReading: odometerReading
            };
            fillUpTable.add(fillUp);
        }
    }

    string[][] output = [];
    int[] employeeIds = fillUpTable.keys().sort();
    foreach var empId in employeeIds {
        output.push(fillUpEmployeeToCSVLine(fillUpTable.get(empId)));
    }
    check io:fileWriteCsv(outputFilePath, output);
}

function keyF(FillUpEmployee f) returns int => f.employeeId;

function readCSVLine(string[] line) returns [int, int, decimal, decimal]|error => [
    check intFromString(line[0]),
    check intFromString(line[1]),
    check decimalFromString(line[2]),
    check decimalFromString(line[3])
];

function intFromString(string s) returns int|error => check int:fromString(s.trim());

function decimalFromString(string s) returns decimal|error => check decimal:fromString(s.trim());

function fuelCost(decimal gallons, decimal gasPrice) returns decimal => gallons * gasPrice;

function fillUpEmployeeToCSVLine(FillUpEmployee fillUp) returns string[] => [
    fillUp.employeeId.toString(),
    fillUp.gasFillUpCount.toString(),
    fillUp.totalFuelCost.toString(),
    fillUp.totalGallons.toString(),
    fillUp.totalMilesAccrued.toString()
];

