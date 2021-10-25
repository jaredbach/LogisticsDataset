--------------------------------------------------------
--  Ref Constraints for Table PLANT_LOCATIONS
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."PLANT_LOCATIONS" ADD FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "JAREDBACH"."LOCATIONS" ("LOCATION_ID") ENABLE;
