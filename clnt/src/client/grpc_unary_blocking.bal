import ballerina/grpc;
import ballerina/io;

public function main() {
    HelloWorldBlockingClient[] ad = [];
    foreach int i in 1...20 {
        ad.push(new HelloWorldBlockingClient("http://localhost:9099"));
    }

    int n = 1;
    int requestCount = 300;

    worker w0 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[0];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w1 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[1];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w2 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[2];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

        @strand {
        thread:"any"
    }
    worker w3 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[3];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w4 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[4];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w5 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[5];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w6 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[6];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

        @strand {
        thread:"any"
    }
    worker w7 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[7];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w8 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[8];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w9 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[9];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w10 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[10];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w11 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[11];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w12 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[12];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w13 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[13];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w14 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[14];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w15 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[15];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w16 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[16];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

        @strand {
        thread:"any"
    }
    worker w17 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[17];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w18 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[18];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }

    @strand {
        thread:"any"
    }
    worker w19 {
        HelloWorldBlockingClient helloWorldBlockingEp = ad[19];
        foreach var i in 1 ... requestCount {
            sendRequest(n, helloWorldBlockingEp);
        }
    }
}

function sendRequest(int n, HelloWorldBlockingClient helloWorldBlockingEp) {
    foreach var i in 1 ... n {
        grpc:Headers headers = new;
        headers.setEntry("client_header_key1", "Request Header Value1");

        var unionResp = helloWorldBlockingEp->hello("Joe", headers);
        if (unionResp is grpc:Error) {
            io:println("Error from Connector: " + unionResp.message());
        } else {
            string result;
            grpc:Headers resHeaders;
            [result, resHeaders] = unionResp;
            io:println("Client Got Response : " + result);
        }
    }
}
