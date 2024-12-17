CREATE TABLE Client_Types 
(
    client_type_id SERIAL PRIMARY KEY,
    client_type VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Clients
(
    client_id SERIAL PRIMARY KEY,
    client_type_id INTEGER REFERENCES Client_Types (client_type_id) ON DELETE SET NULL
);

CREATE TABLE B2B_Clients
(
    client_id INTEGER REFERENCES Clients (client_id) ON DELETE CASCADE,
    b2b_client_name VARCHAR(255) NOT NULL,
    TIN VARCHAR(12) NOT NULL UNIQUE,
    PRIMARY KEY (client_id)
);


CREATE TABLE B2C_Clients
(
    client_id INTEGER REFERENCES Clients (client_id) ON DELETE CASCADE,
    b2c_client_first_name VARCHAR(50) NOT NULL,
    b2c_client_last_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (client_id)
);

CREATE TABLE Client_Contacts
(
	client_id INTEGER REFERENCES Clients (client_id) ON DELETE CASCADE,
	client_phone VARCHAR(11) NOT NULL UNIQUE,
	client_email VARCHAR(255) UNIQUE,
	PRIMARY KEY (client_id)
);

CREATE TABLE Partners
(
	partner_id SERIAL PRIMARY KEY,
	partner_name VARCHAR(255) NOT NULL
);

CREATE TABLE Contracts
(
	contract_id SERIAL PRIMARY KEY,
	partner_id INTEGER NOT NULL REFERENCES Partners (partner_id) ON DELETE CASCADE,
	conclusion_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Partner_Contacts
(
	partner_id INTEGER NOT NULL REFERENCES Partners (partner_id) ON DELETE CASCADE,
	partner_phone VARCHAR(11) NOT NULL UNIQUE,
	partner_email VARCHAR(255) UNIQUE,
	PRIMARY KEY (partner_id)
);

CREATE TABLE Cargo_Types
(
	cargo_type_id SERIAL PRIMARY KEY,
	cargo_type VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Cargos 
(
	cargo_id SERIAL PRIMARY KEY,
	weight NUMERIC(6, 2) NOT NULL CHECK (weight > 0),
	volume NUMERIC(6, 2) NOT NULL CHECK (volume > 0),
	cargo_type_id INTEGER REFERENCES Cargo_Types (cargo_type_id) ON DELETE SET NULL
);

CREATE TABLE Cities 
(
	city_id SERIAL PRIMARY KEY,
	city VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Stores
(
	store_id SERIAL PRIMARY KEY,
	city_id INTEGER REFERENCES Cities (city_id) ON DELETE SET NULL
);

CREATE TABLE Reserves
(
	reserve_id SERIAL PRIMARY KEY,
	store_id INTEGER NOT NULL REFERENCES Stores (store_id) ON DELETE CASCADE,
	cargo_type_id INTEGER REFERENCES Cargo_Types (cargo_type_id) ON DELETE SET NULL,
	reserve_quantity INTEGER NOT NULL CHECK (reserve_quantity >= 0)
);

CREATE TABLE Transport_Types
(
	transport_type_id SERIAL PRIMARY KEY,
	transport_type VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Transport_Statuses
(
	transport_status_id SERIAL PRIMARY KEY,
	transport_status VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Transports
(
	transport_id SERIAL PRIMARY KEY,
	registration VARCHAR(8) NOT NULL UNIQUE,
	transport_type_id INTEGER REFERENCES Transport_Types (transport_type_id) ON DELETE SET NULL,
	transport_status_id INTEGER REFERENCES Transport_Statuses (transport_status_id) ON DELETE SET NULL
);

CREATE TABLE Service_Schedule
(
	service_schedule_id SERIAL PRIMARY KEY,
	transport_id INTEGER NOT NULL REFERENCES Transports (transport_id) ON DELETE CASCADE,
	service_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Order_Groups 
(
	order_group_id SERIAL PRIMARY KEY,
	transport_id INTEGER REFERENCES Transports (transport_id) ON DELETE SET NULL
);

CREATE TABLE Orders
(
	order_id SERIAL PRIMARY KEY,
	client_id INTEGER NOT NULL REFERENCES Clients (client_id) ON DELETE CASCADE,
	reciever_id INTEGER REFERENCES Stores (store_id) ON DELETE SET NULL,
	sender_id INTEGER REFERENCES Stores (store_id) ON DELETE SET NULL,
	group_id INTEGER REFERENCES Order_Groups (order_group_id) ON DELETE SET NULL,
	order_cost NUMERIC(10, 2) NOT NULL CHECK (order_cost > 0),
	CHECK (reciever_id <> sender_id)
);

CREATE TABLE Pavement_Logs
(
	pavement_log_id SERIAL PRIMARY KEY,
	order_id INTEGER NOT NULL REFERENCES Orders (order_id) ON DELETE CASCADE,
	amount NUMERIC(10, 2) NOT NULL CHECK (amount > 0),
	pavement_date DATE DEFAULT CURRENT_DATE,
	pavement_time TIME DEFAULT CURRENT_TIME
);

CREATE TABLE Route
(
	route_id SERIAL PRIMARY KEY,
	group_id INTEGER NOT NULL REFERENCES Order_Groups (order_group_id) ON DELETE CASCADE,
	city_id INTEGER REFERENCES Cities (city_id) ON DELETE SET NULL,
	arrival_date DATE DEFAULT CURRENT_DATE,
	arrival_time TIME DEFAULT CURRENT_TIME
);

CREATE TABLE Order_Statuses
(
	order_status_id SERIAL PRIMARY KEY,
	order_status VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Order_Status_Logs
(
	order_status_log_id SERIAL PRIMARY KEY,
	order_id INTEGER NOT NULL REFERENCES Orders (order_id) ON DELETE CASCADE,
	order_status_id INTEGER REFERENCES Order_Statuses (order_status_id) ON DELETE SET NULL,
	order_status_date DATE DEFAULT CURRENT_DATE,
	order_status_time TIME DEFAULT CURRENT_TIME
);


