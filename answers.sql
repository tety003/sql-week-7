
CREATE TABLE ProductDetailNormalized (
    OrderID INTEGER,
    CustomerName TEXT,
    Product TEXT,
    PRIMARY KEY (OrderID, Product)
);


INSERT INTO ProductDetailNormalized (OrderID, CustomerName, Product)
SELECT OrderID, CustomerName, TRIM(value) AS Product
FROM ProductDetail
CROSS JOIN UNNEST(STRING_SPLIT(Products, ',')) AS t(value)
WHERE TRIM(value) != '';

