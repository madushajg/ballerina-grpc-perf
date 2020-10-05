import ballerina/grpc;
import ballerina/log;

service HelloWorld on new grpc:Listener(9099) {
    resource function hello(grpc:Caller caller, string name,
                             grpc:Headers headers) {
        log:printInfo("Server received hello from " + name);
        string message = "Hello " + name;
        string reqHeader = headers.get("client_header_key") ?: "none";
        log:printInfo("Server received header value: " + reqHeader);

        grpc:Headers resHeader = new;
        resHeader.setEntry("server_header_key", "Response Header value");

        grpc:Error? err = caller->send(message, resHeader);
        if (err is grpc:Error) {
            log:printError("Error from Connector: " + err.message());
        }

        grpc:Error? result = caller->complete();
        if (result is grpc:Error) {
            log:printError("Error in sending completed notification to caller",
                err = result);
        }
    }
}