CREATE DATABASE RESTAURANT_MANAGEMENT_SYSTEM;
USE RESTAURANT_MANAGEMENT_SYSTEM;

CREATE TABLE Restaurant (
    restaurant_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Person (
    person_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Staff (
    staff_id VARCHAR(10) PRIMARY KEY,
    person_id VARCHAR(10) UNIQUE NOT NULL,
    restaurant_id VARCHAR(10) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('cashier', 'waiter', 'manager', 'chef')),
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE
);

CREATE TABLE Customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    person_id VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE
);

CREATE TABLE Chef (
    chef_id VARCHAR(10) PRIMARY KEY,
    staff_id VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Manager (
    manager_id VARCHAR(10) PRIMARY KEY,
    staff_id VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Waiter (
    waiter_id VARCHAR(10) PRIMARY KEY,
    staff_id VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Cashier (
    cashier_id VARCHAR(10) PRIMARY KEY,
    staff_id VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Items (
    item_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    waiter_id VARCHAR(10) NOT NULL,
    manager_id VARCHAR(10) NOT NULL,
    chef_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (waiter_id) REFERENCES Waiter(waiter_id),
    FOREIGN KEY (manager_id) REFERENCES Manager(manager_id),
    FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
);

CREATE TABLE OrderItems (
    order_id VARCHAR(10),
    item_id VARCHAR(10),
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

CREATE TABLE Bills (
    bill_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    cashier_id VARCHAR(10) NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (cashier_id) REFERENCES Cashier(cashier_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- -- Summary of Relationships Handled:
-- -- Restaurant has many Staff
-- -- Staff is a subclass of Person and includes Cashier, Manager, Waiter, Chef
-- -- Customer places an Order
-- -- Order contains multiple Items (many-to-many via OrderItems)
-- -- Chef prepares Order
-- -- Manager approves Order
-- -- Waiter takes Order
-- -- Customer pays a Bill
-- -- Bill is paid to Cashier


-- (unchanged schema from earlier)
-- TABLES already defined above...

-- FULL 10 ENTRIES FOR ALL TABLES

-- Restaurant
INSERT INTO Restaurant VALUES
('REST001', 'Pizza Palace'),
('REST002', 'Burger Point'),
('REST003', 'Spice Hub'),
('REST004', 'The Grill'),
('REST005', 'Food Fusion'),
('REST006', 'Urban Bites'),
('REST007', 'Cafe Corner'),
('REST008', 'Desi Diner'),
('REST009', 'Tandoori Tales'),
('REST010', 'Wrap Station');

-- Person
INSERT INTO Person VALUES
('PERS001', 'Ali Khan'),
('PERS002', 'Sara Ahmed'),
('PERS003', 'Usman Malik'),
('PERS004', 'Hina Tariq'),
('PERS005', 'Bilal Raza'),
('PERS006', 'Nida Khan'),
('PERS007', 'Waleed Shah'),
('PERS008', 'Ayesha Noor'),
('PERS009', 'Tariq Jameel'),
('PERS010', 'Zoya Anwar');

-- Staff
INSERT INTO Staff VALUES
('STF001', 'PERS001', 'REST001', 'chef'),
('STF002', 'PERS002', 'REST001', 'manager'),
('STF003', 'PERS003', 'REST001', 'waiter'),
('STF004', 'PERS004', 'REST001', 'cashier'),
('STF005', 'PERS005', 'REST002', 'chef'),
('STF006', 'PERS006', 'REST002', 'manager'),
('STF007', 'PERS007', 'REST002', 'waiter'),
('STF008', 'PERS008', 'REST002', 'cashier'),
('STF009', 'PERS009', 'REST003', 'chef'),
('STF010', 'PERS010', 'REST003', 'manager');

-- Customer
INSERT INTO Customer VALUES
('CUS001', 'PERS001'),
('CUS002', 'PERS002'),
('CUS003', 'PERS003'),
('CUS004', 'PERS004'),
('CUS005', 'PERS005'),
('CUS006', 'PERS006'),
('CUS007', 'PERS007'),
('CUS008', 'PERS008'),
('CUS009', 'PERS009'),
('CUS010', 'PERS010');

-- Chef
INSERT INTO Chef VALUES
('CHEF01', 'STF001'),
('CHEF02', 'STF005'),
('CHEF03', 'STF009'),
('CHEF04', 'STF003'),
('CHEF05', 'STF007'),
('CHEF06', 'STF010'),
('CHEF07', 'STF002'),
('CHEF08', 'STF004'),
('CHEF09', 'STF006'),
('CHEF10', 'STF008');

-- Manager
INSERT INTO Manager VALUES
('MGR01', 'STF002'),
('MGR02', 'STF006'),
('MGR03', 'STF010'),
('MGR04', 'STF003'),
('MGR05', 'STF004'),
('MGR06', 'STF005'),
('MGR07', 'STF001'),
('MGR08', 'STF007'),
('MGR09', 'STF008'),
('MGR10', 'STF009');

-- Waiter
INSERT INTO Waiter VALUES
('WAIT01', 'STF003'),
('WAIT02', 'STF007'),
('WAIT03', 'STF004'),
('WAIT04', 'STF006'),
('WAIT05', 'STF008'),
('WAIT06', 'STF002'),
('WAIT07', 'STF005'),
('WAIT08', 'STF009'),
('WAIT09', 'STF001'),
('WAIT10', 'STF010');

-- Cashier
INSERT INTO Cashier VALUES
('CASH01', 'STF004'),
('CASH02', 'STF008'),
('CASH03', 'STF006'),
('CASH04', 'STF005'),
('CASH05', 'STF007'),
('CASH06', 'STF009'),
('CASH07', 'STF001'),
('CASH08', 'STF002'),
('CASH09', 'STF003'),
('CASH10', 'STF010');

-- Items
INSERT INTO Items VALUES
('ITEM01', 'Chicken Burger', 450.00),
('ITEM02', 'Beef Pizza', 800.00),
('ITEM03', 'French Fries', 200.00),
('ITEM04', 'Cold Drink', 100.00),
('ITEM05', 'Zinger Wrap', 500.00),
('ITEM06', 'Tandoori Chicken', 750.00),
('ITEM07', 'Pasta Alfredo', 600.00),
('ITEM08', 'BBQ Platter', 1200.00),
('ITEM09', 'Paneer Roll', 300.00),
('ITEM10', 'Chocolate Shake', 250.00);

-- Orders
INSERT INTO Orders VALUES
('ORD01', 'CUS001', 'WAIT01', 'MGR01', 'CHEF01'),
('ORD02', 'CUS002', 'WAIT02', 'MGR02', 'CHEF02'),
('ORD03', 'CUS003', 'WAIT03', 'MGR03', 'CHEF03'),
('ORD04', 'CUS004', 'WAIT04', 'MGR04', 'CHEF04'),
('ORD05', 'CUS005', 'WAIT05', 'MGR05', 'CHEF05'),
('ORD06', 'CUS006', 'WAIT06', 'MGR06', 'CHEF06'),
('ORD07', 'CUS007', 'WAIT07', 'MGR07', 'CHEF07'),
('ORD08', 'CUS008', 'WAIT08', 'MGR08', 'CHEF08'),
('ORD09', 'CUS009', 'WAIT09', 'MGR09', 'CHEF09'),
('ORD10', 'CUS010', 'WAIT10', 'MGR10', 'CHEF10');

-- OrderItems
INSERT INTO OrderItems VALUES
('ORD01', 'ITEM01', 2),
('ORD02', 'ITEM02', 1),
('ORD03', 'ITEM03', 1),
('ORD04', 'ITEM04', 3),
('ORD05', 'ITEM05', 1),
('ORD06', 'ITEM06', 2),
('ORD07', 'ITEM07', 1),
('ORD08', 'ITEM08', 1),
('ORD09', 'ITEM09', 2),
('ORD10', 'ITEM10', 2);

-- Bills
INSERT INTO Bills VALUES
('BILL01', 'ORD01', 'CASH01', 'CUS001', 1000.00),
('BILL02', 'ORD02', 'CASH02', 'CUS002', 800.00),
('BILL03', 'ORD03', 'CASH03', 'CUS003', 200.00),
('BILL04', 'ORD04', 'CASH04', 'CUS004', 300.00),
('BILL05', 'ORD05', 'CASH05', 'CUS005', 500.00),
('BILL06', 'ORD06', 'CASH06', 'CUS006', 1500.00),
('BILL07', 'ORD07', 'CASH07', 'CUS007', 600.00),
('BILL08', 'ORD08', 'CASH08', 'CUS008', 1200.00),
('BILL09', 'ORD09', 'CASH09', 'CUS009', 600.00),
('BILL10', 'ORD10', 'CASH10', 'CUS010', 500.00);


SELECT * FROM Bills;
SELECT * FROM Items WHERE price > 500;
SELECT c.customer_id,p.person_id FROM Customer c,Person p where c.person_id = p.person_id;
SELECT * FROM Customer c,Person p,Staff s where c.person_id = p.person_id And p.person_id=s.person_id;
SELECT c.*,p.name,b.* FROM Customer c,bills b,person p where c.customer_id=b.customer_id limit 2,6;
SELECT *FROM bills b,person p where b.amount between 200 and 300 ;

-- Select customer names and their bill amounts
SELECT p.name AS customer_name, b.amount
FROM Person p
JOIN Customer c ON p.person_id = c.person_id
JOIN Bills b ON c.customer_id = b.customer_id;

-- 2. List all orders with item names and quantities
SELECT o.order_id, i.name AS item_name, oi.quantity
FROM Orders o
inner JOIN OrderItems oi ON o.order_id = oi.order_id
inner JOIN Items i ON oi.item_id = i.item_id;

select o.order_id id ,p.name from 
orders o
join chef c on o.chef_id=c.chef_id
join staff s on c.staff_id=s.staff_id
join person p on s.person_id=p.person_id;


select * from 
staff s
left join person p on s.person_id=p.person_id;

select * from 
bills b
right join orders o on b.bill_id=o.order_id
right join customer c on c.customer_id=o.customer_id
right join person p on c.person_id=p.person_id;

-- full join 
select * from 
bills b
left join orders o on b.bill_id=o.order_id
left join customer c on c.customer_id=o.customer_id
left join person p on c.person_id=p.person_id
union
select * from 
bills b
right join orders o on b.bill_id=o.order_id
right join customer c on c.customer_id=o.customer_id
right join person p on c.person_id=p.person_id;

select concat(s.name ,' work for ', s.name) from 
person s
join person st on s.person_id=st.person_id;