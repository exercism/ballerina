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
            ["Mukesh Ambani","Zhong Shanshan","Ma Huateng","Colin Huang","Pony Ma"]
        ],
        "case3": [
            ["China", "India", "Japan", "Hong Kong"],
            10,
            ["Mukesh Ambani","Zhong Shanshan","Ma Huateng","Colin Huang","Pony Ma","Gautam Adani & family","Jack Ma","He Xiangjian","Zhang Yiming","Li Ka-shing"]
        ],
        "case4": [
            ["Russia", "Italy", "France", "Germany", "Australia"],
            3,
            ["Bernard Arnault & family","Francoise Bettencourt Meyers & family","Francois Pinault & family"]
        ],
        "case5": [
            ["Indonesia", "Japan", "Hong Kong"],
            7,
            ["Li Ka-shing","Tadashi Yanai & family","Masayoshi Son","Takemitsu Takizaki","Nobutada Saji & family","Takemitsu Takizaki","Takemitsu Takizaki"]
        ],
        "case6": [
            ["India"],
            1,
            ["Mukesh Ambani"]
        ],
        "case7": [
            ["Russia"],
            3,
            ["Vladimir Lisin","Vladimir Potanin","Alexey Mordashov & family"]
        ],
        "case8": [
            ["Mexico"],
            1,
            ["Carlos Slim Helu & family"]
        ],
        "case9": [
            ["Canada", "Finland"],
            2,
            ["David Thomson & family","Antti Herlin & family"]
        ]
    };
}
