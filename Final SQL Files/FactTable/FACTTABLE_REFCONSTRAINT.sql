--------------------------------------------------------
--  Ref Constraints for Table FACTTABLE
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("PLANTPRODCUST_ID")
	  REFERENCES "JAREDBACH"."PLANTPRODCUST" ("PLANTPRODCUST_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("PORTCARRIER_ID")
	  REFERENCES "JAREDBACH"."PORTCARRIER" ("PORTCARRIER_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("PLANTCODE_CONSTRAINT_ID")
	  REFERENCES "JAREDBACH"."PLANTCONSTRAINTS" ("PLANTCODE_CONSTRAINT_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("ORDER_ID")
	  REFERENCES "JAREDBACH"."ORDERLIST" ("ORDER_ID") ENABLE NOVALIDATE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("FREIGHT_RATES_ID")
	  REFERENCES "JAREDBACH"."FREIGHTRATES" ("FREIGHT_RATES_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "JAREDBACH"."LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("ORIG_PORT_LOCATION_ID")
	  REFERENCES "JAREDBACH"."ORIG_PORT_LOCATIONS" ("ORIG_PORT_LOCATION_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("DEST_PORT_LOCATION_ID")
	  REFERENCES "JAREDBACH"."DEST_PORT_LOCATIONS" ("DEST_PORT_LOCATION_ID") ENABLE;
  ALTER TABLE "JAREDBACH"."FACTTABLE" ADD FOREIGN KEY ("PLANT_LOCATION_ID")
	  REFERENCES "JAREDBACH"."PLANT_LOCATIONS" ("PLANT_LOCATION_ID") ENABLE;
