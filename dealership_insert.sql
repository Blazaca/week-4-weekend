-- CUSTOMERS
INSERT INTO customer(
    first_name,
    last_name,
    "address",
    phone_number,
    billing_info
)
VALUES(
    'Blake',
    'Alonzo',
    '123 Sesame ST., NY, NY 12345',
    '123-123-1234',
    '4141-4141-4141-4141 12/12 111'
);
INSERT INTO customer(
    first_name,
    last_name,
    "address",
    phone_number,
    billing_info
)
VALUES(
    'George',
    'Castanza',
    'Somewhere st. NY, NY, 12345',
    '234-234-2345',
    '1414-1414-1414-1414 01/14 222'
);
INSERT INTO customer(
    first_name,
    last_name,
    "address",
    phone_number,
    billing_info
)
VALUES(
    'Homer',
    'Whatshisname',
    '423 Crossroad ln., Springfield, CT, 32323',
    '525-679-8765',
    '4141-4141-4141-4141 12/12 111'
);
INSERT INTO customer(
    first_name,
    last_name,
    "address",
    phone_number,
    billing_info
)
VALUES(
    'Ed',
    'Boy',
    'Cul Du Sac St., Los Angelos, CA, 22222',
    '322-525-6477',
    '1414-1414-1414-1414 01/14 222'
);
-- DEALERSHIP THERE IS ONLY ONE BECAUSE WE DECIDED THIS WAS USELESS UNLESS THE PERSON OWNED MANY
-- KINDA KEPT IT ANYWAY
INSERT INTO dealership(
    "name",
    "address",
    phone_number
)
VALUES(
    'Big Johns Wheels on Wheels Emporium',
    '555 Buy My Cars Ln., Seattle, WA, 12322',
    '626-222-2412'
);
-- SALESPERSON
INSERT INTO salesperson(
    first_name,
    last_name
)
VALUES(
    'Big',
    'John'
);
INSERT INTO salesperson(
    first_name,
    last_name
)
VALUES(
    'Tony',
    'Bigpizza'
);
-- MECHANIC
INSERT INTO mechanic(
    first_name,
    last_name
)
VALUES(
    'Little',
    'John'
);
INSERT INTO mechanic(
    first_name,
    last_name
)
VALUES(
    'Crusty',
    'Old Dude'
);
-- CARS
INSERT INTO cars(
    make,
    model,
    "year",
    miles,
    "new/used",
    sales_id,
    amount,
    "owner",
    color
)
VALUES(
    'Jeep',
    'Cherokee',
    2021,
    0,
    'new',
    17,
    40000.00,
    'dealer',
    'Blue'
);

INSERT INTO cars(
    make,
    model,
    "year",
    miles,
    "new/used",
    owner,
    customer_id,
    color
)
VALUES(
    'Dodge',
    'Durango',
    2012,
    400.00,
	'used',
    'customer',
    38,
    'red'
);
INSERT INTO cars(
    make,
    model,
    "year",
    miles,
    "new/used",
    sales_id,
    amount,
    owner,
    color
)
VALUES(
    'BMW',
    'M3',
    2023,
    0,
    'new',
    17,
    5000.00,
    'dealer',
    'Pink'
);
INSERT INTO cars(
    make,
    model,
    "year",
    miles,
    "new/used",
    sales_id,
    amount,
    owner,
    color

)
VALUES(
    'Bugatti',
    'Turo',
    1980,
    150,
    'used',
    18,
    99999.00,
    'dealer',
    'black'
);
-- INVOICE
INSERT INTO invoice(
    "date",
    sales_id,
    customer_id,
    car_id,
    dealer_id,
    amount
)
VALUES(
    'January 21, 2023',
    18,
    38,
    26,
    9,
    40000.00
);
INSERT INTO invoice(
    "date",
    sales_id,
    customer_id,
    car_id,
    dealer_id,
    amount
)
VALUES(
    'February 11, 2021',
    18,
    39,
    41,
    9,
    5000.00
);
INSERT INTO invoice(
    "date",
    sales_id,
    customer_id,
    car_id,
    dealer_id,
    amount
)
VALUES(
    'March 99, 1232',
    18,
    40,
    42,
    9,
    99999.00
);
-- SERVICE
INSERT INTO service(
    "type",
    customer_id,
    car_id,
    dealer_id,
    mechanic_id,
    "date",
    amount
)
VALUES(
    'repair',
    37,
    40,
    9,
    17,
    'January 23,2020',
    40.00
);
INSERT INTO service(
    "type",
    customer_id,
    car_id,
    dealer_id,
    mechanic_id,
    "date",
    amount
)
VALUES(
    'maintenance',
    39,
    41,
    9,
    18,
    'January 23,2020',
    6000.00
);

CREATE OR REPLACE PROCEDURE customer_add(
    f VARCHAR(50),
    l VARCHAR(50),
    addy VARCHAR(150),
    phone VARCHAR(12),
    b VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO customer(
    first_name,
    last_name,
    "address",
    phone_number,
    billing_info
)
VALUES(
	f,
    l,
    addy,
    phone,
    b	
);
END;
$$
CALL customer_add('Helga','Buchemi','Workout Way., Berlin,Germany, 1111', '111-111-1111', '1414-1414-1414-1414 01/14 222')
SELECT * FROM customer
CREATE OR REPLACE PROCEDURE invoice(
	invoice_number INTEGER,
	tax DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Add late fee to customer payment amount
	UPDATE invoice
	SET amount = amount / tax
	WHERE invoice_number = invoice_id;
	
	-- Commit the above statement inside of a transaction
	COMMIT;
	
END;
$$
SELECT * FROM invoice
CALL invoice(39 ,0.01)