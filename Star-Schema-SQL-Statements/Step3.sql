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
	SELECT MAX(ROWID)
	FROM PlantProdCust B
	WHERE A.Plant_Code = B.Plant_Code
	AND A.Product_ID = B.Product_ID
	AND A.Customer = B.Customer
	);

-- Populate The Primary Key Column
UPDATE PlantProdCust SET PlantProdCust_ID = Seq_X.NEXTVAL;

-- Add PlantProdCust_ID to OrderList
ALTER TABLE OrderList
ADD PlantProdCust_ID NUMBER(38);

-- Populate Foreign Key in OrderList Correctly
UPDATE OrderList A
SET A.PlantProdCust_ID = (
	SELECT PlantProdCust_ID
	FROM PlantProdCust B
	WHERE A.Plant_Code=B.Plant_Code
	AND A.Product_ID=B.Product_ID
	AND A.Customer=B.Customer );

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




