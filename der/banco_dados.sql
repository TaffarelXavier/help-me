
CREATE TABLE Cities
(
    city_id VARCHAR(10) PRIMARY KEY,
    city_name VARCHAR(10),
    uf_id VARCHAR(10)
)

CREATE TABLE Companies
(
    company_id VARCHAR(10) PRIMARY KEY,
    fantasy_name VARCHAR(10),
    cnpj VARCHAR(10),
    logo VARCHAR(10),
    address_id VARCHAR(10),
    user_id VARCHAR(10)
)

CREATE TABLE Categories
(
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(10)
)

CREATE TABLE Products
(
    product_id VARCHAR(10) PRIMARY KEY,
    description VARCHAR(10),
    image VARCHAR(10),
    name VARCHAR(10),
    company_id VARCHAR(10),
    category_id VARCHAR(10),
    stock_id VARCHAR(10),
    FOREIGN KEY(company_id) REFERENCES Companies (company_id),
    FOREIGN KEY(category_id) REFERENCES Categories (category_id)
)

CREATE TABLE Stocks
(
    stock_id VARCHAR(10) PRIMARY KEY,
    price VARCHAR(10),
    amout VARCHAR(10),
    measure_type VARCHAR(10),
    product_id VARCHAR(10)
)

CREATE TABLE Users
(
    user_id VARCHAR(10) PRIMARY KEY,
    user_name VARCHAR(10),
    user_password VARCHAR(10),
    token VARCHAR(10),
    city_id VARCHAR(10),
    address_id VARCHAR(10),
    FOREIGN KEY(city_id) REFERENCES Cities (city_id)
)

CREATE TABLE Contacts
(
    contact_id VARCHAR(10) PRIMARY KEY,
    number_phone VARCHAR(10),
    company_id VARCHAR(10),
    user_id VARCHAR(10),
    FOREIGN KEY(company_id) REFERENCES Companies (company_id),
    FOREIGN KEY(user_id) REFERENCES Users (user_id)
)

CREATE TABLE Requests
(
    request_id VARCHAR(10) PRIMARY KEY,
    date VARCHAR(10),
    user_id VARCHAR(10),
    company_id VARCHAR(10),
    FOREIGN KEY(user_id) REFERENCES Users (user_id),
    FOREIGN KEY(company_id) REFERENCES Companies (company_id)
)

CREATE TABLE Itens_Request
(
    item_request_id VARCHAR(10) PRIMARY KEY,
    request_id VARCHAR(10),
    product_id VARCHAR(10),
    FOREIGN KEY(request_id) REFERENCES Requests (request_id),
    FOREIGN KEY(product_id) REFERENCES Products (product_id)
)

CREATE TABLE UFs
(
    uf_id VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(10)
)

CREATE TABLE Address
(
    address_id VARCHAR(10) PRIMARY KEY,
    type_user VARCHAR(10),
    district VARCHAR(10),
    number VARCHAR(10),
    street VARCHAR(10)
)

ALTER TABLE Cities ADD FOREIGN KEY(uf_id) REFERENCES UFs (uf_id)
ALTER TABLE Companies ADD FOREIGN KEY(address_id) REFERENCES Address (address_id)
ALTER TABLE Companies ADD FOREIGN KEY(user_id) REFERENCES Users (user_id)
ALTER TABLE Products ADD FOREIGN KEY(stock_id) REFERENCES Stocks (stock_id)
ALTER TABLE Users ADD FOREIGN KEY(address_id) REFERENCES Address (address_id)
