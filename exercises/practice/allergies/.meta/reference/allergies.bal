class Allergies {
    private final int score;

    private final string[] allergens = [
        "eggs",
        "peanuts",
        "shellfish",
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
    ];

    function init(int score) {
        self.score = score;
    }

    function allergicTo(string candidate) returns boolean {
        return self.list().some(allergen => allergen == candidate);
    }

    function list() returns string[] {
        string[] results = [];
        foreach [int, string] [i, allergen] in self.allergens.enumerate() {
            if (self.score & 1 << i) != 0 {
                results.push(allergen);
            }
        }

        return results;
    }
}
