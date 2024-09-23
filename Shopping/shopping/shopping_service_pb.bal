import ballerina/grpc;
import ballerina/protobuf;

public const string SHOPPING_SERVICE_DESC = "0A1673686F7070696E675F736572766963652E70726F746F120873686F7070696E6722B0010A1141646450726F647563745265717565737412120A046E616D6518012001280952046E616D6512200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12140A0570726963651803200128025205707269636512250A0E73746F636B5F7175616E74697479180420012805520D73746F636B5175616E7469747912100A03736B751805200128095203736B7512160A06737461747573180620012809520673746174757322370A1241646450726F64756374526573706F6E736512210A0C70726F647563745F636F6465180120012809520B70726F64756374436F646522490A11437265617465557365725265717565737412170A07757365725F69641801200128095206757365724964121B0A09757365725F7479706518022001280952087573657254797065222E0A1243726561746555736572526573706F6E736512180A076D65737361676518012001280952076D65737361676522AC010A1455706461746550726F647563745265717565737412210A0C70726F647563745F636F6465180120012809520B70726F64756374436F646512120A046E616D6518022001280952046E616D6512200A0B6465736372697074696F6E180320012809520B6465736372697074696F6E12140A0570726963651804200128025205707269636512250A0E73746F636B5F7175616E74697479180520012805520D73746F636B5175616E7469747922310A1555706461746550726F64756374526573706F6E736512180A077375636365737318012001280852077375636365737322390A1452656D6F766550726F647563745265717565737412210A0C70726F647563745F636F6465180120012809520B70726F64756374436F646522460A1552656D6F766550726F64756374526573706F6E7365122D0A0870726F647563747318012003280B32112E73686F7070696E672E50726F64756374520870726F647563747322450A144C69737450726F6475637473526573706F6E7365122D0A0870726F647563747318012003280B32112E73686F7070696E672E50726F64756374520870726F647563747322280A1453656172636850726F647563745265717565737412100A03736B751801200128095203736B7522440A1553656172636850726F64756374526573706F6E7365122B0A0770726F6475637418012001280B32112E73686F7070696E672E50726F64756374520770726F64756374223D0A10416464546F436172745265717565737412170A07757365725F6964180120012809520675736572496412100A03736B751802200128095203736B75222D0A11416464546F43617274526573706F6E736512180A076D65737361676518012001280952076D657373616765222C0A11506C6163654F726465725265717565737412170A07757365725F69641801200128095206757365724964222F0A12506C6163654F72646572526573706F6E736512190A086F726465725F696418012001280952076F72646572496422A6010A0750726F6475637412120A046E616D6518012001280952046E616D6512200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12140A0570726963651803200128025205707269636512250A0E73746F636B5F7175616E74697479180420012805520D73746F636B5175616E7469747912100A03736B751805200128095203736B7512160A06737461747573180620012809520673746174757322070A05456D70747932F5040A0F53686F7070696E675365727669636512470A0A41646450726F64756374121B2E73686F7070696E672E41646450726F64756374526571756573741A1C2E73686F7070696E672E41646450726F64756374526573706F6E7365124A0A0B4372656174655573657273121B2E73686F7070696E672E43726561746555736572526571756573741A1C2E73686F7070696E672E43726561746555736572526573706F6E7365280112500A0D55706461746550726F64756374121E2E73686F7070696E672E55706461746550726F64756374526571756573741A1F2E73686F7070696E672E55706461746550726F64756374526573706F6E736512500A0D52656D6F766550726F64756374121E2E73686F7070696E672E52656D6F766550726F64756374526571756573741A1F2E73686F7070696E672E52656D6F766550726F64756374526573706F6E736512480A154C697374417661696C61626C6550726F6475637473120F2E73686F7070696E672E456D7074791A1E2E73686F7070696E672E4C69737450726F6475637473526573706F6E736512500A0D53656172636850726F64756374121E2E73686F7070696E672E53656172636850726F64756374526571756573741A1F2E73686F7070696E672E53656172636850726F64756374526573706F6E736512440A09416464546F43617274121A2E73686F7070696E672E416464546F43617274526571756573741A1B2E73686F7070696E672E416464546F43617274526573706F6E736512470A0A506C6163654F72646572121B2E73686F7070696E672E506C6163654F72646572526571756573741A1C2E73686F7070696E672E506C6163654F72646572526573706F6E7365620670726F746F33";

public isolated client class ShoppingServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, SHOPPING_SERVICE_DESC);
    }

    isolated remote function AddProduct(AddProductRequest|ContextAddProductRequest req) returns AddProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddProductRequest message;
        if req is ContextAddProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddProductResponse>result;
    }

    isolated remote function AddProductContext(AddProductRequest|ContextAddProductRequest req) returns ContextAddProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddProductRequest message;
        if req is ContextAddProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddProductResponse>result, headers: respHeaders};
    }

    isolated remote function UpdateProduct(UpdateProductRequest|ContextUpdateProductRequest req) returns UpdateProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateProductRequest message;
        if req is ContextUpdateProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <UpdateProductResponse>result;
    }

    isolated remote function UpdateProductContext(UpdateProductRequest|ContextUpdateProductRequest req) returns ContextUpdateProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateProductRequest message;
        if req is ContextUpdateProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <UpdateProductResponse>result, headers: respHeaders};
    }

    isolated remote function RemoveProduct(RemoveProductRequest|ContextRemoveProductRequest req) returns RemoveProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveProductRequest message;
        if req is ContextRemoveProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <RemoveProductResponse>result;
    }

    isolated remote function RemoveProductContext(RemoveProductRequest|ContextRemoveProductRequest req) returns ContextRemoveProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveProductRequest message;
        if req is ContextRemoveProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <RemoveProductResponse>result, headers: respHeaders};
    }

    isolated remote function ListAvailableProducts(Empty|ContextEmpty req) returns ListProductsResponse|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ListProductsResponse>result;
    }

    isolated remote function ListAvailableProductsContext(Empty|ContextEmpty req) returns ContextListProductsResponse|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ListProductsResponse>result, headers: respHeaders};
    }

    isolated remote function SearchProduct(SearchProductRequest|ContextSearchProductRequest req) returns SearchProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        SearchProductRequest message;
        if req is ContextSearchProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <SearchProductResponse>result;
    }

    isolated remote function SearchProductContext(SearchProductRequest|ContextSearchProductRequest req) returns ContextSearchProductResponse|grpc:Error {
        map<string|string[]> headers = {};
        SearchProductRequest message;
        if req is ContextSearchProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <SearchProductResponse>result, headers: respHeaders};
    }

    isolated remote function AddToCart(AddToCartRequest|ContextAddToCartRequest req) returns AddToCartResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddToCartRequest message;
        if req is ContextAddToCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddToCartResponse>result;
    }

    isolated remote function AddToCartContext(AddToCartRequest|ContextAddToCartRequest req) returns ContextAddToCartResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddToCartRequest message;
        if req is ContextAddToCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddToCartResponse>result, headers: respHeaders};
    }

    isolated remote function PlaceOrder(PlaceOrderRequest|ContextPlaceOrderRequest req) returns PlaceOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        PlaceOrderRequest message;
        if req is ContextPlaceOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <PlaceOrderResponse>result;
    }

    isolated remote function PlaceOrderContext(PlaceOrderRequest|ContextPlaceOrderRequest req) returns ContextPlaceOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        PlaceOrderRequest message;
        if req is ContextPlaceOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <PlaceOrderResponse>result, headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("shopping.ShoppingService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public isolated client class CreateUsersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendCreateUserRequest(CreateUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextCreateUserRequest(ContextCreateUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveCreateUserResponse() returns CreateUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <CreateUserResponse>payload;
        }
    }

    isolated remote function receiveContextCreateUserResponse() returns ContextCreateUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <CreateUserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class ShoppingServiceRemoveProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendRemoveProductResponse(RemoveProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextRemoveProductResponse(ContextRemoveProductResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceListProductsResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendListProductsResponse(ListProductsResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextListProductsResponse(ContextListProductsResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceAddToCartResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAddToCartResponse(AddToCartResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAddToCartResponse(ContextAddToCartResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServicePlaceOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendPlaceOrderResponse(PlaceOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextPlaceOrderResponse(ContextPlaceOrderResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceSearchProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendSearchProductResponse(SearchProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextSearchProductResponse(ContextSearchProductResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceCreateUserResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateUserResponse(CreateUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateUserResponse(ContextCreateUserResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceUpdateProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUpdateProductResponse(UpdateProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUpdateProductResponse(ContextUpdateProductResponse response) returns grpc:Error? {
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

public isolated client class ShoppingServiceAddProductResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAddProductResponse(AddProductResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAddProductResponse(ContextAddProductResponse response) returns grpc:Error? {
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

public type ContextCreateUserRequestStream record {|
    stream<CreateUserRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextAddProductResponse record {|
    AddProductResponse content;
    map<string|string[]> headers;
|};

public type ContextAddToCartResponse record {|
    AddToCartResponse content;
    map<string|string[]> headers;
|};

public type ContextListProductsResponse record {|
    ListProductsResponse content;
    map<string|string[]> headers;
|};

public type ContextRemoveProductResponse record {|
    RemoveProductResponse content;
    map<string|string[]> headers;
|};

public type ContextAddProductRequest record {|
    AddProductRequest content;
    map<string|string[]> headers;
|};

public type ContextUpdateProductRequest record {|
    UpdateProductRequest content;
    map<string|string[]> headers;
|};

public type ContextSearchProductRequest record {|
    SearchProductRequest content;
    map<string|string[]> headers;
|};

public type ContextAddToCartRequest record {|
    AddToCartRequest content;
    map<string|string[]> headers;
|};

public type ContextPlaceOrderResponse record {|
    PlaceOrderResponse content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextPlaceOrderRequest record {|
    PlaceOrderRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateUserResponse record {|
    CreateUserResponse content;
    map<string|string[]> headers;
|};

public type ContextRemoveProductRequest record {|
    RemoveProductRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateUserRequest record {|
    CreateUserRequest content;
    map<string|string[]> headers;
|};

public type ContextSearchProductResponse record {|
    SearchProductResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateProductResponse record {|
    UpdateProductResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type AddProductResponse record {|
    string product_code = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type AddToCartResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type ListProductsResponse record {|
    Product[] products = [];
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type Product record {|
    string name = "";
    string description = "";
    float price = 0.0;
    int stock_quantity = 0;
    string sku = "";
    string status = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type RemoveProductResponse record {|
    Product[] products = [];
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type AddProductRequest record {|
    string name = "";
    string description = "";
    float price = 0.0;
    int stock_quantity = 0;
    string sku = "";
    string status = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type UpdateProductRequest record {|
    string product_code = "";
    string name = "";
    string description = "";
    float price = 0.0;
    int stock_quantity = 0;
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type SearchProductRequest record {|
    string sku = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type AddToCartRequest record {|
    string user_id = "";
    string sku = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type PlaceOrderResponse record {|
    string order_id = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type PlaceOrderRequest record {|
    string user_id = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type CreateUserResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type RemoveProductRequest record {|
    string product_code = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type CreateUserRequest record {|
    string user_id = "";
    string user_type = "";
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type SearchProductResponse record {|
    Product product = {};
|};

@protobuf:Descriptor {value: SHOPPING_SERVICE_DESC}
public type UpdateProductResponse record {|
    boolean success = false;
|};

