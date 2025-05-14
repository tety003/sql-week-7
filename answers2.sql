
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerName TEXT
);


CREATE TABLE OrderItems (
    OrderID INTEGER,
    Product TEXT,
    Quantity INTEGER,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;


INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;

