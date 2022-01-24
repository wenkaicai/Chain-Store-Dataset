CREATE TABLE Contains
(
    order_number INTEGER,
    meal_id      INTEGER,
    PRIMARY KEY (order_number, meal_id),
    FOREIGN KEY (order_number) REFERENCES Orders (order_number) ON DELETE CASCADE,
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);
