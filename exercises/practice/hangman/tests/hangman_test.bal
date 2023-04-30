import ballerina/test;

@test:Config {
    enable: false
}
function initialStateMasksTheWord() {
    var hangman = new Hangman("foo");
    var actual = "";

    // +a->
    hangman.StateObservable.Subscribe(
        x => actual = x.MaskedWord,
        ex => throw new Exception("Should not finish with too many tries"),
        () => throw new Exception("Should not win yet"));
    test:assertEquals("___", actual);
}

@test:Config {
    enable: false
}
function initialStateHas_9RemainingGuesses() {
    var hangman = new Hangman("foo");
    var actual = 9;

    // +a->
    hangman.StateObservable.Subscribe(x => actual = x.RemainingGuesses);

    test:assertEquals(9, actual);
}

@test:Config {
    enable: false
}
function initialStateHasNoGuessedChars() {
    var hangman = new Hangman("foo");
    var actual = new HashSet<char> {'x'}.ToImmutableHashSet();

    // +a->
    hangman.StateObservable.Subscribe(x => actual = x.GuessedChars);

    test:assertEquals(new HashSet<char>().ToImmutableHashSet(), actual);
}

@test:Config {
    enable: false
}
function guessChangesState() {
    var hangman = new Hangman("foo");
    HangmanState actual = null;
    hangman.StateObservable.Subscribe(x => actual = x);
    var initial = actual;

    // +--x->
    // +a-b->
    hangman.GuessObserver.OnNext('x');

    Assert.NotEqual(initial, actual);
}

@test:Config {
    enable: false
}
function wrongGuessDecrementsRemainingGuesses() {
    var hangman = new Hangman("foo");
    HangmanState actual = null;
    hangman.StateObservable.Subscribe(x => actual = x);
    var initial = actual;

    // +--x->
    // +a-b->
    hangman.GuessObserver.OnNext('x');

    test:assertEquals(initial.RemainingGuesses - 1, actual.RemainingGuesses);
}

@test:Config {
    enable: false
}
function after_10IncorrectGuessesTheGameIsOver() {
    var scheduler = new TestScheduler();
    IObservable<HangmanState> Create()
    {
        var hangman = new Hangman("foo");
        for (var i = 1; i <= 10; i++)
        {
            scheduler.Schedule(TimeSpan.FromTicks(i * 100), () => hangman.GuessObserver.OnNext('x'));
        }

        return hangman.StateObservable;
    }

    var expected = new[]
    {
        OnNext<HangmanState>(100, hangmanState => hangmanState.RemainingGuesses == 9),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 8),
        OnNext<HangmanState>(300, hangmanState => hangmanState.RemainingGuesses == 7),
        OnNext<HangmanState>(400, hangmanState => hangmanState.RemainingGuesses == 6),
        OnNext<HangmanState>(500, hangmanState => hangmanState.RemainingGuesses == 5),
        OnNext<HangmanState>(600, hangmanState => hangmanState.RemainingGuesses == 4),
        OnNext<HangmanState>(700, hangmanState => hangmanState.RemainingGuesses == 3),
        OnNext<HangmanState>(800, hangmanState => hangmanState.RemainingGuesses == 2),
        OnNext<HangmanState>(900, hangmanState => hangmanState.RemainingGuesses == 1),
        OnNext<HangmanState>(1000, hangmanState => hangmanState.RemainingGuesses == 0),
        OnError<HangmanState>(1100, ex => ex is TooManyGuessesException)
    };

    // +--x-x-x-x-x-x-x-x-x-x->
    // +a-b-c-d-e-f-g-h-i-j-#
    ITestableObserver<HangmanState> testableObserver = scheduler.Start(Create, 100, 100, 3000);

    ReactiveAssert.AreElementsEqual(expected, testableObserver.Messages);
}

@test:Config {
    enable: false
}
function correctlyGuessingALetterUnmasksIt() {
    var scheduler = new TestScheduler();
    IObservable<HangmanState> Create()
    {
        var hangman = new Hangman("foobar");
        scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('b'));
        scheduler.Schedule(TimeSpan.FromTicks(200), () => hangman.GuessObserver.OnNext('o'));
        return hangman.StateObservable;
    }

    var expected = new[]
    {
        OnNext<HangmanState>(100, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "______"),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "__B__"),
        OnNext<HangmanState>(300, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "Oob__")
    };

    // +--b-o->
    // +a-b-c->
    ITestableObserver<HangmanState> testableObserver = scheduler.Start(Create, 100, 100, 3000);

    ReactiveAssert.AreElementsEqual(expected, testableObserver.Messages);
}

@test:Config {
    enable: false
}
function guessingACorrectLetterTwiceCountsAsAFailure() {
    var scheduler = new TestScheduler();
    IObservable<HangmanState> Create()
    {
        var hangman = new Hangman("foobar");
        scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('b'));
        scheduler.Schedule(TimeSpan.FromTicks(200), () => hangman.GuessObserver.OnNext('b'));
        return hangman.StateObservable;
    }

    var expected = new[]
    {
        OnNext<HangmanState>(100, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "______"),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "__B__"),
        OnNext<HangmanState>(300, hangmanState => hangmanState.RemainingGuesses == 8 && hangmanState.MaskedWord == "__B__")
    };

    // +--b-b->
    // +a-b-c->
    ITestableObserver<HangmanState> testableObserver = scheduler.Start(Create, 100, 100, 3000);

    ReactiveAssert.AreElementsEqual(expected, testableObserver.Messages);
}

@test:Config {
    enable: false
}
function gettingAllTheLettersRightMakesForAWin() {
    var scheduler = new TestScheduler();
    IObservable<HangmanState> Create()
    {
        var hangman = new Hangman("hello");
        scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('b'));
        scheduler.Schedule(TimeSpan.FromTicks(200), () => hangman.GuessObserver.OnNext('e'));
        scheduler.Schedule(TimeSpan.FromTicks(300), () => hangman.GuessObserver.OnNext('l'));
        scheduler.Schedule(TimeSpan.FromTicks(400), () => hangman.GuessObserver.OnNext('o'));
        scheduler.Schedule(TimeSpan.FromTicks(500), () => hangman.GuessObserver.OnNext('h'));
        return hangman.StateObservable;
    }

    var expected = new[]
    {
        OnNext<HangmanState>(100, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "_____"),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 8 && hangmanState.MaskedWord == "_____"),
        OnNext<HangmanState>(300, hangmanState => hangmanState.RemainingGuesses == 8 && hangmanState.MaskedWord == "E___"),
        OnNext<HangmanState>(400, hangmanState => hangmanState.RemainingGuesses == 8 && hangmanState.MaskedWord == "Ell_"),
        OnNext<HangmanState>(500, hangmanState => hangmanState.RemainingGuesses == 8 && hangmanState.MaskedWord == "Ello"),
        OnCompleted<HangmanState>(600)
    };

    // +--b-e-l-o-h->
    // +a-b-c-d-e-|
    ITestableObserver<HangmanState> testableObserver = scheduler.Start(Create, 100, 100, 3000);

    ReactiveAssert.AreElementsEqual(expected, testableObserver.Messages);
}

// Advanced mode on>
@test:Config {
    enable: false
}
function secondPlayerSeesTheSameGameAlreadyStarted() {
    var scheduler = new TestScheduler();
    var player2 = scheduler.CreateObserver<HangmanState>();
    var hangman = new Hangman("hello");

    var player1 = hangman.StateObservable;
    Ready(player1);

    scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('e'));
    scheduler.Schedule(TimeSpan.FromTicks(200), () => hangman.GuessObserver.OnNext('l'));
    scheduler.Schedule(TimeSpan.FromTicks(150), () => hangman.StateObservable.Subscribe(player2));

    var expected = new[]
    {
        OnNext<HangmanState>(150, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "E___"),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "Ell_")
    };

    // +--e--l->
    // +a-b--c->
    // ...+b-c->
    scheduler.Start();

    ReactiveAssert.AreElementsEqual(expected, player2.Messages);
}

private IDisposable Ready(IObservable<HangmanState> player)
    return player.Subscribe(x => { });
}

// Expert mode on>
@test:Config {
    enable: false
}
function multiplePlayersSeeTheSameGameAlreadyStarted() {
    var scheduler = new TestScheduler();
    var player2 = scheduler.CreateObserver<HangmanState>();
    var player3 = scheduler.CreateObserver<HangmanState>();
    var hangman = new Hangman("hello");

    var player1 = hangman.StateObservable;
    Ready(player1);

    scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('e'));
    scheduler.Schedule(TimeSpan.FromTicks(200), () => hangman.GuessObserver.OnNext('l'));
    scheduler.Schedule(TimeSpan.FromTicks(150), () =>
        {
            hangman.StateObservable.Subscribe(player2);
            hangman.StateObservable.Subscribe(player3);
        });

    var expected = new[]
    {
        OnNext<HangmanState>(150, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "E___"),
        OnNext<HangmanState>(200, hangmanState => hangmanState.RemainingGuesses == 9 && hangmanState.MaskedWord == "Ell_"),
    };

    // +--e--l->
    // +a-b--c->
    // ...+b-c->
    // ...+b-c->
    scheduler.Start();

    ReactiveAssert.AreElementsEqual(expected, player2.Messages);
    ReactiveAssert.AreElementsEqual(expected, player3.Messages);
}

@test:Config {
    enable: false
}
function playerJoinsAfterOtherPlayersQuit() {
    var scheduler = new TestScheduler();
    var player2 = scheduler.CreateObserver<HangmanState>();
    var hangman = new Hangman("a");

    var player1 = hangman.StateObservable;
    var subscription = Ready(player1);

    scheduler.Schedule(TimeSpan.FromTicks(100), () => hangman.GuessObserver.OnNext('a'));
    scheduler.Schedule(TimeSpan.FromTicks(300), () =>
        {
            hangman.StateObservable.Subscribe(player2);
        });
    scheduler.Schedule(TimeSpan.FromTicks(200), () => subscription.Dispose());

    var expected = new[]
    {
        OnCompleted<HangmanState>(300)
    };

    // +--a-|
    // +a-|
    // .....+|
    scheduler.Start();

    ReactiveAssert.AreElementsEqual(expected, player2.Messages);
}
