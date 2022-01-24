CREATE TABLE Serve
(
    staff_id       INTEGER,
    customer_phone INTEGER,
    PRIMARY KEY (staff_id, customer_phone),
    FOREIGN KEY (staff_id) REFERENCES Staff ON DELETE CASCADE,
    FOREIGN KEY (customer_phone) REFERENCES Customer (phone) ON DELETE CASCADE
);
