--TABLES CREATION:

CREATE TABLE orders (
    row_id int PRIMARY KEY NOT NULL,
    order_id varchar(10)   NOT NULL,
    created_at timestamp   NOT NULL,
    item_id varchar(10)   NOT NULL,
    quantity int  NOT NULL,
    cust_id varchar(10)  NOT NULL,
    delivery boolean   NOT NULL,
    addr_id varchar(10)  NOT NULL
	FOREIGN KEY(item_id) REFERENCES item(item_id),
	FOREIGN KEY(cust_id) REFERENCES item(cust_id),
	FOREIGN KEY(addr_id) REFERENCES item(addr_id),
	FOREIGN KEY(created_at) REFERENCES rota(rota_date)
);

CREATE TABLE customers (
    cust_id varchar(10) PRIMARY KEY NOT NULL,
    cust_firstName varchar(50)   NOT NULL,
    cust_lastName varchar(50)   NOT NULL
);

CREATE TABLE address (
    addr_id varchar(10) PRIMARY KEY NOT NULL,
    delivery_address1 varchar(200)   NOT NULL,
    delivery_address2 varchar(200)   NULL,
    delivery_city varchar(50)   NOT NULL,
    delivery_zipcode varchar(20)   NOT NULL
);

CREATE TABLE item (
    item_id varchar(10) PRIMARY KEY NOT NULL,
    sku varchar(20)   NOT NULL,
    item_name varchar(50)   NOT NULL,
    item_category varchar(100)   NOT NULL,
    item_size varchar(15)   NOT NULL,
    item_price decimal(10,2)  NOT NULL,
	FOREIGN KEY(sku) REFERENCES recipe(recipe_id)
);

CREATE TABLE ingredient (
    ing_id varchar(15) PRIMARY KEY NOT NULL,
    ing_name varchar(200)   NOT NULL,
    ing_weight int  NOT NULL,
    ing_meas varchar(20)   NOT NULL,
    ing_price decimal(10,2)   NOT NULL
);

CREATE TABLE inventory (
    inv_id varchar(15) PRIMARY KEY NOT NULL,
    ingred_id varchar(20)   NOT NULL,
    quantity int  NOT NULL
);

CREATE TABLE shift (
    shift_id varchar(20) PRIMARY KEY NOT NULL,
    day_of_week varchar(15)   NOT NULL,
    start_time time  NOT NULL,
    end_time time  NOT NULL
);

CREATE TABLE staff (
    staff_id varchar(20) PRIMARY KEY NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    post varchar(100)   NOT NULL,
    hourly_rate decimal(10,2)  NOT NULL
);

CREATE TABLE recipe (
    row_id int PRIMARY KEY NOT NULL,
    recipe_id varchar(20)   NOT NULL,
    ingred_id varchar(20)   NOT NULL,
    quantity int  NOT NULL,
	FOREIGN KEY(ingred_id) REFERENCES ingredient(ing_id),
	FOREIGN KEY(ingred_id) REFERENCES inventory(ingred_id)
);

CREATE TABLE rota (
    row_id int PRIMARY KEY NOT NULL,
    rota_id varchar(20)   NOT NULL,
    rota_date timestamp   NOT NULL,
    shift_id varchar(20)   NOT NULL,
    staff_id varchar(20)   NOT NULL,
	FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
	FOREIGN KEY(shift_id) REFERENCES shift(shift_id)
);



