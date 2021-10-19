-- Create New Table PlantConstraints
CREATE TABLE PlantConstraints (
	Plant_Code  	VARCHAR2(26),
	Cost_Per_Unit 	NUMBER(38),
	Daily_Capacity  NUMBER(38),
	Product_ID 	    NUMBER(38),
	Customer 	    VARCHAR(26),
	Ports 		    VARCHAR(26)
	);

-- Insert Into PlantConstraints Table Data From WhCosts
INSERT INTO PlantConstraints (PlantConstraints.Plant_Code, PlantConstraints.Cost_Per_Unit)
SELECT WhCosts.Plant_Code, WhCosts.Cost_Per_Unit
FROM WhCosts;

-- Insert Into PlantConstraints Table Data From WhCapacities
INSERT INTO PlantConstraints(PlantConstraints.Plant_Code, PlantConstraints.Daily_Capacity)
SELECT WhCapacities.Plant_Code, WhCapacities.Daily_Capacity
FROM WhCapacities;

-- Insert Into PlantConstraints Table Data From VmiCustomers
INSERT INTO PlantConstraints (PlantConstraints.Plant_Code, PlantConstraints.Customer)
SELECT VmiCustomers.Plant_Code, VmiCustomers.Customer
FROM VmiCustomers;

-- Insert Into PlantConstraints Table Data From ProductsPerPlant
INSERT INTO PlantConstraints (PlantConstraints.Plant_Code, PlantConstraints.Product_ID)
SELECT ProductsPerPlant.Plant_Code, ProductsPerPlant.Product_ID
FROM ProductsPerPlant;

-- Insert Into PlantConstraints Table Data From PlantPorts
INSERT INTO PlantConstraints (PlantConstraints.Plant_Code, PlantConstraints.Ports)
SELECT PlantPorts.Plant_Code, PlantPorts.Ports
FROM PlantPorts;

-- Create a Sequence to Generate the Numbers
CREATE SEQUENCE Seq_X
START WITH 1
INCREMENT BY 1;

-- Add New Column to Table
ALTER TABLE PlantConstraints
ADD (PlantCode_Constraint_ID NUMBER(38));

-- Populate the New Column
UPDATE PlantConstraints
SET PlantCode_Constraint_ID = Seq_X.NEXTVAL;

-- Drop The Old Tables
DROP TABLE WhCosts;
DROP TABLE WhCapacities;
DROP TABLE VmiCustomers;
DROP TABLE ProductsPerPlant;
DROP TABLE PlantPorts;

-- Add New Column to Table
ALTER TABLE FreightRates
ADD (Freight_Rates_ID NUMBER(38));

-- Populate the New Column
UPDATE FreightRates
SET Freight_Rates_ID = Seq_X.NEXTVAL;

-- Create PlantProdCust Table
CREATE TABLE PlantProdCust (
	PlantProdCust_ID    NUMBER(38),
	Plant_Code 		    VARCHAR2(26),
	Product_ID 		    NUMBER(38),
	Customer 		    VARCHAR2(26)
	);

-- Insert OrderList Data Into PlantProdCust Table
INSERT INTO PlantProdCust (PlantProdCust.Plant_Code, PlantProdCust.Product_ID, PlantProdCust.Customer)
SELECT OrderList.Plant_Code, OrderList.Product_ID, OrderList.Customer
FROM OrderList;

-- Insert PlantConstraints Data Into PlantProdCust Table
INSERT INTO PlantProdCust (PlantProdCust.Plant_Code, PlantProdCust.Product_ID, PlantProdCust.Customer)
SELECT PlantConstraints.Plant_Code, PlantConstraints.Product_ID, PlantConstraints.Customer
FROM PlantConstraints;

-- Replace NULL Values in PlantProdCust.Product_ID, PlantProdCust.Customer, PlantConstraints.Product_ID, PlantConstraints.Customer With The Numeric Value 0
UPDATE PlantProdCust SET Product_ID=0 WHERE Product_ID IS NULL;
UPDATE PlantProdCust SET Customer=0 WHERE Customer IS NULL;
UPDATE PlantConstraints SET Customer=0 WHERE Customer IS NULL;
UPDATE PlantConstraints SET Product_ID=0 WHERE Product_ID IS NULL;

-- Remove Duplicate Rows in PlantProdCust
DELETE FROM PlantProdCust A WHERE ROWID NOT IN ( 
	SELECT 	MAX(ROWID)
	FROM 	PlantProdCust B
	WHERE 	A.Plant_Code = B.Plant_Code
	AND 	A.Product_ID = B.Product_ID
	AND 	A.Customer = B.Customer
	);

-- Populate The Primary Key Column
UPDATE PlantProdCust SET PlantProdCust_ID = Seq_X.NEXTVAL;

-- Add PlantProdCust_ID to OrderList
ALTER TABLE OrderList
ADD PlantProdCust_ID NUMBER(38);

-- Populate Foreign Key in OrderList Correctly
UPDATE OrderList A
SET A.PlantProdCust_ID = (
	SELECT 	PlantProdCust_ID
	FROM 	PlantProdCust B
	WHERE 	A.Plant_Code=B.Plant_Code
	AND 	A.Product_ID=B.Product_ID
	AND 	A.Customer=B.Customer );

-- Drop Plant_Code, Product_ID, & Customer Columns From OrderList
ALTER TABLE OrderList DROP COLUMN Plant_Code;
ALTER TABLE OrderList DROP COLUMN Product_ID;
ALTER TABLE OrderList DROP COLUMN Customer;

-- Add PlantProdCust_ID to PlantConstraints
ALTER TABLE PlantConstraints
ADD PlantProdCust_ID NUMBER(38);

-- Populate Foreign Key in PlantConstraints Correctly
UPDATE PlantConstraints A
SET A.PlantProdCust_ID = (
	SELECT PlantProdCust_ID
	FROM PlantProdCust B
	WHERE A.Plant_Code=B.Plant_Code
	AND A.Product_ID=B.Product_ID
	AND A.Customer=B.Customer );

-- Drop Plant_Code, Product_ID, & Customer Columns From PlantConstraints
ALTER TABLE PlantConstraints DROP COLUMN Plant_Code;
ALTER TABLE PlantConstraints DROP COLUMN Product_ID;
ALTER TABLE PlantConstraints DROP COLUMN Customer;

-- Create PortCarrier Table
CREATE TABLE PortCarrier (
	PortCarrier_ID 	NUMBER(38),
	Carrier 		VARCHAR2(26),
	Orig_Port 	VARCHAR2(26),
	Dest_Port 	VARCHAR2(26),
	Service_Level	VARCHAR2(26)
	);

-- Insert OrderList Data Into PortCarrier Table
INSERT INTO PortCarrier (PortCarrier.Carrier, PortCarrier.Orig_Port, PortCarrier.Dest_Port, PortCarrier.Service_Level)
SELECT OrderList.Carrier, OrderList.Orig_Port, OrderList.Dest_Port, OrderList.Service_Level 
FROM OrderList;

-- Insert FreightRates Data Into PortCarrier Table
INSERT INTO PortCarrier (PortCarrier.Carrier, PortCarrier.Orig_Port, PortCarrier.Dest_Port, PortCarrier.Service_Level)
SELECT FreightRates.Carrier, FreightRates.Orig_Port, FreightRates.Dest_Port, FreightRates.Service_Level
FROM FreightRates;

-- Remove Duplicate Rows in PortCarrier
DELETE FROM PortCarrier A WHERE ROWID NOT IN ( 
	SELECT MAX(ROWID)
	FROM PortCarrier B
	WHERE A.Carrier = B.Carrier
	AND A.Orig_Port = B.Orig_Port
	AND A.Dest_Port = B.Dest_Port
	AND A.Service_Level = B.Service_Level
	);

-- Populate The Primary Key Column
UPDATE PortCarrier SET PortCarrier_ID = Seq_X.NEXTVAL;

-- Add PortCarrier_ID to OrderList
ALTER TABLE OrderList
ADD PortCarrier_ID NUMBER(38);

-- Populate Foreign Key in OrderList Correctly
UPDATE OrderList A
SET A.PortCarrier_ID = (
	SELECT PortCarrier_ID
	FROM PortCarrier B
	WHERE A.Carrier=B.Carrier
	AND A.Orig_Port=B.Orig_Port
	AND A.Dest_Port=B.Dest_Port
	AND A.Service_Level=B.Service_Level
);

-- Drop Carrier, Orig_Port, Service_Level & Dest_Port Columns From OrderList
ALTER TABLE OrderList 		DROP COLUMN Orig_Port;
ALTER TABLE OrderList 		DROP COLUMN Dest_Port;
ALTER TABLE OrderList 		DROP COLUMN Carrier;
ALTER TABLE OrderList		DROP COLUMN Service_Level;

-- Add PortCarrier_ID to FreightRates
ALTER TABLE FreightRates
ADD PortCarrier_ID NUMBER(38);

-- Populate Foreign Key in FreightRates Correctly
UPDATE FreightRates A
SET A.PortCarrier_ID = (
	SELECT PortCarrier_ID
	FROM PortCarrier B
	WHERE A.Carrier=B.Carrier
	AND A.Orig_Port=B.Orig_Port
	AND A.Dest_Port=B.Dest_Port 
	AND A.Service_Level=B.Service_Level
);

-- Drop Carrier, Orig_Port, Service_Level & Dest_Port Columns From OrderList
ALTER TABLE FreightRates DROP COLUMN Orig_Port;
ALTER TABLE FreightRates DROP COLUMN Dest_Port;
ALTER TABLE FreightRates DROP COLUMN Carrier;
ALTER TABLE FreightRates DROP COLUMN Service_Level;

-- Create Fact Table
CREATE TABLE FactTable (
	PlantCode_Constraint_ID 	NUMBER(38),
	Order_ID 		            NUMBER(38),
	Freight_Rates_ID 		    NUMBER(38),
	PortCarrier_ID		        NUMBER(38),
	PlantProdCust_ID		    NUMBER(38),
	Min_Weight_Quant 		    NUMBER(38),
	Max_Weight_Quant 		    NUMBER(38),
	Min_Cost 		            NUMBER(38),
	Rate 			            NUMBER(38),
	TPT_Day_Count 		        NUMBER(38),
	Cost_Per_Unit 		        NUMBER(38),
	Daily_Capacity 		        NUMBER(38),
	Ship_Ahead_Day_Count 	    NUMBER(38),
	Ship_Late_Day_Count 	    NUMBER(38),
	Unit_Quant 		            NUMBER(38),
	Weight 			            NUMBER(38)
	);

-- Insert Into FactTable Data From FreightRates
INSERT INTO FactTable (FactTable.Freight_Rates_ID, FactTable.Min_Weight_Quant, FactTable.Max_Weight_Quant, FactTable.Min_Cost, FactTable.Rate, FactTable.TPT_Day_Count)
SELECT FreightRates.Freight_Rates_ID, FreightRates.Min_Weight_Quant, FreightRates.Max_Weight_Quant, FreightRates.Min_Cost, FreightRates.Rate, FreightRates.TPT_Day_Count
FROM FreightRates;

-- Insert Into FactTable Data From PlantConstraints
INSERT INTO FactTable (FactTable.PlantCode_Constraint_ID, FactTable.Cost_Per_Unit, FactTable.Daily_Capacity)
SELECT PlantConstraints.PlantCode_Constraint_ID, PlantConstraints.Cost_Per_Unit, PlantConstraints.Daily_Capacity
FROM PlantConstraints;

-- Insert Into FactTable Data From OrderList
INSERT INTO FactTable (FactTable.Order_ID, FactTable.Ship_Ahead_Day_Count, FactTable.Ship_Late_Day_Count, FactTable.Unit_Quant, FactTable.Weight, FactTable.TPT_Day_Count)
SELECT OrderList.Order_ID, OrderList.Ship_Ahead_Day_Count, OrderList.Ship_Late_Day_Count, OrderList.Unit_Quant, OrderList.Weight, OrderList.TPT_Day_Count
FROM OrderList;

-- Insert Into FactTable Foreign Key From PlantProdCust 
INSERT INTO FactTable (FactTable.PlantProdCust_ID)
SELECT PlantProdCust.PlantProdCust_ID
FROM PlantProdCust;

-- Insert Into FactTable Foreign Key From PortCarrier 
INSERT INTO FactTable (FactTable.PortCarrier_ID)
SELECT PortCarrier.PortCarrier_ID
FROM PortCarrier;

-- Dropping Columns
ALTER TABLE FreightRates DROP (Min_Weight_Quant, Max_Weight_Quant, Min_Cost, Rate, TPT_Day_Count); ALTER TABLE PlantConstraints DROP (Cost_Per_Unit, Daily_Capacity);
ALTER TABLE OrderList DROP (TPT_Day_Count, Ship_Ahead_Day_Count, Ship_Late_Day_Count, Unit_Quant, Weight);


-- Set The Primary Keys
ALTER TABLE FreightRates 		ADD PRIMARY KEY 	(Freight_Rates_ID);
ALTER TABLE PlantConstraints	ADD PRIMARY KEY 	(PlantCode_Constraint_ID);
ALTER TABLE PortCarrier		    ADD PRIMARY KEY 	(PortCarrier_ID);
ALTER TABLE OrderList		    ADD PRIMARY KEY 	(Order_ID);
ALTER TABLE PlantProdCust		ADD PRIMARY KEY 	(PlantProdCust_ID);

-- Set The Foreign Keys in The FactTable
ALTER TABLE FactTable
ADD FOREIGN KEY (PlantProdCust_ID)
REFERENCES PlantProdCust(PlantProdCust_ID);

ALTER TABLE FactTable
ADD FOREIGN KEY (PortCarrier_ID)
REFERENCES PortCarrier(PortCarrier_ID);

ALTER TABLE FactTable
ADD FOREIGN KEY (PlantCode_Constraint_ID)
REFERENCES PlantConstraints(PlantCode_Constraint_ID);

ALTER TABLE FactTable
ADD FOREIGN KEY (Order_ID)
REFERENCES OrderList(Order_ID)
ENABLE NOVALIDATE;

ALTER TABLE FactTable
ADD FOREIGN KEY (Freight_Rates_ID)
REFERENCES FreightRates(Freight_Rates_ID);

-- Set The Foreign Keys in The Dimension Tables
ALTER TABLE FreightRates
ADD FOREIGN KEY (PortCarrier_ID)
REFERENCES PortCarrier(PortCarrier_ID);

ALTER TABLE PlantConstraints
ADD FOREIGN KEY (PlantProdCust_ID)
REFERENCES PlantProdCust(PlantProdCust_ID);

ALTER TABLE OrderList
ADD FOREIGN KEY (PortCarrier_ID)
REFERENCES PortCarrier(PortCarrier_ID);

ALTER TABLE OrderList
ADD FOREIGN KEY (PlantProdCust_ID)
REFERENCES PlantProdCust(PlantProdCust_ID);