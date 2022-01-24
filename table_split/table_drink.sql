CREATE TABLE Drink
(
    meal_id       INTEGER,
    drink_flavour CHAR(20),
    drink_size    CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);