

-- Use the fertilizer_company database
USE fertilizer_company_dbms;

-- Create a table to store factories
CREATE TABLE IF NOT EXISTS factories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    revenue DECIMAL(12, 2) NOT NULL
);

-- Create a table to store customers
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    total_amount_bought DECIMAL(12, 2) NOT NULL
);


-- Create a table to store outlets
CREATE TABLE IF NOT EXISTS outlets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    owner VARCHAR(255) NOT NULL,
    sales_revenue DECIMAL(12, 2) NOT NULL
);

-- Create a table to store departments
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

-- Create a table to store employees
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary DECIMAL(12, 2) NOT NULL,
    age INT NOT NULL,
    role VARCHAR(255) NOT NULL,
    dept_id INT,
    fact_id INT,
    location VARCHAR(255),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (fact_id) REFERENCES factories(id)
);

-- Create a table to store categories of fertilizers
CREATE TABLE IF NOT EXISTS fertilizer_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    regulation VARCHAR(255) NOT NULL
);

-- Create a table to store categories of bills
CREATE TABLE IF NOT EXISTS bill_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL
);

-- Create a table to store bills
CREATE TABLE IF NOT EXISTS bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    cost DECIMAL(12, 2) NOT NULL,
    factory_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (factory_id) REFERENCES factories(id),
    FOREIGN KEY (category_id) REFERENCES bill_category(id)
);

-- Create a table to store fertilizers
CREATE TABLE IF NOT EXISTS fertilizers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cost_per_unit DECIMAL(10, 2) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES fertilizer_categories(id)
);


-- Create a table to store customer purchases
CREATE TABLE IF NOT EXISTS bought (
    customer_id INT,
    outlet_id INT,
    fertilizer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (outlet_id) REFERENCES outlets(id),
    FOREIGN KEY (fertilizer_id) REFERENCES fertilizers(id)
);

-- Create a table to store manufacturing relationships between factories and fertilizers
CREATE TABLE IF NOT EXISTS manufacture (
    factory_id INT,
    fertilizer_id INT,
    FOREIGN KEY (factory_id) REFERENCES factories(id),
    FOREIGN KEY (fertilizer_id) REFERENCES fertilizers(id)
);

-- Create a table to store sales
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    cost DECIMAL(12, 2) NOT NULL,
    factory_id INT NOT NULL,
    FOREIGN KEY (factory_id) REFERENCES factories(id)
);

-- Create a table to store sales and fertilizers relationship
CREATE TABLE IF NOT EXISTS sale_description (
    sale_id INT,
    fertilizer_id INT,
    PRIMARY KEY (sale_id, fertilizer_id),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (fertilizer_id) REFERENCES fertilizers(id)
);

CREATE TABLE dealer(id INT primary KEY,name VARCHAR(20));
ALTER TABLE dealer add reach VARCHAR(20);
ALTER  TABLE sale_description ADD dealer_id INT;
ALTER TABLE sale_description 
ADD CONSTRAINT fk_sale_description_sale_id
FOREIGN KEY (dealer_id) 
REFERENCES dealer(id);






