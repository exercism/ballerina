class KindergartenGarden {
    final map<string[]> plots;

    function init(string diagram) {
        string[][] rows = re `\n`.split(diagram)
                                 .map(row => row.toCodePointInts()
                                 .map(c => codes.get(checkpanic string:fromCodePointInt(c))));

        self.plots = {};
        students.enumerate().forEach(function([int, string] arr) returns () {
            string student = arr[1];
            int firstPosition = arr[0] * 2;
            int secondPosition = firstPosition + 1;
            if (rows[0].length() <= secondPosition) {
                return;
            }

            string[] plants = rows.reduce(function(string[] acc, string[] row) returns string[] {
                acc.push(row[firstPosition]);
                acc.push(row[secondPosition]);
                return acc;
            }, []);

            self.plots[student] = plants;
        });
    }

    function plants(string student) returns string[] {
        return self.plots.get(student);
    }
}

final map<string> codes = {
    "V": "violets",
    "R": "radishes",
    "C": "clover",
    "G": "grass"
};

final string[] students = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Fred",
    "Ginny",
    "Harriet",
    "Ileana",
    "Joseph",
    "Kincaid",
    "Larry"
];