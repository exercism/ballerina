# Determine the score of a set of dice against a Yacht category.
#
# + dice - an array of 5 integers
# + category - the name of a combination of dice
# + return - the score
public function score(int[] dice, string category) returns int {
    match category {
        "ones"            => { return scoreFor(dice, 1); }
        "twos"            => { return scoreFor(dice, 2); }
        "threes"          => { return scoreFor(dice, 3); }
        "fours"           => { return scoreFor(dice, 4); }
        "fives"           => { return scoreFor(dice, 5); }
        "sixes"           => { return scoreFor(dice, 6); }
        "full house"      => { return fullHouse(dice); }
        "four of a kind"  => { return fourOfAKind(dice); }
        "little straight" => { return straight(dice, [1, 2, 3, 4, 5]); }
        "big straight"    => { return straight(dice, [2, 3, 4, 5, 6]); }
        "yacht"           => { return yacht(dice); }
        "choice"          => { return total(dice); }
        _                 => { return -1; }
    }
}

function total(int[] dice) returns int => int:sum(...dice);

function scoreFor(int[] dice, int die) returns int {
    int[] counts = histogram(dice);
    return die * counts[die];
}

function histogram(int[] dice) returns int[] {
    int[] counts = [-1, 0, 0, 0, 0, 0, 0];
    foreach int die in dice {
        counts[die] += 1;
    }
    return counts;
}

function fullHouse(int[] dice) returns int {
    int[] counts = histogram(dice).filter(c => c > 0);
    return counts.sort() == [2, 3] ? total(dice) : 0;
}

function fourOfAKind(int[] dice) returns int {
    int[] counts = histogram(dice);
    foreach [int, int] [die, count] in counts.enumerate() {
        if count >= 4 {
            return 4 * die;
        }
    }
    return 0;
}

function straight(int[] dice, int[] canonical) returns int {
    return dice.sort() == canonical ? 30 : 0;
}

function yacht(int[] dice) returns int {
    return dice.every(d => d == dice[0]) ? 50 : 0;
}
