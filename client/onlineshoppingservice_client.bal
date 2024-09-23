import ballerina/io;
import ballerina/lang.'float as langfloat;
import ballerina/lang.'int as langint;

OnlineShoppingServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    printHeader();
    while true {
        printMenu();
        string choice = io:readln("\nEnter your choice: ");

        match choice {
            "1" => {
                check addProduct();
            }
            "2" => {
                check updateProduct();
            }
            "3" => {
                check removeProduct();
            }
            "4" => {
                check listAvailableProducts();
            }
            "5" => {
                check searchProduct();
            }
            "6" => {
                check addToCart();
            }
            "7" => {
                check placeOrder();
            }
            "8" => {
                check createUser();
            }
            "9" => {
                io:println("Exiting the program. Goodbye!");
                return;
            }
            _ => {
                io:println("Invalid choice. Please try again.");
            }
        }
    }
}

function printHeader() {
    io:println("\n+===============================================+");
    io:println("|          Online Shopping CLI System           |");
    io:println("+===============================================+");
}

function printMenu() {
    io:println("\n+--------------------------------------------+");
    io:println("|  1. Add Product                              |");
    io:println("|  2. Update Product                           |");
    io:println("|  3. Remove Product                           |");
    io:println("|  4. List Available Products                  |");
    io:println("|  5. Search Product                           |");
    io:println("|  6. Add to Cart                              |");
    io:println("|  7. Place Order                              |");
    io:println("|  8. Create Users                             |");
    io:println("|  9. Exit                                     |");
    io:println("+----------------------------------------------+");
}

function addProduct() returns error? {
    Product request = {
        name: prompt("Enter product name: "),
        description: prompt("Enter product description: "),
        price: check toFloat(prompt("Enter product price: ")),
        stock_quantity: check toInt(prompt("Enter stock quantity: ")),
        sku: prompt("Enter product sku: "),
        status: prompt("Enter product status: ")
    };

    ProductResponse response = check ep->addProduct(request);
    io:println(response);
}

function updateProduct() returns error? {
    ProductUpdate request = {
        sku: prompt("Enter SKU to update: "),
        product: {
            name: prompt("Enter new product name: "),
            description: prompt("Enter new description: "),
            price: check toFloat(prompt("Enter new price: ")),
            stock_quantity: check toInt(prompt("Enter new stock quantity: ")),
            sku: prompt("Enter new SKU: "),
            status: prompt("Enter new status: ")
        }
    };
    ProductResponse response = check ep->updateProduct(request);
    io:println(response);
}

function removeProduct() returns error? {
    ProductId request = {sku: prompt("Enter SKU to remove: ")};
    ProductList response = check ep->removeProduct(request);
    io:println(response);
}

function listAvailableProducts() returns error? {
    Empty request = {};
    ProductList response = check ep->listAvailableProducts(request);
    io:println(response);
}

function searchProduct() returns error? {
    ProductId request = {sku: prompt("Enter SKU to search: ")};
    ProductResponse response = check ep->searchProduct(request);
    io:println(response);
}

function addToCart() returns error? {
    CartRequest request = {
        user_id: prompt("Enter user ID: "),
        sku: prompt("Enter SKU to add to cart: ")
    };
    CartResponse response = check ep->addToCart(request);
    io:println(response);
}

function placeOrder() returns error? {
    OrderRequest request = {user_id: prompt("Enter user ID to place order: ")};
    OrderResponse response = check ep->placeOrder(request);
    io:println(response);
}

function createUser() returns error? {
    User createUsersRequest = {
        user_id: prompt("Enter user ID: "),
        name: prompt("Enter user name: "),
        role: prompt("Enter user role: ")
    };

    CreateUsersStreamingClient createUsersStreamingClient = check ep->createUsers();

    check createUsersStreamingClient->sendUser(createUsersRequest);

    check createUsersStreamingClient->complete();

    UserResponse? createUsersResponse = check createUsersStreamingClient->receiveUserResponse();

    if createUsersResponse is UserResponse {
        io:println(createUsersResponse);
    } else {
        io:println("No response received.");
    }
}

function prompt(string message) returns string {
    return io:readln(message).trim();
}

function toInt(string value) returns int|error {
    return langint:fromString(value);
}

function toFloat(string value) returns float|error {
    return langfloat:fromString(value);
}
