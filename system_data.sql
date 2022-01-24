DROP TABLE Contains;
DROP TABLE CookBy;
DROP TABLE SendsMealTo;
DROP TABLE Serve;
DROP TABLE Drink;
DROP TABLE FriedChicken;
DROP TABLE Fries;
DROP TABLE Meal;
DROP TABLE Orders;
DROP TABLE Customer;
DROP TABLE Member;
DROP TABLE Staff;
DROP TABLE WorkStation;
DROP TABLE Store;

CREATE TABLE Store
(
    store_id        INTEGER,
    store_name      CHAR(40),
    store_address   varchar(80),
    PRIMARY KEY (store_id)
);

CREATE TABLE WorkStation
(
    store_id         INTEGER NOT NULL,
    workStation_id   INTEGER,
    workStation_name CHAR(40),
    PRIMARY KEY (store_id, workStation_id),
    FOREIGN KEY (store_id) REFERENCES Store ON DELETE CASCADE
);

CREATE TABLE Staff
(
    staff_id   INTEGER,
    store_id   INTEGER NOT NULL,
    staff_name CHAR(40),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (store_id) REFERENCES Store ON DELETE CASCADE
);

CREATE TABLE Member
(
    member_id   INTEGER,
    member_name CHAR(40),
    PRIMARY KEY (member_id)
);

CREATE TABLE Customer
(
    phone         INTEGER,
    member_id     INTEGER,
    customer_name CHAR(40),
    PRIMARY KEY (phone),
    FOREIGN KEY (member_id) REFERENCES Member ON DELETE SET NULL
);

CREATE TABLE Orders
(
    order_number   INTEGER,
    customer_phone INTEGER NOT NULL,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_phone) REFERENCES Customer (phone) ON DELETE CASCADE
);

CREATE TABLE Meal
(
    meal_id    INTEGER,
    meal_name  CHAR(40),
    meal_price INTEGER,
    PRIMARY KEY (meal_id)
);

CREATE TABLE Drink
(
    meal_id       INTEGER,
    drink_flavour CHAR(20),
    drink_size    CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);

CREATE TABLE FriedChicken
(
    meal_id              INTEGER,
    friedChicken_flavour CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);

CREATE TABLE Fries
(
    meal_id    INTEGER,
    fries_size CHAR(20),
    PRIMARY KEY (meal_id),
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);

CREATE TABLE Contains
(
    order_number INTEGER,
    meal_id      INTEGER,
    PRIMARY KEY (order_number, meal_id),
    FOREIGN KEY (order_number) REFERENCES Orders (order_number) ON DELETE CASCADE,
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);

CREATE TABLE CookBy
(
    store_id       INTEGER,
    workStation_id INTEGER,
    meal_id        INTEGER,
    PRIMARY KEY (store_id, workStation_id, meal_id),
    FOREIGN KEY (store_id, workStation_id) REFERENCES WorkStation ON DELETE CASCADE,
    FOREIGN KEY (meal_id) REFERENCES Meal ON DELETE CASCADE
);

CREATE TABLE SendsMealTo
(
    staff_id       INTEGER,
    store_id       INTEGER,
    workStation_id INTEGER,
    PRIMARY KEY (staff_id, store_id, workStation_id),
    FOREIGN KEY (staff_id) REFERENCES Staff ON DELETE CASCADE,
    FOREIGN KEY (store_id, workStation_id) REFERENCES WorkStation ON DELETE CASCADE
);

CREATE TABLE Serve
(
    staff_id       INTEGER,
    customer_phone INTEGER,
    PRIMARY KEY (staff_id, customer_phone),
    FOREIGN KEY (staff_id) REFERENCES Staff ON DELETE CASCADE,
    FOREIGN KEY (customer_phone) REFERENCES Customer (phone) ON DELETE CASCADE
);

INSERT INTO Store(store_id, store_name, store_address) VALUES (1000, 'Tundra', '4000 18th Ave, Richmoond,BC V66 123');
INSERT INTO Store(store_id, store_name, store_address) VALUES (1001, 'Silk', '3427 Arbutus Road, Vancouver,BC V45 246');
INSERT INTO Store(store_id, store_name, store_address) VALUES (1002, 'Glamour', '1234 178 Street, Surrey,BC V33 345');
INSERT INTO Store(store_id, store_name, store_address) VALUES (1003, 'Fuller', '392 Central Ave, Swift Current,SK S98 0L3');
INSERT INTO Store(store_id, store_name, store_address) VALUES (1004, 'Zodiac', '482Manitou Rd, Manitouwadge,ON P0T 123');
INSERT INTO Store(store_id, store_name, store_address) VALUES (1005, 'New', 'Not decided yet');


INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1000, 100, 'station1');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1000, 101, 'station2');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1000, 102, 'station3');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1001, 103, 'station1');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1001, 104, 'station2');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1001, 105, 'station3');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1002, 106, 'station1');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1002, 107, 'station2');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1002, 108, 'station3');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1003, 109, 'station1');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1003, 110, 'station2');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1003, 111, 'station3');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1004, 112, 'station1');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1004, 113, 'station2');
INSERT INTO WorkStation(store_id, workStation_id, workStation_name) VALUES (1004, 114, 'station3');


INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10000, 1000, 'Alex Wang');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10001, 1000, 'Donata Manuel');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10002, 1000, 'Vipin Widukind');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10003, 1000, 'Elke Margarita');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10004, 1000, 'Praveena Dina');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10005, 1001, 'Kevin Tsai');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10006, 1001, 'Bettina Zhang');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10007, 1001, 'Lian Ji');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10008, 1001, 'Johnathan Adolf');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10009, 1001, 'Sasho Leyre');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10010, 1002, 'Curtis Gamil');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10011, 1002, 'Narayan Marijana');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10012, 1002, 'Olivia Jin');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10013, 1002, 'Lina Jussi');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10014, 1002, 'Cathy Zhu');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10015, 1003, 'Aminatou Ruthie');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10016, 1003, 'Launo Kristopher');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10017, 1003, 'Fareed Signe');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10018, 1003, 'Agapi Petronella');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10019, 1003, 'Venkata Martinus');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10020, 1004, 'Glenda Trophimos');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10021, 1004, 'Zephy Gae');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10022, 1004, 'Veronika Simon');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10023, 1004, 'Orlando Fortunato');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10024, 1004, 'Judita Helle');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10025, 1004, 'MD FF');
INSERT INTO Staff(staff_id, store_id, staff_name) VALUES (10026, 1004, 'Justin Beber');


INSERT INTO Member(member_id, member_name) VALUES (1000, 'Silver Elite');
INSERT INTO Member(member_id, member_name) VALUES (2000, 'Gold Elite');
INSERT INTO Member(member_id, member_name) VALUES (3000, 'Platinum Elite');
INSERT INTO Member(member_id, member_name) VALUES (4000, 'Diamond Elite');
INSERT INTO Member(member_id, member_name) VALUES (5000, 'Titanium Elite');


INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000000, NULL, 'Alex Wang');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000001, 1000, 'Donata Manuel');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000002, 2000, 'Vipin Widukind');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000003, 3000, 'Elke Margarita');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000004, 4000, 'Praveena Dina');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000005, 5000, 'Donald Trump');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000006, NULL, 'Pumpkin Jee');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000007, 1000, 'Mona Chen');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000008, 2000, 'Jay Haris');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000009, 3000, 'Hicho Mayo');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000010, 4000, 'Takeshi Naoki');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000011, 5000, 'Steve Jobs');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000012, NULL, 'Mona Chen');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000013, 1000, 'Uri Oha');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000014, 2000, 'Samara Hip');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000015, 3000, 'Part timne');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000016, 4000, 'Praveena Dina');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000017, 5000, 'Jay Haris');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000018, NULL, 'Joseph Sale');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000019, NULL, 'Harry Hong');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000020, 1000, 'Jonas Neubauer');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000021, 1000, 'Jack Jore');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000022, 4000, 'Macoola Mattata');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000023, 4000, 'Jason Kim');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000024, 5000, 'Jeff Moore');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000025, NULL, 'John Hopkins');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000026, NULL, 'Steve Boi');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000027, 2000, 'Doge Coin');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000028, 2000, 'Baby Doge');
INSERT INTO Customer(phone, member_id, customer_name) VALUES (6040000029, 4000, 'Shib Shib');


INSERT INTO Orders(order_number, customer_phone) VALUES (500, 6040000000);
INSERT INTO Orders(order_number, customer_phone) VALUES (501, 6040000001);
INSERT INTO Orders(order_number, customer_phone) VALUES (502, 6040000002);
INSERT INTO Orders(order_number, customer_phone) VALUES (503, 6040000003);
INSERT INTO Orders(order_number, customer_phone) VALUES (504, 6040000004);
INSERT INTO Orders(order_number, customer_phone) VALUES (505, 6040000005);
INSERT INTO Orders(order_number, customer_phone) VALUES (506, 6040000006);
INSERT INTO Orders(order_number, customer_phone) VALUES (507, 6040000007);
INSERT INTO Orders(order_number, customer_phone) VALUES (508, 6040000008);
INSERT INTO Orders(order_number, customer_phone) VALUES (509, 6040000009);
INSERT INTO Orders(order_number, customer_phone) VALUES (510, 6040000010);
INSERT INTO Orders(order_number, customer_phone) VALUES (511, 6040000011);
INSERT INTO Orders(order_number, customer_phone) VALUES (512, 6040000012);
INSERT INTO Orders(order_number, customer_phone) VALUES (513, 6040000013);
INSERT INTO Orders(order_number, customer_phone) VALUES (514, 6040000014);
INSERT INTO Orders(order_number, customer_phone) VALUES (515, 6040000015);
INSERT INTO Orders(order_number, customer_phone) VALUES (516, 6040000016);
INSERT INTO Orders(order_number, customer_phone) VALUES (517, 6040000017);
INSERT INTO Orders(order_number, customer_phone) VALUES (518, 6040000018);
INSERT INTO Orders(order_number, customer_phone) VALUES (519, 6040000019);
INSERT INTO Orders(order_number, customer_phone) VALUES (520, 6040000020);
INSERT INTO Orders(order_number, customer_phone) VALUES (521, 6040000021);
INSERT INTO Orders(order_number, customer_phone) VALUES (522, 6040000022);
INSERT INTO Orders(order_number, customer_phone) VALUES (523, 6040000023);
INSERT INTO Orders(order_number, customer_phone) VALUES (524, 6040000024);
INSERT INTO Orders(order_number, customer_phone) VALUES (525, 6040000025);
INSERT INTO Orders(order_number, customer_phone) VALUES (526, 6040000000);
INSERT INTO Orders(order_number, customer_phone) VALUES (527, 6040000001);
INSERT INTO Orders(order_number, customer_phone) VALUES (528, 6040000004);
INSERT INTO Orders(order_number, customer_phone) VALUES (529, 6040000004);
INSERT INTO Orders(order_number, customer_phone) VALUES (530, 6040000009);
INSERT INTO Orders(order_number, customer_phone) VALUES (531, 6040000009);
INSERT INTO Orders(order_number, customer_phone) VALUES (532, 6040000009);
INSERT INTO Orders(order_number, customer_phone) VALUES (533, 6040000014);
INSERT INTO Orders(order_number, customer_phone) VALUES (534, 6040000015);

INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (1, 'Fried Whole Chicken', 15);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (2, 'Fried Whole Chicken', 15);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (3, 'Fried Whole Chicken', 14);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (4, 'Fried Whole Chicken', 17);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (5, 'Fried Whole Chicken', 18);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (6, 'Fried Whole Chicken', 17);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (7, 'Chicken Wings', 15);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (8, 'Chicken Wings', 15);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (9, 'Chicken Wings', 14);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (10, 'Chicken Wings', 13);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (11, 'Chicken Strips', 10);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (12, 'Chicken Strips', 10);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (13, 'Chicken Strips', 11);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (14, 'Chicken Strips', 12);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (15, 'Coke', 3);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (16, 'Coke', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (17, 'Coke', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (18, 'Coke', 3);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (19, 'Coke', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (20, 'Coke', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (21, 'Coke', 3);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (22, 'Coke', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (23, 'Coke', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (24, 'Sprite', 3);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (25, 'Sprite', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (26, 'Sprite', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (27, 'Sprite', 3);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (28, 'Sprite', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (29, 'Sprite', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (30, 'Green Tea', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (31, 'Green Tea', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (32, 'Green Tea', 4);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (33, 'Green Tea', 5);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (34, 'Juice', 8);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (35, 'Juice', 8);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (36, 'Juice', 8);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (37, 'Original Fries', 6);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (38, 'Original Fries', 7);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (39, 'Original Fries', 8);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (40, 'Poutine Fries', 8);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (41, 'Poutine Fries', 9);
INSERT INTO Meal(meal_id, meal_name, meal_price) VALUES (42, 'Poutine Fries', 10);


INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (15, 'Original', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (16, 'Original', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (17, 'Original', 'large');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (18, 'Diet', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (19, 'Diet', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (20, 'Diet', 'large');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (21, 'Zero', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (22, 'Zero', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (23, 'Zero', 'large');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (24, 'Original', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (25, 'Original', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (26, 'Original', 'large');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (27, 'Diet', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (28, 'Diet', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (29, 'Diet', 'large');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (30, 'Cold', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (31, 'Cold', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (32, 'Hot', 'small');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (33, 'Hot', 'medium');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (34, 'Orange', 'One Size');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (35, 'Grape', 'One Size');
INSERT INTO Drink(meal_id, drink_flavour, drink_size) VALUES (36, 'Apple', 'One Size');


INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (1, 'Jamaican');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (2, 'Hot Asian');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (3, 'Baked Popcorn');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (4, 'Buttermilk');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (5, 'Mango Hot Sauce');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (6, 'Chinese Orange');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (7, 'Hot Asian');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (8, 'Crispy Coconut');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (9, 'Buffalo');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (10, 'Hot Sauce');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (11, 'Pepper and Salt');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (12, 'Hot Asian');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (13, 'Butter');
INSERT INTO FriedChicken(meal_id, friedChicken_flavour) VALUES (14, 'Chilli and Spice');


INSERT INTO Fries(meal_id, fries_size) VALUES (37, 'small');
INSERT INTO Fries(meal_id, fries_size) VALUES (38, 'medium');
INSERT INTO Fries(meal_id, fries_size) VALUES (39, 'large');
INSERT INTO Fries(meal_id, fries_size) VALUES (40, 'small');
INSERT INTO Fries(meal_id, fries_size) VALUES (41, 'medium');
INSERT INTO Fries(meal_id, fries_size) VALUES (42, 'large');


INSERT INTO Contains(order_number, meal_id) VALUES (500, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (500, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (500, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (500, 16);
INSERT INTO Contains(order_number, meal_id) VALUES (500, 37);

INSERT INTO Contains(order_number, meal_id) VALUES (501, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (501, 17);
INSERT INTO Contains(order_number, meal_id) VALUES (501, 18);
INSERT INTO Contains(order_number, meal_id) VALUES (501, 38);

INSERT INTO Contains(order_number, meal_id) VALUES (502, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (502, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (502, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (502, 39);

INSERT INTO Contains(order_number, meal_id) VALUES (503, 4);
INSERT INTO Contains(order_number, meal_id) VALUES (503, 9);
INSERT INTO Contains(order_number, meal_id) VALUES (503, 40);

INSERT INTO Contains(order_number, meal_id) VALUES (504, 5);

INSERT INTO Contains(order_number, meal_id) VALUES (505, 6);
INSERT INTO Contains(order_number, meal_id) VALUES (505, 10);
INSERT INTO Contains(order_number, meal_id) VALUES (505, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (505, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (505, 22);

INSERT INTO Contains(order_number, meal_id) VALUES (506, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (506, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (506, 23);
INSERT INTO Contains(order_number, meal_id) VALUES (506, 41);

INSERT INTO Contains(order_number, meal_id) VALUES (507, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 13);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 14);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 24);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 25);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 26);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 27);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 41);
INSERT INTO Contains(order_number, meal_id) VALUES (507, 42);

INSERT INTO Contains(order_number, meal_id) VALUES (508, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (508, 28);
INSERT INTO Contains(order_number, meal_id) VALUES (508, 29);

INSERT INTO Contains(order_number, meal_id) VALUES (509, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (509, 30);
INSERT INTO Contains(order_number, meal_id) VALUES (509, 31);

INSERT INTO Contains(order_number, meal_id) VALUES (510, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 11);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 32);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 33);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 34);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 37);
INSERT INTO Contains(order_number, meal_id) VALUES (510, 38);

INSERT INTO Contains(order_number, meal_id) VALUES (511, 4);
INSERT INTO Contains(order_number, meal_id) VALUES (511, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (511, 16);

INSERT INTO Contains(order_number, meal_id) VALUES (512, 5);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 6);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 38);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 39);
INSERT INTO Contains(order_number, meal_id) VALUES (512, 40);

INSERT INTO Contains(order_number, meal_id) VALUES (513, 8);

INSERT INTO Contains(order_number, meal_id) VALUES (514, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (514, 14);
INSERT INTO Contains(order_number, meal_id) VALUES (514, 28);
INSERT INTO Contains(order_number, meal_id) VALUES (514, 29);
INSERT INTO Contains(order_number, meal_id) VALUES (514, 30);
INSERT INTO Contains(order_number, meal_id) VALUES (514, 41);

INSERT INTO Contains(order_number, meal_id) VALUES (515, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (515, 11);
INSERT INTO Contains(order_number, meal_id) VALUES (515, 24);
INSERT INTO Contains(order_number, meal_id) VALUES (515, 37);

INSERT INTO Contains(order_number, meal_id) VALUES (516, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (516, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (516, 25);
INSERT INTO Contains(order_number, meal_id) VALUES (516, 42);

INSERT INTO Contains(order_number, meal_id) VALUES (517, 4);
INSERT INTO Contains(order_number, meal_id) VALUES (517, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (517, 16);

INSERT INTO Contains(order_number, meal_id) VALUES (518, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (518, 6);
INSERT INTO Contains(order_number, meal_id) VALUES (518, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (518, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (518, 21);

INSERT INTO Contains(order_number, meal_id) VALUES (519, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (519, 16);
INSERT INTO Contains(order_number, meal_id) VALUES (519, 40);

INSERT INTO Contains(order_number, meal_id) VALUES (520, 10);
INSERT INTO Contains(order_number, meal_id) VALUES (520, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (520, 39);

INSERT INTO Contains(order_number, meal_id) VALUES (521, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (521, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (521, 9);
INSERT INTO Contains(order_number, meal_id) VALUES (521, 23);
INSERT INTO Contains(order_number, meal_id) VALUES (521, 37);

INSERT INTO Contains(order_number, meal_id) VALUES (522, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (522, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (522, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (522, 29);

INSERT INTO Contains(order_number, meal_id) VALUES (523, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (523, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (523, 29);

INSERT INTO Contains(order_number, meal_id) VALUES (524, 5);
INSERT INTO Contains(order_number, meal_id) VALUES (524, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (524, 23);
INSERT INTO Contains(order_number, meal_id) VALUES (524, 28);

INSERT INTO Contains(order_number, meal_id) VALUES (525, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (525, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (525, 24);
INSERT INTO Contains(order_number, meal_id) VALUES (525, 30);
INSERT INTO Contains(order_number, meal_id) VALUES (525, 42);

INSERT INTO Contains(order_number, meal_id) VALUES (526, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (526, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (526, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (526, 41);

INSERT INTO Contains(order_number, meal_id) VALUES (527, 10);
INSERT INTO Contains(order_number, meal_id) VALUES (527, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (527, 37);

INSERT INTO Contains(order_number, meal_id) VALUES (528, 1);

INSERT INTO Contains(order_number, meal_id) VALUES (529, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (529, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (529, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (529, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (529, 37);

INSERT INTO Contains(order_number, meal_id) VALUES (530, 12);

INSERT INTO Contains(order_number, meal_id) VALUES (531, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (531, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (531, 41);

INSERT INTO Contains(order_number, meal_id) VALUES (532, 8);

INSERT INTO Contains(order_number, meal_id) VALUES (533, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 4);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 5);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 6);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 9);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 10);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 11);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 13);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 14);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 16);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 17);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 18);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 19);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 22);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 23);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 24);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 25);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 26);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 27);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 28);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 29);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 30);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 31);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 32);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 33);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 34);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 35);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 36);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 37);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 38);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 39);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 40);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 41);
INSERT INTO Contains(order_number, meal_id) VALUES (533, 42);

INSERT INTO Contains(order_number, meal_id) VALUES (534, 1);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 2);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 3);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 4);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 5);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 6);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 7);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 8);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 9);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 10);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 11);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 12);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 13);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 14);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 15);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 16);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 17);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 18);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 19);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 20);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 21);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 22);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 23);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 24);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 25);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 26);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 27);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 28);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 29);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 30);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 31);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 32);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 33);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 34);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 35);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 36);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 37);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 38);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 39);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 40);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 41);
INSERT INTO Contains(order_number, meal_id) VALUES (534, 42);


INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 1);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 2);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 3);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 4);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 5);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 6);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 7);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 8);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 9);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 10);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 11);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 12);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 13);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 100, 14);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 15);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 16);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 17);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 18);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 19);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 20);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 21);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 22);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 23);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 24);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 25);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 26);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 27);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 28);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 29);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 30);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 31);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 32);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 33);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 34);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 35);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 101, 36);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 37);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 38);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 39);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 40);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 41);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1000, 102, 42);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 1);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 2);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 3);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 4);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 5);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 6);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 7);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 8);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 9);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 10);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 11);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 12);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 13);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 103, 14);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 15);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 16);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 17);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 18);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 19);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 20);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 21);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 22);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 23);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 24);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 25);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 26);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 27);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 28);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 29);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 30);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 31);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 32);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 33);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 34);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 35);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 104, 36);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 37);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 38);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 39);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 40);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 41);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1001, 105, 42);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 1);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 2);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 3);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 4);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 5);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 6);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 7);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 8);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 9);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 10);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 11);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 12);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 13);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 106, 14);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 15);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 16);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 17);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 18);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 19);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 20);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 21);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 22);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 23);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 24);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 25);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 26);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 27);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 28);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 29);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 30);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 31);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 32);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 33);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 34);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 35);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 107, 36);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 37);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 38);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 39);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 40);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 41);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1002, 108, 42);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 1);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 2);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 3);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 4);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 5);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 6);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 7);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 8);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 9);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 10);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 11);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 12);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 13);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 109, 14);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 15);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 16);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 17);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 18);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 19);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 20);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 21);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 22);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 23);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 24);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 25);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 26);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 27);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 28);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 29);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 30);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 31);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 32);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 33);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 34);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 35);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 110, 36);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 37);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 38);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 39);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 40);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 41);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1003, 111, 42);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 1);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 2);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 3);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 4);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 5);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 6);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 7);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 8);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 9);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 10);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 11);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 12);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 13);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 112, 14);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 15);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 16);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 17);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 18);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 19);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 20);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 21);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 22);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 23);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 24);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 25);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 26);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 27);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 28);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 29);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 30);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 31);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 32);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 33);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 34);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 35);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 113, 36);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 37);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 38);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 39);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 40);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 41);
INSERT INTO CookBy(store_id, workStation_id, meal_id) VALUES (1004, 114, 42);


INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10000, 1000, 100);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10000, 1000, 101);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10001, 1000, 100);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10001, 1000, 102);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10002, 1000, 101);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10003, 1000, 100);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10003, 1000, 101);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10004, 1000, 101);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10004, 1000, 102);

INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10005, 1001, 103);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10006, 1001, 103);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10007, 1001, 103);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10007, 1001, 104);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10008, 1001, 103);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10008, 1001, 105);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10009, 1001, 103);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10009, 1001, 104);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10009, 1001, 105);

INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10010, 1002, 106);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10011, 1002, 106);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10012, 1002, 106);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10012, 1002, 107);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10012, 1002, 108);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10013, 1002, 106);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10013, 1002, 108);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10014, 1002, 108);

INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10015, 1003, 109);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10015, 1003, 110);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10015, 1003, 111);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10016, 1003, 109);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10016, 1003, 110);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10017, 1003, 110);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10017, 1003, 111);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10018, 1003, 110);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10019, 1003, 111);

INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10020, 1004, 112);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10021, 1004, 112);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10021, 1004, 113);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10021, 1004, 114);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10022, 1004, 112);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10022, 1004, 113);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10023, 1004, 114);
INSERT INTO SendsMealTo(staff_id, store_id, workStation_id) VALUES (10024, 1004, 114);


INSERT INTO Serve(staff_id, customer_phone) VALUES (10000, 6040000000);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10000, 6040000001);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10000, 6040000002);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10000, 6040000003);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10001, 6040000004);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10002, 6040000005);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10002, 6040000006);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10002, 6040000007);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10002, 6040000008);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10003, 6040000009);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10004, 6040000000);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10004, 6040000001);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10004, 6040000011);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10005, 6040000012);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10005, 6040000013);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000013);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000014);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000016);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000017);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000018);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10006, 6040000019);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10007, 6040000019);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10007, 6040000021);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10007, 6040000022);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10007, 6040000023);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10009, 6040000025);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10009, 6040000026);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10009, 6040000027);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000001);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000002);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000003);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000004);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000005);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000028);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10010, 6040000029);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000000);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000001);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000006);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000007);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000008);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10012, 6040000009);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10013, 6040000002);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10013, 6040000003);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10013, 6040000004);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10013, 6040000005);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10015, 6040000007);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000008);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000009);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000011);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000012);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000013);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000014);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10016, 6040000016);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10017, 6040000016);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10017, 6040000017);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10017, 6040000018);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10017, 6040000019);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10018, 6040000021);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10018, 6040000022);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10018, 6040000023);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10019, 6040000024);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10021, 6040000026);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10021, 6040000027);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10021, 6040000028);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10021, 6040000029);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10021, 6040000001);

INSERT INTO Serve(staff_id, customer_phone) VALUES (10023, 6040000003);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10023, 6040000004);
INSERT INTO Serve(staff_id, customer_phone) VALUES (10023, 6040000005);
