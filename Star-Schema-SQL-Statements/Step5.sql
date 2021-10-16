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
