type HighPayment record {
    string name;
    string department;
    decimal amount;
    string reason;
};

function getHighPaymentDetails(string dbFilePath, decimal  amount) returns HighPayment[]|error {
    //Add your logic here.
    return [];
}
