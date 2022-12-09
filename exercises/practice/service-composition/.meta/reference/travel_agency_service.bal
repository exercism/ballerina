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

import ballerina/http;

// Client endpoint to communicate with Airline reservation service
final http:Client airlineReservationEP = check new("http://localhost:9091/airline");

// Client endpoint to communicate with Hotel reservation service
final http:Client hotelReservationEP = check new("http://localhost:9092/hotel");

// Client endpoint to communicate with Car rental service
final http:Client carRentalEP = check new("http://localhost:9093/car");

// Travel agency service to arrange a complete tour for a user
service /travel on new http:Listener(9090) {

    // Resource to arrange a tour. This accepts HTTP `POST` requests
    resource function post arrangeTour(@http:Payload TourArrangement tourArrangement) returns http:StatusCodeResponse|error {
        // Reserve airline ticket for the user by calling Airline reservation service.
        // construct the airline reservation record
        Reservation airTicketReservation = {
            name: tourArrangement.name,
            arrivalDate: tourArrangement.arrivalDate,
            departureDate: tourArrangement.departureDate,
            preference: tourArrangement.preference.airline
        };

        // Send a post request to airlineReservationService with appropriate payload and get response
        ServiceResponse airlineResponse = check airlineReservationEP->post("/reserve", airTicketReservation);
        if airlineResponse.status == FAILED {
            return <http:BadRequest>{
                body: {
                    message: "Failed to reserve airline! Provide a valid 'preference' for 'airline' and try again"
                }
            };
        }

        // Reserve hotel room for the user by calling Hotel reservation service
        // construct the hotel reservation record
        Reservation hotelReservation = {
            name: tourArrangement.name,
            arrivalDate: tourArrangement.arrivalDate,
            departureDate: tourArrangement.departureDate,
            preference: tourArrangement.preference.accomodation
        };

        // Send a post request to hotelReservationService with appropriate payload and get response
        ServiceResponse hotelResponse = check hotelReservationEP->post("/reserve", hotelReservation);
        if hotelResponse.status == FAILED {
            return <http:BadRequest>{
                body: {
                    message: "Failed to reserve hotel! Provide a valid 'preference' for 'accommodation' and try again"
                }
            };
        }

        // Renting car for the user by calling Car rental service
        // construct the hotel reservation record
        Reservation carReservation = {
            name: tourArrangement.name,
            arrivalDate: tourArrangement.arrivalDate,
            departureDate: tourArrangement.departureDate,
            preference: tourArrangement.preference.car
        };

        // Send a post request to carRentalService with appropriate payload and get response
        ServiceResponse carResponse = check carRentalEP->post("/rent", carReservation);
        if carResponse.status == FAILED {
            return <http:BadRequest>{
                body: {
                    message: "Failed to rent car! Provide a valid 'preference' for 'car' and try again"
                }
            };
        }

        return <http:Created> {
            body: {
                message: "Congratulations! Your journey is ready!!"
            }
        };
    }
}

# The payload type received from the tour arrangement service.
#
# + name - Name of the tourist
# + arrivalDate - The arrival date of the tourist
# + departureDate - The departure date of the tourist
# + preference - The preferences for the airline, hotel, and the car rental
type TourArrangement record {|
    string name;
    string arrivalDate;
    string departureDate;
    Preference preference;
|};

# The different prefenrences for the tour.
#
# + airline - The preference for airline ticket. Can be `First`, `Bussiness`, `Economy`
# + accomodation - The prefenerece for the hotel reservarion. Can be `delux` or `superior`
# + car - The preference for the car rental. Can be `air conditioned`, or `normal`
type Preference record {|
    string airline;
    string accomodation;
    string car;
|};

// Define a record type to send requests to the reservation services.
type Reservation record {|
    string name;
    string arrivalDate;
    string departureDate;
    string preference;
|};

// The response type received from the reservation services
type ServiceResponse record {|
    Status status;
|};

// Possible statuses of the reservation service responses
enum Status {
    SUCCESS = "Success",
    FAILED = "Failed"
}
