CREATE TABLE Orders
(
    order_number   INTEGER,
    customer_phone INTEGER NOT NULL,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_phone) REFERENCES Customer (phone) ON DELETE CASCADE
);
