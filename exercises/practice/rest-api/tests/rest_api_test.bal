import ballerina/test;

@test:Config {
    enable: false
}
function noUsers() {
    var url = "/users";
    var database = "[]";
    var sut = new RestApi(database);
    var actual = sut.Get(url);
    var expected = "[]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function addUser() {
    var url = "/add";
    var payload = "{\"user\":\"Adam\"}";
    var database = "[]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0}";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function getSingleUser() {
    var url = "/users";
    var payload = "{\"users\":[\"Bob\"]}";
    var database = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{},\"balance\":0}]";
    var sut = new RestApi(database);
    var actual = sut.Get(url, payload);
    var expected = "[{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{},\"balance\":0}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function bothUsersHave_0Balance() {
    var url = "/iou";
    var payload = "{\"lender\":\"Adam\",\"borrower\":\"Bob\",\"amount\":3}";
    var database = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{},\"balance\":0}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{\"Bob\":3},\"balance\":3},{\"name\":\"Bob\",\"owes\":{\"Adam\":3},\"owedBy\":{},\"balance\":-3}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function borrowerHasNegativeBalance() {
    var url = "/iou";
    var payload = "{\"lender\":\"Adam\",\"borrower\":\"Bob\",\"amount\":3}";
    var database = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0},{\"name\":\"Bob\",\"owes\":{\"Chuck\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Chuck\",\"owes\":{},\"owedBy\":{\"Bob\":3},\"balance\":3}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{\"Bob\":3},\"balance\":3},{\"name\":\"Bob\",\"owes\":{\"Adam\":3,\"Chuck\":3},\"owedBy\":{},\"balance\":-6}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function lenderHasNegativeBalance() {
    var url = "/iou";
    var payload = "{\"lender\":\"Bob\",\"borrower\":\"Adam\",\"amount\":3}";
    var database = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0},{\"name\":\"Bob\",\"owes\":{\"Chuck\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Chuck\",\"owes\":{},\"owedBy\":{\"Bob\":3},\"balance\":3}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{\"Bob\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Bob\",\"owes\":{\"Chuck\":3},\"owedBy\":{\"Adam\":3},\"balance\":0}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function lenderOwesBorrower() {
    var url = "/iou";
    var payload = "{\"lender\":\"Adam\",\"borrower\":\"Bob\",\"amount\":2}";
    var database = "[{\"name\":\"Adam\",\"owes\":{\"Bob\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{\"Adam\":3},\"balance\":3}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{\"Bob\":1},\"owedBy\":{},\"balance\":-1},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{\"Adam\":1},\"balance\":1}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function lenderOwesBorrowerLessThanNewLoan() {
    var url = "/iou";
    var payload = "{\"lender\":\"Adam\",\"borrower\":\"Bob\",\"amount\":4}";
    var database = "[{\"name\":\"Adam\",\"owes\":{\"Bob\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{\"Adam\":3},\"balance\":3}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{\"Bob\":1},\"balance\":1},{\"name\":\"Bob\",\"owes\":{\"Adam\":1},\"owedBy\":{},\"balance\":-1}]";
    test:assertEquals(expected, actual);
}

@test:Config {
    enable: false
}
function lenderOwesBorrowerSameAsNewLoan() {
    var url = "/iou";
    var payload = "{\"lender\":\"Adam\",\"borrower\":\"Bob\",\"amount\":3}";
    var database = "[{\"name\":\"Adam\",\"owes\":{\"Bob\":3},\"owedBy\":{},\"balance\":-3},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{\"Adam\":3},\"balance\":3}]";
    var sut = new RestApi(database);
    var actual = sut.Post(url, payload);
    var expected = "[{\"name\":\"Adam\",\"owes\":{},\"owedBy\":{},\"balance\":0},{\"name\":\"Bob\",\"owes\":{},\"owedBy\":{},\"balance\":0}]";
    test:assertEquals(expected, actual);
}
