-- Add New Column to Table
ALTER TABLE FreightRates
ADD (Freight_Rates_ID NUMBER(38));

-- Populate the New Column
UPDATE FreightRates
SET Freight_Rates_ID = Seq_X.NEXTVAL;
