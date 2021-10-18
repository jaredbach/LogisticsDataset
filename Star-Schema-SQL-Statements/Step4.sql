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
