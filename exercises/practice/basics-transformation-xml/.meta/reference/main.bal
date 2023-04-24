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
    xml payload = check io:fileReadXml(inputFilePath);

    foreach xml child in payload.elementChildren() {
        FillUpEntry {employeeId, odometerReading, gallons, gasPrice} = check xmlToFillUpEntry(child);
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
    
    xmlns "http://www.so2w.org" as s;

    // Following code results in NPE in compiler
    // xml result = xml`<s:employeeFuelRecords xmlns:s="http://www.so2w.org">${from var {employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued} in fillUpTable.toArray()
    //         order by employeeId ascending
    //        select xml`<s:employeeFuelRecord employeeId="${employeeId}">${gasFillUpCount}</s:employeeFuelRecord>`}</s:employeeFuelRecords>`;

    FillUpEmployee[] fillupEmpEntries = from var entry in fillUpTable.toArray()
        order by entry.employeeId ascending
        select entry;

    xml:Element output = xml `<s:employeeFuelRecords xmlns:s="http://www.so2w.org"></s:employeeFuelRecords>`;
    // This is not the proper way to handle this scenario. TODO improve this code   
    xml children = xml ``;
    foreach var {employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued} in fillupEmpEntries {
        xml:Element child = xml`<s:employeeFuelRecord employeeId="${employeeId}"><s:gasFillUpCount>${gasFillUpCount}</s:gasFillUpCount><s:totalFuelCost>${totalFuelCost}</s:totalFuelCost><s:totalGallons>${totalGallons}</s:totalGallons><s:totalMilesAccrued>${totalMilesAccrued}</s:totalMilesAccrued></s:employeeFuelRecord>`;
        children = xml:concat(children, child);
    }

    output.setChildren(children);
    check io:fileWriteXml(outputFilePath, output);
}

function xmlToFillUpEntry(xml fuelEvent) returns FillUpEntry|error {
    xmlns "http://www.so2w.org" as s;
    string empIdStr = check fuelEvent.employeeId;
    xml odometerReadingElement = fuelEvent/**/<s:odometerReading>;
    xml gallonsElement = fuelEvent/**/<s:gallons>;
    xml gasPriceElement = fuelEvent/**/<s:gasPrice>;

    return {
        employeeId: check intFromString(empIdStr),
        odometerReading: check intFromString(odometerReadingElement.data()),
        gallons: check decimalFromString(gallonsElement.data()),
        gasPrice: check decimalFromString(gasPriceElement.data())
    };
}

function intFromString(string s) returns int|error => check int:fromString(s.trim());

function decimalFromString(string s) returns decimal|error => check decimal:fromString(s.trim());

function fuelCost(decimal gallons, decimal gasPrice) returns decimal => gallons * gasPrice;

