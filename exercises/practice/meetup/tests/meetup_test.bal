import ballerina/test;

@test:Config {
    enable: false
}
function whenTeenthMondayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthMondayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthMondayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthTuesdayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthTuesdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthTuesdayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthWednesdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthWednesdayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthWednesdayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthThursdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthThursdayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthThursdayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthFridayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthFridayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthFridayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSaturdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSaturdayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSaturdayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSundayIsThe_19thTheLastDayOfTheTeenthWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSundayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenTeenthSundayIsThe_13thTheFirstDayOfTheTeenthWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Teenth));
}

@test:Config {
    enable: false
}
function whenFirstMondayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 4);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstMondayIsThe_1stTheFirstDayOfTheFirstWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 1);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstTuesdayIsThe_7thTheLastDayOfTheFirstWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 7);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstTuesdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 4);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstWednesdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(7, 2013);
    var expected = new DateTime(2013, 7, 3);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstWednesdayIsThe_7thTheLastDayOfTheFirstWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 7);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstThursdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 5);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstThursdayIsAnotherDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 3);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstFridayIsThe_1stTheFirstDayOfTheFirstWeek() {
    var sut = new Meetup(11, 2013);
    var expected = new DateTime(2013, 11, 1);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstFridayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(12, 2013);
    var expected = new DateTime(2013, 12, 6);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstSaturdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 5);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstSaturdayIsAnotherDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 2);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstSundayIsSomeDayInTheMiddleOfTheFirstWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 3);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenFirstSundayIsThe_7thTheLastDayOfTheFirstWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 7);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.First));
}

@test:Config {
    enable: false
}
function whenSecondMondayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 11);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondMondayIsThe_8thTheFirstDayOfTheSecondWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 8);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondTuesdayIsThe_14thTheLastDayOfTheSecondWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 14);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondTuesdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 11);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondWednesdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(7, 2013);
    var expected = new DateTime(2013, 7, 10);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondWednesdayIsThe_14thTheLastDayOfTheSecondWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 14);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondThursdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 12);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondThursdayIsAnotherDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 10);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondFridayIsThe_8thTheFirstDayOfTheSecondWeek() {
    var sut = new Meetup(11, 2013);
    var expected = new DateTime(2013, 11, 8);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondFridayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(12, 2013);
    var expected = new DateTime(2013, 12, 13);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondSaturdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 12);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondSaturdayIsAnotherDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 9);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondSundayIsSomeDayInTheMiddleOfTheSecondWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 10);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenSecondSundayIsThe_14thTheLastDayOfTheSecondWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 14);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Second));
}

@test:Config {
    enable: false
}
function whenThirdMondayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 18);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdMondayIsThe_15thTheFirstDayOfTheThirdWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 15);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdTuesdayIsThe_21stTheLastDayOfTheThirdWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 21);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdTuesdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 18);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdWednesdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(7, 2013);
    var expected = new DateTime(2013, 7, 17);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdWednesdayIsThe_21stTheLastDayOfTheThirdWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 21);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdThursdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdThursdayIsAnotherDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 17);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdFridayIsThe_15thTheFirstDayOfTheThirdWeek() {
    var sut = new Meetup(11, 2013);
    var expected = new DateTime(2013, 11, 15);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdFridayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(12, 2013);
    var expected = new DateTime(2013, 12, 20);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdSaturdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 19);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdSaturdayIsAnotherDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 16);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdSundayIsSomeDayInTheMiddleOfTheThirdWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 17);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenThirdSundayIsThe_21stTheLastDayOfTheThirdWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 21);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Third));
}

@test:Config {
    enable: false
}
function whenFourthMondayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 25);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthMondayIsThe_22ndTheFirstDayOfTheFourthWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 22);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthTuesdayIsThe_28thTheLastDayOfTheFourthWeek() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthTuesdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 25);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthWednesdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(7, 2013);
    var expected = new DateTime(2013, 7, 24);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthWednesdayIsThe_28thTheLastDayOfTheFourthWeek() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthThursdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 26);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthThursdayIsAnotherDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 24);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthFridayIsThe_22ndTheFirstDayOfTheFourthWeek() {
    var sut = new Meetup(11, 2013);
    var expected = new DateTime(2013, 11, 22);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthFridayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(12, 2013);
    var expected = new DateTime(2013, 12, 27);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthSaturdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 26);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthSaturdayIsAnotherDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 23);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthSundayIsSomeDayInTheMiddleOfTheFourthWeek() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 24);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function whenFourthSundayIsThe_28thTheLastDayOfTheFourthWeek() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Fourth));
}

@test:Config {
    enable: false
}
function lastMondayInAMonthWithFourMondays() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 25);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastMondayInAMonthWithFiveMondays() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 29);
    test:assertEquals(expected, sut.Day(DayOfWeek.Monday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastTuesdayInAMonthWithFourTuesdays() {
    var sut = new Meetup(5, 2013);
    var expected = new DateTime(2013, 5, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastTuesdayInAnotherMonthWithFourTuesdays() {
    var sut = new Meetup(6, 2013);
    var expected = new DateTime(2013, 6, 25);
    test:assertEquals(expected, sut.Day(DayOfWeek.Tuesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastWednesdayInAMonthWithFiveWednesdays() {
    var sut = new Meetup(7, 2013);
    var expected = new DateTime(2013, 7, 31);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastWednesdayInAMonthWithFourWednesdays() {
    var sut = new Meetup(8, 2013);
    var expected = new DateTime(2013, 8, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastThursdayInAMonthWithFourThursdays() {
    var sut = new Meetup(9, 2013);
    var expected = new DateTime(2013, 9, 26);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastThursdayInAMonthWithFiveThursdays() {
    var sut = new Meetup(10, 2013);
    var expected = new DateTime(2013, 10, 31);
    test:assertEquals(expected, sut.Day(DayOfWeek.Thursday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastFridayInAMonthWithFiveFridays() {
    var sut = new Meetup(11, 2013);
    var expected = new DateTime(2013, 11, 29);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastFridayInAMonthWithFourFridays() {
    var sut = new Meetup(12, 2013);
    var expected = new DateTime(2013, 12, 27);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastSaturdayInAMonthWithFourSaturdays() {
    var sut = new Meetup(1, 2013);
    var expected = new DateTime(2013, 1, 26);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastSaturdayInAnotherMonthWithFourSaturdays() {
    var sut = new Meetup(2, 2013);
    var expected = new DateTime(2013, 2, 23);
    test:assertEquals(expected, sut.Day(DayOfWeek.Saturday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastSundayInAMonthWithFiveSundays() {
    var sut = new Meetup(3, 2013);
    var expected = new DateTime(2013, 3, 31);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastSundayInAMonthWithFourSundays() {
    var sut = new Meetup(4, 2013);
    var expected = new DateTime(2013, 4, 28);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Last));
}

@test:Config {
    enable: false
}
function whenLastWednesdayInFebruaryInALeapYearIsThe_29th() {
    var sut = new Meetup(2, 2012);
    var expected = new DateTime(2012, 2, 29);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function lastWednesdayInDecemberThatIsAlsoTheLastDayOfTheYear() {
    var sut = new Meetup(12, 2014);
    var expected = new DateTime(2014, 12, 31);
    test:assertEquals(expected, sut.Day(DayOfWeek.Wednesday, Schedule.Last));
}

@test:Config {
    enable: false
}
function whenLastSundayInFebruaryInANonLeapYearIsNotThe_29th() {
    var sut = new Meetup(2, 2015);
    var expected = new DateTime(2015, 2, 22);
    test:assertEquals(expected, sut.Day(DayOfWeek.Sunday, Schedule.Last));
}

@test:Config {
    enable: false
}
function whenFirstFridayIsThe_7thTheLastDayOfTheFirstWeek() {
    var sut = new Meetup(12, 2012);
    var expected = new DateTime(2012, 12, 7);
    test:assertEquals(expected, sut.Day(DayOfWeek.Friday, Schedule.First));
}
