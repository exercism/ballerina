import ballerina/test;

@test:Config {
    enable: false
}
function returnsEmptyBalanceAfterOpening() {
    var account = new BankAccount();
    account.Open();

    test:assertEquals(0m, account.Balance);
}

@test:Config {
    enable: false
}
function checkBasicBalance() {
    var account = new BankAccount();
    account.Open();

    var openingBalance = account.Balance;

    account.UpdateBalance(10m);
    var updatedBalance = account.Balance;

    test:assertEquals(0m, openingBalance);
    test:assertEquals(10m, updatedBalance);
}

@test:Config {
    enable: false
}
function balanceCanIncrementAndDecrement() {
    var account = new BankAccount();
    account.Open();
    var openingBalance = account.Balance;

    account.UpdateBalance(10m);
    var addedBalance = account.Balance;

    account.UpdateBalance(-15m);
    var subtractedBalance = account.Balance;

    test:assertEquals(0m, openingBalance);
    test:assertEquals(10m, addedBalance);
    test:assertEquals(-5m, subtractedBalance);
}

@test:Config {
    enable: false
}
function closedAccountThrowsExceptionWhenCheckingBalance() {
    var account = new BankAccount();
    account.Open();
    account.Close();

    Assert.Throws<InvalidOperationException>(() => account.Balance);
}

@test:Config {
    enable: false
}
function changeAccountBalanceFromMultipleThreads() {
    var account = new BankAccount();
    var tasks = new List<Task>();

    var threads = 500;
    var iterations = 100;

    account.Open();
    for (int i = 0; i < threads; i++)
    {
        tasks.Add(Task.Factory.StartNew(() =>
        {
            for (int j = 0; j < iterations; j++)
            {
                account.UpdateBalance(1m);
                account.UpdateBalance(-1m);
            }
        }));
    }
    Task.WaitAll(tasks.ToArray());

    test:assertEquals(0m, account.Balance);
}
