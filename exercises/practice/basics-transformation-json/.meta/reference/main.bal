import ballerina/io;

type FillUpEmployee record {|
    readonly int employeeId;
    int gasFillUpCount;
    decimal totalFuelCost;
    decimal totalGallons;
    int totalMilesAccrued;
    int currentOdometerReading;
|};

type FillUpEntry record {|
    int employeeId;
    int odometerReading;
    decimal gallons;
    decimal gasPrice;
|};

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    table<FillUpEmployee> key(employeeId) fillUpTable = table [];
    json payload = check io:fileReadJson(inputFilePath);
    FillUpEntry[] entries = check payload.fromJsonWithType();
    foreach var {employeeId, odometerReading, gallons, gasPrice} in entries {
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

    json[] output = from var {employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued} in fillUpTable.toArray()
        order by employeeId ascending
        select {employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued};

    // TODO I should be able to use fillUpTable.toArray() instead of fillUpTable.toArray().toJson()
    check io:fileWriteJson(outputFilePath, output);
}

function fuelCost(decimal gallons, decimal gasPrice) returns decimal => gallons * gasPrice;
