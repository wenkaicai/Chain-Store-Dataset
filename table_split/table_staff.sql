CREATE TABLE Staff
(
    staff_id   INTEGER,
    store_id   INTEGER NOT NULL,
    staff_name CHAR(40),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (store_id) REFERENCES Store ON DELETE CASCADE
);