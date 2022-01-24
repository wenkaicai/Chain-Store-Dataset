CREATE TABLE Customer
(
    phone         INTEGER,
    member_id     INTEGER,
    customer_name CHAR(40),
    PRIMARY KEY (phone),
    FOREIGN KEY (member_id) REFERENCES Member ON DELETE SET NULL
);