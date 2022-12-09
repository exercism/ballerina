function data() returns map<[string, decimal, HighPayment[]]>|error {
    map<[string, decimal, HighPayment[]]> dataSet = {
        "Test1": ["./db/gofigure", 3000, [{"name": "Anita Bath", "department": "Marketing", "amount": 3400, "reason": "Stationary"}, {"name": "Amanda Hug", "department": "Engineering", "amount": 4400, "reason": "Travel expenses"}]],
        "Test2": ["./db/gofigure", 1100, [{"name": "Anita Bath", "department": "Marketing", "amount": 3400, "reason": "Stationary"}, {"name": "Amanda Hug", "department": "Engineering", "amount": 4400, "reason": "Travel expenses"}, {"name": "Perry Scope", "department": "Engineering", "amount": 1200, "reason": "Fuel"}]],
        "Test3": ["./db/gofigure", 100, [{"name": "John Quil", "department": "Sales", "amount": 200.00, "reason": "Fuel"}, {"name": "Perry Scope", "department": "Engineering", "amount": 1000.50, "reason": "Medical expenses"}, {"name": "Greg Arias", "department": "Finance", "amount": 560.00, "reason": "Fuel"}, {"name": "Anita Bath", "department": "Marketing", "amount": 3400.00, "reason": "Stationary"}, {"name": "Amanda Hug", "department": "Engineering", "amount": 4400.00, "reason": "Travel expenses"}, {"name": "John Quil", "department": "Sales", "amount": 587.00, "reason": "Medical expenses"}, {"name": "Perry Scope", "department": "Engineering", "amount": 1200.00, "reason": "Fuel"}]]
    };
    return dataSet;
}

