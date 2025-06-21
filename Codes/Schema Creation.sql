-- List all databases in the SQL Server instance
SELECT name, database_id, state_desc
FROM sys.databases;

-- Table: Customers
CREATE TABLE Customers (
    CustomerKey INT PRIMARY KEY,            -- Primary key to identify customers
    Gender VARCHAR(10),                     -- Customer gender
    Name VARCHAR(100),                      -- Customer full name
    City VARCHAR(50),                       -- Customer city
    StateCode VARCHAR(10),                  -- Customer state (abbreviated)
    State VARCHAR(50),                      -- Customer state (full)
    ZipCode VARCHAR(20),                    -- Customer zip code
    Country VARCHAR(50),                    -- Customer country
    Continent VARCHAR(50),                  -- Customer continent
    Birthday DATE                           -- Customer date of birth
);

-- Table: Products
CREATE TABLE Products (
    ProductKey INT PRIMARY KEY,             -- Primary key to identify products
    ProductName VARCHAR(100),               -- Product name
    Brand VARCHAR(50),                      -- Product brand
    Color VARCHAR(20),                      -- Product color
    UnitCostUSD FLOAT,                      -- Cost to produce the product in USD
    UnitPriceUSD FLOAT,                     -- Product list price in USD
    SubcategoryKey INT,                     -- Key to identify product subcategories
    Subcategory VARCHAR(50),                -- Product subcategory name
    CategoryKey INT,                        -- Key to identify product categories
    Category VARCHAR(50)                    -- Product category name
);

-- Table: Stores
CREATE TABLE Stores (
    StoreKey INT PRIMARY KEY,               -- Primary key to identify stores
    Country VARCHAR(50),                    -- Store country
    State VARCHAR(50),                      -- Store state
    SquareMeters INT,                       -- Store footprint in square meters
    OpenDate DATE                           -- Store open date
);

-- Table: ExchangeRates
CREATE TABLE ExchangeRates (
    [Date] DATE,                            -- Date
    Currency VARCHAR(10),                   -- Currency code
    ExchangeRate FLOAT                      -- Exchange rate compared to USD
);

-- Table: Sales
CREATE TABLE Sales (
    OrderNumber INT,                        -- Unique ID for each order
    LineItem INT,                           -- Identifies individual products purchased as part of an order
    OrderDate DATE,                         -- Date the order was placed
    DeliveryDate DATE,                      -- Date the order was delivered
    CustomerKey INT,                        -- Unique key identifying which customer placed the order
    StoreKey INT,                           -- Unique key identifying which store processed the order
    ProductKey INT,                         -- Unique key identifying which product was purchased
    Quantity INT,                           -- Number of items purchased
    CurrencyCode VARCHAR(10),               -- Currency used to process the order
    PRIMARY KEY (OrderNumber, LineItem),
    FOREIGN KEY (CustomerKey) REFERENCES Customers(CustomerKey),
    FOREIGN KEY (StoreKey) REFERENCES Stores(StoreKey),
    FOREIGN KEY (ProductKey) REFERENCES Products(ProductKey)
);
