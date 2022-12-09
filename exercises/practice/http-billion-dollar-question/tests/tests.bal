import ballerina/io;
import ballerina/test;

@test:Config {
    dataProvider: validData,
    groups: ["sample"]
}
function testGetTopXBillionaires(string[] countries, int 'limit, string[] expected) {
    string[]|error actual = getTopXBillionaires(countries, 'limit);
    if actual is error {
        io:println(actual.message());
        test:assertFail("Failed to fetch top billionaires");
    }
    test:assertEquals(actual, expected);
}

function validData() returns map<[string[], int, string[]]> {
    return {
        "case1": [
            ["United States"],
            3,
            ["Elon Musk", "Jeff Bezos", "Bill Gates"]
        ],
        "case2": [
            ["China", "India"],
            5,
            ["Mukesh Ambani", "Gautam Adani & family", "Zhong Shanshan", "Zhang Yiming", "Ma Huateng"]
        ],
        "case3": [
            ["China", "India", "Japan", "Hong Kong"],
            10,
            ["Mukesh Ambani", "Gautam Adani & family", "Zhong Shanshan", "Zhang Yiming", "Robin Zeng", "Ma Huateng", "Li Ka-shing", "Lee Shau Kee", "Shiv Nadar", "He Xiangjian"]
        ],
        "case4": [
            ["Russia", "Italy", "France", "Germany", "Australia"],
            3,
            ["Bernard Arnault & family", "Francoise Bettencourt Meyers & family", "Dieter Schwarz"]
        ],
        "case5": [
            ["Indonesia", "Japan", "Hong Kong"],
            7,
            ["Robin Zeng", "Li Ka-shing", "Lee Shau Kee", "Tadashi Yanai & family", "Takemitsu Takizaki", "R. Budi Hartono", "Michael Hartono"]
        ],
        "case6": [
            ["India"],
            1,
            ["Mukesh Ambani"]
        ],
        "case7": [
            ["Russia"],
            3,
            ["Vladimir Lisin", "Vladimir Potanin"]
        ],
        "case8": [
            ["Mexico"],
            1,
            ["Carlos Slim Helu & family"]
        ],
        "case9": [
            ["Canada", "Finland"],
            2,
            ["Changpeng Zhao", "David Thomson & family"]
        ]
    };
}
