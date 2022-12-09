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

// Hotel reservation service to reserve hotel rooms
service /hotel on new http:Listener(9092) {

    // Resource to reserve a room
    resource function post reserve(@http:Payload HotelReservation reservation) returns Response {
        string preference = reservation.preference;
        // Mock logic
        if preference !is RoomType {
            return {
                status: FAILED
            };
        }
        return {
            status: SUCCESS
        };
    }
}


type HotelReservation record {|
    string name;
    string arrivalDate;
    string departureDate;
    string preference;
|};

enum RoomType {
    SUPERIOR = "superior",
    DELUX = "delux"
}
