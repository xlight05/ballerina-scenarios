# Travel Agency Sample
This sample takes the use case of travel agency as an example to demonstrate how ballerina can be used to coordinate microservices to perform real world buisness operations. 

## Microservices involved
- Travel App - This is the main microservice which is exposed to the end user. This microservice is responsible for coordinating the other microservices to perform the business operation.
- Hotel Booking Service - This microservice is responsible for booking the hotel for the given location.
- Flight Reservation Service - This microservice is responsible for booking the flight for the given location.
- Car Rental Service - This microservice is responsible for booking the car for the given location.
