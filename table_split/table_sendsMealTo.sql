CREATE TABLE SendsMealTo
(
    staff_id       INTEGER,
    store_id       INTEGER,
    workStation_id INTEGER,
    PRIMARY KEY (staff_id, store_id, workStation_id),
    FOREIGN KEY (staff_id) REFERENCES Staff ON DELETE CASCADE,
    FOREIGN KEY (store_id, workStation_id) REFERENCES WorkStation ON DELETE CASCADE
);