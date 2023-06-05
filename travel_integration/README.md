# Travel Agency Sample
This sample takes the use case of travel agency as an example to demonstrate how ballerina can be used to coordinate microservices to perform real world buisness operations. 

## Microservices involved
- Travel App - This is the main microservice which is exposed to the end user. This microservice is responsible for coordinating the other microservices to perform the business operation.
- Hotel Booking Service - This microservice is responsible for booking the hotel for the given location.
- Flight Reservation Service - This microservice is responsible for booking the flight for the given location.
- Car Rental Service - This microservice is responsible for booking the car for the given location.


## Generating Protocol Buffers
```bash
bal grpc --mode service --input car_rent.proto --output car_rental/
bal grpc --mode service --input flight_book.proto --output flight_res/
bal grpc --mode service --input hotel_book.proto --output hotel_bookings/

bal grpc --mode client --input car_rent.proto --output travel/
bal grpc --mode client --input flight_book.proto --output travel/
bal grpc --mode client --input hotel_book.proto --output travel/
```

## Running the sample

```bash
bal run car_rental
bal run flight_res/
bal run hotel_bookings/

bal run travel/
```