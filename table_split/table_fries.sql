CREATE TABLE Fries
(
    meal_id    INTEGER,
    fries_size CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);