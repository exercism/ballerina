import ballerinax/java.jdbc;

type HighPayment record {
    string name;
    string department;
    decimal amount;
    string reason;
};

function getHighPaymentDetails(string dbFilePath, decimal  amount) returns HighPayment[]|error {
    HighPayment[] data = [];
    jdbc:Client dbClient = check new ("jdbc:h2:file:" + dbFilePath, "root", "root");

    stream<HighPayment, error?> employeeStream =
        dbClient->query(`SELECT e.name, e.department, p.amount, p.reason FROM PAYMENT p  LEFT JOIN EMPLOYEE e on e.employee_id = p.employee_id  where p.amount > ${amount} order by p.payment_id`);

    check from HighPayment employeeData in employeeStream
        do {
            data.push(employeeData);
        };
    return data;
}
