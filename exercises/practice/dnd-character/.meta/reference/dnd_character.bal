import ballerina/random;

class DndCharacter {
    final int strength;

    final int dexterity;

    final int constitution;

    final int intelligence;

    final int wisdom;

    final int charisma;

    final int hitpoints;

    public function init() {
        self.strength = ability();
        self.dexterity = ability();
        self.constitution = ability();
        self.intelligence = ability();
        self.wisdom = ability();
        self.charisma = ability();
        self.hitpoints = modifier(self.constitution) + 10;
    }

    public function getStrength() returns int {
        return self.strength;
    }

    public function getDexterity() returns int {
        return self.dexterity;
    }

    public function getConstitution() returns int {
        return self.constitution;
    }

    public function getIntelligence() returns int {
        return self.intelligence;
    }

    public function getWisdom() returns int {
        return self.wisdom;
    }

    public function getCharisma() returns int {
        return self.charisma;
    }

    public function getHitpoints() returns int {
        return self.hitpoints;
    }
}

public function ability() returns int {
    var accumulateRolls = function(int[] total, int _elem) returns int[] {
        int|random:Error roll = random:createIntInRange(1, 7);
        if roll is int {
            total.push(roll);
        }

        return total;
    };

    var sumRolls = function(int total, int roll) returns int => total + roll;

    return [0, 0, 0, 0].reduce(accumulateRolls, [])
                        .sort("descending")
                        .slice(0, 3)
                        .reduce(sumRolls, 0);
}

public function modifier(int score) returns int {
    float result = (<float>score - 10.0) / 2;
    return <int>float:floor(result);
}
