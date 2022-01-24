CREATE TABLE FriedChicken
(
    meal_id              INTEGER,
    friedChicken_flavour CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);