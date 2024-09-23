import ballerina/grpc;
import ballerina/protobuf;

public const string GRPC_DESC = "";
public isolated client class OnlineShoppingServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, GRPC_DESC);
    }

    isolated remote function listAvailableProducts(Empty|ContextEmpty req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/listAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function listAvailableProductsContext(Empty|ContextEmpty req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/listAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function searchProduct(ProductId|ContextProductId req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/searchProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function searchProductContext(ProductId|ContextProductId req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/searchProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function addToCart(CartRequest|ContextCartRequest req) returns CartResponse|grpc:Error {
        map<string|string[]> headers = {};
        CartRequest message;
        if req is ContextCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/addToCart", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CartResponse>result;
    }

    isolated remote function addToCartContext(CartRequest|ContextCartRequest req) returns ContextCartResponse|grpc:Error {
        map<string|string[]> headers = {};
        CartRequest message;
        if req is ContextCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/addToCart", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CartResponse>result, headers: respHeaders};
    }

    isolated remote function placeOrder(OrderRequest|ContextOrderRequest req) returns OrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        OrderRequest message;
        if req is ContextOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/placeOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <OrderResponse>result;
    }

    isolated remote function placeOrderContext(OrderRequest|ContextOrderRequest req) returns ContextOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        OrderRequest message;
        if req is ContextOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/placeOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <OrderResponse>result, headers: respHeaders};
    }

    isolated remote function addProduct(Product|ContextProduct req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/addProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function addProductContext(Product|ContextProduct req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/addProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function updateProduct(ProductUpdate|ContextProductUpdate req) returns ProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductUpdate message;
        if req is ContextProductUpdate {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/updateProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductResponse>result;
    }

    isolated remote function updateProductContext(ProductUpdate|ContextProductUpdate req) returns ContextProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        ProductUpdate message;
        if req is ContextProductUpdate {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/updateProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductResponse>result, headers: respHeaders};
    }

    isolated remote function removeProduct(ProductId|ContextProductId req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/removeProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function removeProductContext(ProductId|ContextProductId req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductId message;
        if req is ContextProductId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc.OnlineShoppingService/removeProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function createUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("grpc.OnlineShoppingService/createUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public isolated client class CreateUsersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUserResponse() returns UserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <UserResponse>payload;
        }
    }

    isolated remote function receiveContextUserResponse() returns ContextUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <UserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class OnlineShoppingServiceProductListCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendProductList(ProductList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextProductList(ContextProductList response) returns grpc:Error? {
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

public isolated client class OnlineShoppingServiceProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendProductResponse(ProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextProductResponse(ContextProductResponse response) returns grpc:Error? {
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

public isolated client class OnlineShoppingServiceCartResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCartResponse(CartResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCartResponse(ContextCartResponse response) returns grpc:Error? {
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

public isolated client class OnlineShoppingServiceUserResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUserResponse(UserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUserResponse(ContextUserResponse response) returns grpc:Error? {
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

public isolated client class OnlineShoppingServiceOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendOrderResponse(OrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextOrderResponse(ContextOrderResponse response) returns grpc:Error? {
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

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextProductList record {|
    ProductList content;
    map<string|string[]> headers;
|};

public type ContextUserResponse record {|
    UserResponse content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextProductUpdate record {|
    ProductUpdate content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextOrderRequest record {|
    OrderRequest content;
    map<string|string[]> headers;
|};

public type ContextCartRequest record {|
    CartRequest content;
    map<string|string[]> headers;
|};

public type ContextProductResponse record {|
    ProductResponse content;
    map<string|string[]> headers;
|};

public type ContextProduct record {|
    Product content;
    map<string|string[]> headers;
|};

public type ContextProductId record {|
    ProductId content;
    map<string|string[]> headers;
|};

public type ContextOrderResponse record {|
    OrderResponse content;
    map<string|string[]> headers;
|};

public type ContextCartResponse record {|
    CartResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type ProductList record {|
    Product[] products = [];
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type UserResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type ProductUpdate record {|
    string sku = "";
    Product product = {};
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type User record {|
    string user_id = "";
    string name = "";
    string role = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type OrderRequest record {|
    string user_id = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type CartRequest record {|
    string user_id = "";
    string sku = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type Product record {|
    string name = "";
    string description = "";
    float price = 0.0;
    int stock_quantity = 0;
    string sku = "";
    string status = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type ProductResponse record {|
    string message = "";
    Product product = {};
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type ProductId record {|
    string sku = "";
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type OrderResponse record {|
    string message = "";
    Product[] products = [];
|};

@protobuf:Descriptor {value: GRPC_DESC}
public type CartResponse record {|
    string message = "";
|};

