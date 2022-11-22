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
import ballerina/log;
//import ballerinax/docker;
//import ballerinax/kubernetes;

//@docker:Config {
//    registry:"ballerina.guides.io",
//    name:"travel_agency_service",
//    tag:"v1.0"
//}
//
//@docker:Expose{}

//@kubernetes:Ingress {
//  hostname:"ballerina.guides.io",
//  name:"ballerina-guides-travel-agency-service",
//  path:"/"
//}
//
//@kubernetes:Service {
//  serviceType:"NodePort",
//  name:"ballerina-guides-travel-agency-service"
//}
//
//@kubernetes:Deployment {
//  image:"ballerina.guides.io/travel_agency_service:v1.0",
//  name:"ballerina-guides-travel-agency-service"
//}

// Service endpoint
listener http:Listener travelAgencyEP = new(9090);

// Client endpoint to communicate with Airline reservation service
http:Client airlineReservationEP = new("http://localhost:9091/airline");

// Client endpoint to communicate with Hotel reservation service
http:Client hotelReservationEP = new("http://localhost:9092/hotel");

// Client endpoint to communicate with Car rental service
http:Client carRentalEP = new("http://localhost:9093/car");

// Travel agency service to arrange a complete tour for a user
@http:ServiceConfig { basePath:"/travel" }
service travelAgencyService on travelAgencyEP {

    // Resource to arrange a tour
    @http:ResourceConfig {methods:["POST"], consumes:["application/json"], produces:["application/json"]}
    resource function arrangeTour(http:Caller caller, http:Request inRequest) returns error? {
        http:Response outResponse = new;
        json inReqPayload;
        // Json payload format for an http out request
        json outReqPayload = {"Name":"", "ArrivalDate":"", "DepartureDate":"", "Preference":""};

        // Try parsing the JSON payload from the user request
        var payload = inRequest.getJsonPayload();
        if (payload is json) {
            // Valid JSON payload
            inReqPayload = payload;
        } else {
            // NOT a valid JSON payload
            outResponse.statusCode = 400;
            outResponse.setJsonPayload({"Message":"Invalid payload - Not a valid JSON payload"});
            var responseResult = caller->respond(outResponse);
            if (responseResult is error) {
                log:printError("error responding back to client.", err = responseResult);
            }
            return;
        }

        json? name = inReqPayload["Name"];
        json? arrivalDate = inReqPayload["ArrivalDate"];
        json? departureDate = inReqPayload["DepartureDate"];
        json? preference = inReqPayload["Preference"];
        json? airlinePreference;
        json? hotelPreference;
        json? carPreference;

        airlinePreference = preference["Airline"];
        hotelPreference =  preference["Accommodation"];
        carPreference = preference["Car"];

        // If payload parsing fails, send a "Bad Request" message as the response
        if (name is () || arrivalDate is () || departureDate is () ||
            airlinePreference is () || hotelPreference is () || carPreference is ()) {
            outResponse.statusCode = 400;
            outResponse.setJsonPayload({"Message":"Bad Request - Invalid Payload"});
            var responseResult = caller->respond(outResponse);
            if (responseResult is error) {
                log:printError("error responding back to client.", err = responseResult);
            }
            return;
        }
        outReqPayload.Name = name;
        outReqPayload.ArrivalDate = arrivalDate;
        outReqPayload.DepartureDate = departureDate;


        // Reserve airline ticket for the user by calling Airline reservation service
        // construct the payload
        json outReqPayloadAirline = outReqPayload;
        outReqPayloadAirline.Preference = airlinePreference;

        // Send a post request to airlineReservationService with appropriate payload and get response
        http:Response inResAirline = check airlineReservationEP->post("/reserve", untaint outReqPayloadAirline);

        // Get the reservation status
        var airlineResPayload = check inResAirline.getJsonPayload();
        string airlineStatus = airlineResPayload.Status.toString();
        // If reservation status is negative, send a failure response to user
        if (airlineStatus.equalsIgnoreCase("Failed")) {
            outResponse.setJsonPayload({"Message":"Failed to reserve airline! " +
                    "Provide a valid 'Preference' for 'Airline' and try again"});
            var responseResult = caller->respond(outResponse);
            if (responseResult is error) {
                log:printError("error responding back to client.", err = responseResult);
            }
            return;
        }


        // Reserve hotel room for the user by calling Hotel reservation service
        // construct the payload
        json outReqPayloadHotel = outReqPayload;
        outReqPayloadHotel.Preference = hotelPreference;

        // Send a post request to hotelReservationService with appropriate payload and get response
        http:Response inResHotel = check hotelReservationEP->post("/reserve", untaint outReqPayloadHotel);

        // Get the reservation status
        var hotelResPayload = check inResHotel.getJsonPayload();
        string hotelStatus = hotelResPayload.Status.toString();
        // If reservation status is negative, send a failure response to user
        if (hotelStatus.equalsIgnoreCase("Failed")) {
            outResponse.setJsonPayload({"Message":"Failed to reserve hotel! " +
                    "Provide a valid 'Preference' for 'Accommodation' and try again"});
            var responseResult = caller->respond(outResponse);
            if (responseResult is error) {
                log:printError("error responding back to client.", err = responseResult);
            }
            return;
        }


        // Renting car for the user by calling Car rental service
        // construct the payload
        json outReqPayloadCar = outReqPayload;
        outReqPayloadCar.Preference = carPreference;

        // Send a post request to carRentalService with appropriate payload and get response
        http:Response inResCar = check carRentalEP->post("/rent", untaint outReqPayloadCar);

        // Get the rental status
        json carResPayload = check inResCar.getJsonPayload();
        string carRentalStatus = carResPayload.Status.toString();
        // If rental status is negative, send a failure response to user
        if (carRentalStatus.equalsIgnoreCase("Failed")) {
            outResponse.setJsonPayload({"Message":"Failed to rent car! " +
                    "Provide a valid 'Preference' for 'Car' and try again"});
            var responseResult = caller->respond(outResponse);
            if (responseResult is error) {
                log:printError("error responding back to client.", err = responseResult);
            }
            return;
        }


        // If all three services response positive status, send a successful message to the user
        outResponse.setJsonPayload({"Message":"Congratulations! Your journey is ready!!"});
        var responseResult = caller->respond(outResponse);
        if (responseResult is error) {
            log:printError("error responding back to client.", err = responseResult);
        }
    }
}
