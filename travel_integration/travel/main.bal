import ballerina/http;
import ballerina/io;

service / on new http:Listener(9091) {

    resource function get greeting() returns string|error {
        CarRentServiceClient ep = check new ("http://localhost:9090");
        RentRequest rentCarRequest = {'type: "BIKE", count: 1};
        Empty rentCarResponse = check ep->rentCar(rentCarRequest);
        io:println(rentCarResponse);
        return "Hello, World!";
    }
}
