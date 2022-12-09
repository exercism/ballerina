import ballerina/test;
import ballerina/io;

any[] outputs = [];
int counter = 0;

// This is the mock function which will replace the real function
@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
public function mockPrint(any... s) {
    outputs[counter] = s[0];
    counter +=1;
}

@test:Config
function testFunc() {
    // Invoking the main function
    main();
    test:assertEquals(outputs[0], "Many of life’s failures are people who did not realize how close they were to success when they gave up. - Thomas A. Edison\n");
    string s = <string>outputs[1];
    test:assertTrue(s.contains("Connection refused"), msg = "Output message is not 'Connection Refused' error");
}