import ballerina/grpc;

listener grpc:Listener ep = new (9090);
// the descriptor provides metadata about the service
@grpc:Descriptor {value: SHOPPING_SERVICE_DESC}
service "ShoppingService" on ep { // the shoping service is listening for requests on ep

//lets declare our remote functions

    remote function AddProduct(AddProductRequest value) returns AddProductResponse|error {
    }

    remote function UpdateProduct(UpdateProductRequest value) returns UpdateProductResponse|error {
    }

    remote function RemoveProduct(RemoveProductRequest value) returns RemoveProductResponse|error {
    }

    remote function ListAvailableProducts(Empty value) returns ListProductsResponse|error {
    }

    remote function SearchProduct(SearchProductRequest value) returns SearchProductResponse|error {
    }

    remote function AddToCart(AddToCartRequest value) returns AddToCartResponse|error {
    }

    remote function PlaceOrder(PlaceOrderRequest value) returns PlaceOrderResponse|error {
    }

    remote function CreateUsers(stream<CreateUserRequest, grpc:Error?> clientStream) returns CreateUserResponse|error {
    }
}

