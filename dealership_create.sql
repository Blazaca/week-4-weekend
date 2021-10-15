-- CREATING TABLES
-- Customer
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    "address" VARCHAR(150),
    phone_number VARCHAR(12),
    billing_info VARCHAR(50)
);
-- CREATING DEALERSHIP TABLE
CREATE TABLE dealership(
    dealer_id SERIAL PRIMARY KEY,
    "name" VARCHAR(50),
    "address" VARCHAR(150),
    phone_number VARCHAR(12)
);
-- CREATING SALESPERSON TABLE
CREATE TABLE salesperson(
    sales_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
-- CREATING MECHANIC TABLE
CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
-- CREATING CARS TABLE
CREATE TABLE cars(
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(20),
    model VARCHAR(20),
    "year" INTEGER,
    miles INTEGER,
    "new/used" VARCHAR(4),
    sales_id INTEGER,
    amount NUMERIC(7,2),
    owner VARCHAR(20),
    customer_id INTEGER,
    color VARCHAR(15),
    FOREIGN KEY(sales_id) REFERENCES salesperson(sales_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
--CREATING INVOICE TABLE
CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    "date" VARCHAR(20),
    sales_id INTEGER,
    customer_id INTEGER,
    car_id INTEGER,
    dealer_id INTEGER,
    amount NUMERIC(7,2),
    FOREIGN KEY(sales_id) REFERENCES salesperson(sales_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(car_id) REFERENCES cars(car_id),
    FOREIGN KEY(dealer_id) REFERENCES dealership(dealer_id)
);
-- CREATING SERVICE TABLE
CREATE TABLE service(
    service_id SERIAL PRIMARY KEY,
    "type" VARCHAR(15),
    customer_id INTEGER,
    car_id INTEGER,
    dealer_id INTEGER,
    mechanic_id INTEGER,
    "date" VARCHAR(20),
    amount NUMERIC(7,2),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(car_id) REFERENCES cars(car_id),
    FOREIGN KEY(dealer_id) REFERENCES dealership(dealer_id),
    FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

