import ballerina/grpc;
import ballerina/protobuf;

public const string CAR_RENT_DESC = "0A0E6361725F72656E742E70726F746F120B76656869636C6572656E7422520A0B52656E7452657175657374122D0A047479706518012001280E32192E76656869636C6572656E742E56454849434C455F5459504552047479706512140A05636F756E741802200128055205636F756E7422070A05456D7074792A330A0C56454849434C455F5459504512080A0442494B45100012070A03434152100112070A0356414E100212070A03425553100332490A0E43617252656E745365727669636512370A0772656E7443617212182E76656869636C6572656E742E52656E74526571756573741A122E76656869636C6572656E742E456D707479620670726F746F33";

public isolated client class CarRentServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, CAR_RENT_DESC);
    }

    isolated remote function rentCar(RentRequest|ContextRentRequest req) returns Empty|grpc:Error {
        map<string|string[]> headers = {};
        RentRequest message;
        if req is ContextRentRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("vehiclerent.CarRentService/rentCar", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Empty>result;
    }

    isolated remote function rentCarContext(RentRequest|ContextRentRequest req) returns ContextEmpty|grpc:Error {
        map<string|string[]> headers = {};
        RentRequest message;
        if req is ContextRentRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("vehiclerent.CarRentService/rentCar", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Empty>result, headers: respHeaders};
    }
}

public client class CarRentServiceEmptyCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendEmpty(Empty response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextEmpty(ContextEmpty response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextRentRequest record {|
    RentRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: CAR_RENT_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: CAR_RENT_DESC}
public type RentRequest record {|
    VEHICLE_TYPE 'type = BIKE;
    int count = 0;
|};

public enum VEHICLE_TYPE {
    BIKE, CAR, VAN, BUS
}

