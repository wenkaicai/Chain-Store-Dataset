CREATE TABLE WorkStation
(
    store_id         INTEGER NOT NULL,
    workStation_id   INTEGER,
    workStation_name CHAR(40),
    PRIMARY KEY (store_id, workStation_id),
    FOREIGN KEY (store_id) REFERENCES Store ON DELETE CASCADE
);