import ballerina/grpc;

listener grpc:Listener ep = new (9090);

Product[] products = [];
User[] users = [];

@grpc:Descriptor {value: GRPC_DESC}
service "OnlineShoppingService" on ep {

    // List all available products
    remote function listAvailableProducts(Empty value) returns ProductList|error {
        ProductList productList = {products: products};
        return productList;
    }

    // Search for a product by SKU
    remote function searchProduct(ProductId value) returns ProductResponse|error {
        foreach var product in products {
            if product.sku == value.sku {
                return {message: "Product found", product: product};
            }
        }
        return {message: "Product not found"};
    }

    // Add product to cart (dummy logic as cart storage isn't implemented yet)
    remote function addToCart(CartRequest value) returns CartResponse|error {
        // Logic to add to cart (for now, just return a success message)
        return {message: "Added to cart"};
    }

    // Place an order (dummy logic for now)
    remote function placeOrder(OrderRequest value) returns OrderResponse|error {
        Product[] orderedProducts = [];
        // Logic to process order (e.g., reduce stock quantity) can be added here
        return {message: "Order placed successfully", products: orderedProducts};
    }

    // Add a new product
    remote function addProduct(Product value) returns ProductResponse|error {
        products.push(value);
        return {message: "Product added successfully", product: value};
    }

    // Update an existing product
    remote function updateProduct(ProductUpdate value) returns ProductResponse|error {
        foreach var product in products {
            if product.sku == value.sku {
                product.name = value.product.name;
                product.description = value.product.description;
                product.price = value.product.price;
                product.stock_quantity = value.product.stock_quantity;
                product.status = value.product.status;
                return {message: "Product updated successfully", product: product};
            }
        }
        return {message: "Product not found"};
    }

    // Remove a product by SKU
    remote function removeProduct(ProductId value) returns ProductList|error {
        int index = -1;
        foreach int i in 0 ... products.length() {
            if products[i].sku == value.sku {
                index = i;
                break;
            }
        }
        if index != -1 {
            _ = products.remove(index);
            return {products: products};
        }
        return {products: products};
    }

    // Create users using a client stream
    remote function createUsers(stream<User, grpc:Error?> clientStream) returns UserResponse|error {
        check from User user in clientStream
            do {
                users.push(user);
            };
        return {message: "Users created successfully"};
    }
}
