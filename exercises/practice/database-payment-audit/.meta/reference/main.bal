import ballerinax/java.jdbc;

type PaymentData record {
    readonly int payment_id;
    decimal amount;
    string name;
};

function getHighPaymentEmployees(string dbFilePath, decimal amount) returns string[]|error {
    string[] names = [];
    jdbc:Client dbClient = check new ("jdbc:h2:file:" + dbFilePath, "root", "root");
    table<PaymentData> key(payment_id) paymentTable = table [];

    stream<PaymentData, error?> employeeStream =
        dbClient->query(`SELECT p.payment_id, p.amount, e.name FROM PAYMENT p  LEFT JOIN EMPLOYEE e on e.employee_id = p.employee_id`);

    check from PaymentData paymentData in employeeStream
        do {
            paymentTable.add(paymentData);
        };
    table<PaymentData> highPayments = from PaymentData payment in paymentTable
        where payment.amount > amount
        order by payment.name
        select payment;

    foreach PaymentData hp in highPayments {
        names.push(hp.name);
    }
    return getUniqueNames(names);
}

function getUniqueNames(string[] names) returns string[] {
    map<()> mapNames = {};
    foreach var s in names {
        mapNames[s] = ();
    }
    return mapNames.keys();
}
