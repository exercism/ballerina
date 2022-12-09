// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/http;

// Client endpoint
http:Client clientEP = check new("http://localhost:9090/travel");

// Function to test Travel agency service
@test:Config
function testTravelAgencyService() returns error? {
    TourArrangement arrangement = {
        name: "Alice",
        arrivalDate: "12-03-2022",
        departureDate: "30-03-2022",
        preference: {
            airline: "First",
            accomodation: "delux",
            car: "Air Conditioned"
        }
    };

    // Send a 'post' request and obtain the response
    record {|string message;|} response = check clientEP->post("/arrangeTour", arrangement);
    // // Expected response code is 200
    // test:assertEquals(response.statusCode, 201, msg = "Travel agency service did not respond with 201 Created response!");
    // // Check whether the response is as expected
    // record {|string message;|} payload = check response.getJsonPayload().ensureType();
    string expectedMessage = "Congratulations! Your journey is ready!!";
    test:assertEquals(response.message, expectedMessage, msg = "Response mismatch!");
}

@test:Config
function testInvalidAirlineRequest() returns error? {
    TourArrangement arrangement = {
        name: "Alice",
        arrivalDate: "12-03-2022",
        departureDate: "30-03-2022",
        preference: {
            airline: "Second",
            accomodation: "delux",
            car: "Air Conditioned"
        }
    };
    http:Response response = check clientEP->post("/arrangeTour", arrangement);
    // Expected response code is 400 Bad Request
    test:assertEquals(response.statusCode, 400, msg = "Travel agency service did not respond with 400 Bad Request response!");
    // Check whether the response is as expected
    record {|string message;|} responseBody = check (check response.getJsonPayload()).cloneWithType();
    string expectedStatus = "Failed to reserve airline! Provide a valid 'preference' for 'airline' and try again";
    test:assertEquals(responseBody.message, expectedStatus, msg = "Response mismatch!");
}

@test:Config
function testInvalidHotelReservationRequest() returns error? {
    TourArrangement arrangement = {
        name: "Alice",
        arrivalDate: "12-03-2022",
        departureDate: "30-03-2022",
        preference: {
            airline: "First",
            accomodation: "Suite",
            car: "Air Conditioned"
        }
    };
    http:Response response = check clientEP->post("/arrangeTour", arrangement);
    // Expected response code is 400 Bad Request
    test:assertEquals(response.statusCode, 400, msg = "Travel agency service did not respond with 400 Bad Request response!");
    // Check whether the response is as expected
    record {|string message;|} responseBody = check (check response.getJsonPayload()).cloneWithType();
    string expectedStatus = "Failed to reserve hotel! Provide a valid 'preference' for 'accommodation' and try again";
    test:assertEquals(responseBody.message, expectedStatus, msg = "Response mismatch!");
}

@test:Config
function testInvalidCarRentalRequest() returns error? {
    TourArrangement arrangement = {
        name: "Alice",
        arrivalDate: "12-03-2022",
        departureDate: "30-03-2022",
        preference: {
            airline: "First",
            accomodation: "delux",
            car: "full a/c"
        }
    };
    http:Response response = check clientEP->post("/arrangeTour", arrangement);
    // Expected response code is 400 Bad Request
    test:assertEquals(response.statusCode, 400, msg = "Travel agency service did not respond with 400 Bad Request response!");
    // Check whether the response is as expected
    record {|string message;|} responseBody = check (check response.getJsonPayload()).cloneWithType();
    string expectedStatus = "Failed to rent car! Provide a valid 'preference' for 'car' and try again";
    test:assertEquals(responseBody.message, expectedStatus, msg = "Response mismatch!");
}

type Response record {|
    Status status;
|};

enum  Status {
    SUCCESS = "Success",
    FAILED = "Failed"
}
