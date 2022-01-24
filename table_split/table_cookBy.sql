CREATE TABLE CookBy
(
    store_id       INTEGER,
    workStation_id INTEGER,
    meal_id        INTEGER,
    PRIMARY KEY (store_id, workStation_id, meal_id),
    FOREIGN KEY (store_id, workStation_id) REFERENCES WorkStation ON DELETE CASCADE,
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);