import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: CAR_RENT_DESC}
service "CarRentService" on ep {

    remote function rentCar(RentRequest value) returns Empty|error {
        io:println("Renting a car");
        io:println(value);
        return {};
    }
}

