--------------------------------------------------------
--  Ref Constraints for Table PLANTPRODCUST
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."PLANTPRODCUST" ADD FOREIGN KEY ("PLANT_LOCATION_ID")
	  REFERENCES "JAREDBACH"."PLANT_LOCATIONS" ("PLANT_LOCATION_ID") ENABLE;
