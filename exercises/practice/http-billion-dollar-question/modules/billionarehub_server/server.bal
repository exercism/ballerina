import ballerina/http;

type Billionaire record {
    string name;
    float netWorth;
};

service / on new http:Listener(9090) {
    resource function get getBillionaires(string country) returns Billionaire[]|error {
        Billionaire[]? billionaires = topbillionaires[country];
        if (billionaires is Billionaire[]) {
            return billionaires;
        }
        return error(country + " is not found in the sample dataset.");
    }
}

final map<Billionaire[]> topbillionaires = {
    "United States": [
        {
            name: "Elon Musk",
            netWorth: 177
        },
        {
            name: "Jeff Bezos",
            netWorth: 151
        },
        {
            name: "Bill Gates",
            netWorth: 124
        },
        {
            name: "Mark Zuckerberg",
            netWorth: 97
        },
        {
            name: "Larry Ellison",
            netWorth: 93
        },
        {
            name: "Larry Page",
            netWorth: 91.5
        },
        {
            name: "Sergey Brin",
            netWorth: 89
        },
        {
            name: "Warren Buffett",
            netWorth: 88
        },
        {
            name: "Steve Ballmer",
            netWorth: 68
        },
        {
            name: "Mukesh Ambani",
            netWorth: 84
        }
    ],
    "China": [
        {
            name: "Zhong Shanshan",
            netWorth: 68
        },
        {
            name: "Zhang Yiming",
            netWorth: 35
        },
        {
            name: "Ma Huateng",
            netWorth: 65
        },
        {
            name: "Jack Ma",
            netWorth: 48
        },
        {
            name: "Colin Huang",
            netWorth: 55
        },
        {
            name: "Pony Ma",
            netWorth: 55
        },
        {
            name: "He Xiangjian",
            netWorth: 43
        },
        {
            name: "Yang Huiyan & family",
            netWorth: 29
        },
        {
            name: "Wang Xing",
            netWorth: 27
        },
        {
            name: "William Lei Ding",
            netWorth: 27
        }
    ],
    "India": [
        {
            name: "Mukesh Ambani",
            netWorth: 84
        },
        {
            name: "Gautam Adani & family",
            netWorth: 50
        },
        {
            name: "Shiv Nadar",
            netWorth: 23
        },
        {
            name: "Radhakishan Damani",
            netWorth: 16
        },
        {
            name: "Lakshmi Mittal",
            netWorth: 18
        },
        {
            name: "Hinduja brothers",
            netWorth: 17
        },
        {
            name: "Cyrus Poonawalla",
            netWorth: 12
        },
        {
            name: "Uday Kotak",
            netWorth: 15
        },
        {
            name: "Sunil Mittal & family",
            netWorth: 11
        },
        {
            name: "Kumar Birla",
            netWorth: 10
        }
    ],
    "Japan": [
        {
            name: "Tadashi Yanai & family",
            netWorth: 31
        },
        {
            name: "Takemitsu Takizaki",
            netWorth: 28
        },
        {
            name: "Masayoshi Son",
            netWorth: 29
        },
        {
            name: "Nobutada Saji & family",
            netWorth: 28
        },
        {
            name: "Takemitsu Takizaki",
            netWorth: 28
        },
        {
            name: "Hiroshi Mikitani",
            netWorth: 24
        },
        {
            name: "Yasumitsu Shigeta",
            netWorth: 24
        },
        {
            name: "Takemitsu Takizaki",
            netWorth: 28
        },
        {
            name: "Takemitsu Takizaki",
            netWorth: 28
        },
        {
            name: "Takemitsu Takizaki",
            netWorth: 28
        }
    ],
    "Hong Kong": [
        {
            name: "Li Ka-shing",
            netWorth: 35
        },
        {
            name: "Lee Shau Kee",
            netWorth: 28
        },
        {
            name: "Raymond Kwok & family",
            netWorth: 17
        },
        {
            name: "Thomas Kwok & family",
            netWorth: 17
        },
        {
            name: "Peter Woo",
            netWorth: 14
        },
        {
            name: "Joseph Lau",
            netWorth: 17
        },
        {
            name: "Cheng Yu-tung & family",
            netWorth: 17
        },
        {
            name: "Lui Che Woo & family",
            netWorth: 15
        },
        {
            name: "Henry Cheng & family",
            netWorth: 15
        },
        {
            name: "Michael Kadoorie & family",
            netWorth: 13
        }
    ],
    "Russia": [
        {
            name: "Vladimir Lisin",
            netWorth: 24
        },
        {
            name: "Vladimir Potanin",
            netWorth: 23
        },
        {
            name: "Alexey Mordashov & family",
            netWorth: 22
        },
        {
            name: "Leonid Mikhelson",
            netWorth: 20
        },
        {
            name: "Gennady Timchenko",
            netWorth: 20
        },
        {
            name: "Vagit Alekperov",
            netWorth: 19
        },
        {
            name: "Alisher Usmanov",
            netWorth: 19
        },
        {
            name: "Viktor Vekselberg",
            netWorth: 17
        },
        {
            name: "Roman Abramovich",
            netWorth: 17
        },
        {
            name: "Andrey Melnichenko",
            netWorth: 16
        }
    ],
    "Italy": [
        {
            name: "Leonardo Del Vecchio & family",
            netWorth: 25
        },
        {
            name: "Stefano Pessina",
            netWorth: 12
        },
        {
            name: "Massimiliana Landini Aleotti & family",
            netWorth: 13
        },
        {
            name: "Giovanni Ferrero",
            netWorth: 35
        },
        {
            name: "Giorgio Armani",
            netWorth: 8
        },
        {
            name: "Sergio Marchionne",
            netWorth: 5
        },
        {
            name: "Stefano Pessina",
            netWorth: 12
        },
        {
            name: "Massimiliana Landini Aleotti & family",
            netWorth: 13
        },
        {
            name: "Giovanni Ferrero",
            netWorth: 35
        },
        {
            name: "Giorgio Armani",
            netWorth: 8
        }
    ],
    "France": [
        {
            name: "Bernard Arnault & family",
            netWorth: 150
        },
        {
            name: "Francoise Bettencourt Meyers & family",
            netWorth: 71
        },
        {
            name: "Francois Pinault & family",
            netWorth: 42
        },
        {
            name: "Alain Wertheimer",
            netWorth: 33
        },
        {
            name: "Gerard Wertheimer",
            netWorth: 33
        },
        {
            name: "Serge Dassault & family",
            netWorth: 26
        },
        {
            name: "Patrick Drahi",
            netWorth: 21
        },
        {
            name: "Xavier Niel",
            netWorth: 13
        },
        {
            name: "Alain Merieux & family",
            netWorth: 7
        },
        {
            name: "Vincent Bollore",
            netWorth: 7
        }
    ],
    "Germany": [
        {
            name: "Beate Heister & Karl Albrecht Jr.",
            netWorth: 39
        },
        {
            name: "Dieter Schwarz",
            netWorth: 35
        },
        {
            name: "Susanne Klatten",
            netWorth: 29
        },
        {
            name: "Stefan Quandt",
            netWorth: 29
        },
        {
            name: "Heinz Hermann Thiele & family",
            netWorth: 22
        },
        {
            name: "Klaus-Michael Kuhne",
            netWorth: 20
        },
        {
            name: "August von Finck",
            netWorth: 20
        },
        {
            name: "Michael Otto & family",
            netWorth: 19
        },
        {
            name: "Hasso Plattner & family",
            netWorth: 15
        },
        {
            name: "Reinhold Wurth & family",
            netWorth: 12
        }
    ],
    "Australia": [
        {
            name: "Gina Rinehart",
            netWorth: 31
        },
        {
            name: "Andrew Forrest",
            netWorth: 23
        },
        {
            name: "Anthony Pratt & family",
            netWorth: 19
        },
        {
            name: "James Packer",
            netWorth: 3
        },
        {
            name: "Harry Triguboff",
            netWorth: 12
        },
        {
            name: "Frank Lowy",
            netWorth: 6
        },
        {
            name: "John Gandel",
            netWorth: 6
        },
        {
            name: "Stan Perron",
            netWorth: 2
        },
        {
            name: "Kerr Neilson",
            netWorth: 2
        },
        {
            name: "Lindsay Fox",
            netWorth: 2
        }
    ],
    "Indonesia": [
        {
            name: "Robert Budi Hartono",
            netWorth: 20
        },
        {
            name: "Michael Hartono",
            netWorth: 20
        },
        {
            name: "Sri Prakash Lohia",
            netWorth: 13
        },
        {
            name: "Eka Tjipta Widjaja & family",
            netWorth: 9
        },
        {
            name: "Anthoni Salim & family",
            netWorth: 7
        },
        {
            name: "Tahir",
            netWorth: 4
        },
        {
            name: "Sukanto Tanoto",
            netWorth: 4
        },
        {
            name: "Peter Sondakh",
            netWorth: 3
        },
        {
            name: "Low Tuck Kwong",
            netWorth: 3
        },
        {
            name: "Putera Sampoerna",
            netWorth: 3
        }
    ],
    "Canada": [
        {
            name: "David Thomson & family",
            netWorth: 39
        },
        {
            name: "Joseph Tsai",
            netWorth: 10
        },
        {
            name: "Galen Weston & family",
            netWorth: 10
        },
        {
            name: "James Irving",
            netWorth: 8
        },
        {
            name: "Jim Pattison",
            netWorth: 7
        },
        {
            name: "Emanuele (Lino) Saputo",
            netWorth: 5
        },
        {
            name: "Alain Bouchard",
            netWorth: 4
        },
        {
            name: "Charles Bronfman",
            netWorth: 2
        },
        {
            name: "Michael Lee-Chin",
            netWorth: 2
        },
        {
            name: "Daryl Katz",
            netWorth: 2
        }
    ],
    "Finland": [
        {
            name: "Antti Herlin & family",
            netWorth: 13
        },
        {
            name: "Heikki Kyostila",
            netWorth: 5
        },
        {
            name: "Ilkka Herlin",
            netWorth: 4
        },
        {
            name: "Mika Anttonen",
            netWorth: 3
        },
        {
            name: "Niklas Herlin",
            netWorth: 3
        },
        {
            name: "Ilona Herlin",
            netWorth: 3
        },
        {
            name: "Ilkka Paananen",
            netWorth: 2
        },
        {
            name: "Hannu Haukka",
            netWorth: 2
        },
        {
            name: "Matti Marjanen",
            netWorth: 2
        },
        {
            name: "Mika Ihamuotila",
            netWorth: 2
        }
    ],
    "Mexico": [
        {
            name: "Carlos Slim Helu & family",
            netWorth: 52
        },
        {
            name: "German Larrea Mota Velasco & family",
            netWorth: 27
        },
        {
            name: "Alberto Bailleres Gonzalez & family",
            netWorth: 10
        },
        {
            name: "Ricardo Salinas Pliego & family",
            netWorth: 9
        },
        {
            name: "Maria Asuncion Aramburuzabala & family",
            netWorth: 5
        },
        {
            name: "Juan Francisco Beckmann Vidal & family",
            netWorth: 5
        },
        {
            name: "Roberto Hernandez Ramirez & family",
            netWorth: 4
        },
        {
            name: "Carlos Hank Rhon",
            netWorth: 2
        },
        {
            name: "Antonio del Valle Ruiz & family",
            netWorth: 2
        },
        {
            name: "Carlos Peralta Quintero",
            netWorth: 2
        }
    ]
};
