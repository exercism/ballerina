import ballerina/http;

// Client endpoint to communicate with Airline reservation service
http:Client airlineReservationEP = new("http://localhost:9091/airline");

// Client endpoint to communicate with Hotel reservation service
http:Client hotelReservationEP = new("http://localhost:9092/hotel");

// Client endpoint to communicate with Car rental service
http:Client carRentalEP = new("http://localhost:9093/car");

// Travel agency service to arrange a complete tour for a user
@http:ServiceConfig {basePath:"/travel"}
service travelAgencyService on new http:Listener(9090) {

    // Resource to arrange a tour
    @http:ResourceConfig {methods:["POST"], consumes:["application/json"], produces:["application/json"]}
    resource function arrangeTour(http:Caller caller, http:Request inRequest) {

        // Extract Travel infomation from the travel reservation request

        // Validate all the incoming data and if any invalid data found, then send HTTP 400 or 500 error code back to the client.


        // Create the payload skeleton to be sent to the Airline service
        // Enrich the required fields with the information retrieved from the original travel reservation request.
        // Airline Reservation request shold be in this format : {"Name":"", "ArrivalDate":"", "DepartureDate":"", "Preference":""}
        // Invoke 'airlineReservationEP->post("/reserve", ...);


        // Follow the same steps for 'Hotel' and 'Car Rental' services.
        // Both hotel and car rental service requests are in the format of : {"Name":"", "ArrivalDate":"", "DepartureDate":"", "Preference":""}


        // If all three services response positive status, send a successful message to the user
        // with the payload {"Message":"Congratulations! Your journey is ready!!"}
    }
}
