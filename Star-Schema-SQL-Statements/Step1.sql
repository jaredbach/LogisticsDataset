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
