map<float> OrbitalPeriod = {
    "Mercury": 0.2408467,
    "Venus": 0.61519726,
    "Earth": 1.0,
    "Mars": 1.8808158,
    "Jupiter": 11.862615,
    "Saturn": 29.447498,
    "Uranus": 84.016846,
    "Neptune": 164.79132
};

const float SecondsPerEarthYear = 31557600.0;

function age(string planet, int seconds) returns float|error {
    if !OrbitalPeriod.hasKey(planet) {
        return error("not a planet");
    }
    float age = <float>seconds / OrbitalPeriod.get(planet) / SecondsPerEarthYear;
    return age.round(2);
}
