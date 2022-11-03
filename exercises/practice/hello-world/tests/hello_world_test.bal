import ballerina/test;

// This is the mock function which will replace the real function
string[] outputs = [];

// This is the mock function which will replace the real function
@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction mock_printLn = new ();

public function mockPrint(any... val) {
    outputs.push(val.reduce(function(any a, any b) returns string => a.toString() + b.toString(), "").toString());
}

@test:Config
function testFunc() {
    test:when(mock_printLn).call("mockPrint");
    // Invoking the main function
    main();
    test:assertEquals(outputs[0], "Hello, World!");
}