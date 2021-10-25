-- Step 6

-- Drop Order_Date from OrderList
ALTER TABLE OrderList DROP COLUMN Order_Date;

-- Step 7

-- Create New Column, Location_ID, in the FactTable
ALTER TABLE FactTable ADD Location_ID NUMBER(38);

-- Insert Into the FactTable Location IDs From Locations
INSERT INTO FactTable (FactTable.Location_ID)
SELECT Locations.Location_ID
FROM Locations;

-- Step 8

-- Create New Column, Location_ID, in PlantConstraints
ALTER TABLE PlantConstraints ADD Location_ID NUMBER(38);

-- Populate The Location_ID in PlantConstraints Correctly
UPDATE PlantConstraints A
SET A.Location_ID = (
	SELECT Location_ID
	FROM Locations B
	WHERE A.Ports=B.Port_OR_Plant
);

-- Create 2 New Columns, Orig_Location_ID & Dest_Location_ID, in PortCarrier
ALTER TABLE PortCarrier ADD Orig_Location_ID NUMBER(38);
ALTER TABLE PortCarrier ADD Dest_Location_ID NUMBER(38);

-- Populate The Orig_Location_ID in PortCarrier Correctly
UPDATE PortCarrier A
SET A.Orig_Location_ID = (
	SELECT Location_ID
	FROM Locations B
	WHERE A.Orig_Port=B.Port_OR_Plant
);

-- Populate The Dest_Location_ID in PortCarrier Correctly
UPDATE PortCarrier A
SET A.Dest_Location_ID = (
	SELECT Location_ID
	FROM Locations B
	WHERE A.Dest_Port=B.Port_OR_Plant
);

-- Create New Column, Location_ID, in PlantProdCust
ALTER TABLE PlantProdCust ADD Location_ID NUMBER(38);

-- Populate The Location_ID in PlantProdCust Correctly
UPDATE PlantProdCust A
SET A.Location_ID = (
	SELECT Location_ID
	FROM Locations B
	WHERE A.Plant_Code=B.Port_OR_Plant
);


-- Step 9

-- Drop Port_OR_Plant
ALTER TABLE LOCATIONS DROP COLUMN Port_OR_Plant;

-- Step 10

-- Create Month_Num, Month_Name, Quarter, & Year Columns in Table OrderList
ALTER TABLE OrderList ADD Order_Date DATE;
ALTER TABLE OrderList ADD Month_Num NUMBER(38);
ALTER TABLE OrderList ADD Month_Name VARCHAR2(26);
ALTER TABLE OrderList ADD Quarter NUMBER(38);
ALTER TABLE OrderList ADD Year_ NUMBER(38);

-- Insert Order_Date, Month_Num, Month_Name, Quarter, & Year Data From Table Dates Into Table OrderList
UPDATE OrderList A 
SET A.Order_Date = (SELECT Order_Date FROM Dates B WHERE A.Order_ID=B.Order_ID);

UPDATE OrderList A 
SET A.Month_Num = (SELECT Month_Num FROM Dates B WHERE A.Order_ID=B.Order_ID);

UPDATE OrderList A 
SET A.Month_Name = (SELECT Month_Name FROM Dates B WHERE A.Order_ID=B.Order_ID);

UPDATE OrderList A 
SET A.Quarter= (SELECT Quarter FROM Dates B WHERE A.Order_ID=B.Order_ID);

UPDATE OrderList A 
SET A.Year_ = (SELECT Year_ FROM Dates B WHERE A.Order_ID=B.Order_ID);

-- Rename Year_ Column to Year
ALTER TABLE ORDERLIST RENAME COLUMN YEAR_ TO YEAR;

-- Drop Dates Table
DROP TABLE DATES;

-- Step 11

-- Add New Column to PlantProdCust, Customers_SH (Short-Hand)
ALTER TABLE PlantProdCust ADD Customers_SH VARCHAR2(26);

-- Populate the Customers_SH Column
UPDATE PlantProdCust A SET A.Customers_SH = (SELECT Customers_SH FROM Customers_SH B WHERE A.Customer=B.Customers);

-- Drop the Customers_SH Table
DROP TABLE Customers_SH;

-- Step 12

-- Drop the Customer Column in PlantProdCust
ALTER TABLE PlantProdCust DROP COLUMN Customer;

-- Change The Name of the Customers_SH Column in the PlantProdCust Table to Customer
ALTER TABLE PlantProdCust RENAME COLUMN "CUSTOMERS_SH" to Customer;

-- Step 13
-- Set The Primary Key
ALTER TABLE Locations ADD PRIMARY KEY (Location_ID);

-- Set The Foreign Keys in PortCarrier
ALTER TABLE PortCarrier
ADD FOREIGN KEY (Orig_Location_ID)
REFERENCES Locations(Location_ID);

ALTER TABLE PortCarrier
ADD FOREIGN KEY (Dest_Location_ID)
REFERENCES Locations(Location_ID);

-- Set The Foreign Keys in PlantConstraints
ALTER TABLE PlantConstraints
ADD FOREIGN KEY (Location_ID)
REFERENCES Locations(Location_ID);

-- Set The Foreign Keys in PlantProdCust
ALTER TABLE PlantProdCust
ADD FOREIGN KEY (Location_ID)
REFERENCES Locations(Location_ID);

-- Set The Foreign Keys in FactTable
ALTER TABLE FactTable
ADD FOREIGN KEY (Location_ID)
REFERENCES Locations(Location_ID);