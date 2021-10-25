--------------------------------------------------------
--  Ref Constraints for Table ORIG_PORT_LOCATIONS
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."ORIG_PORT_LOCATIONS" ADD FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "JAREDBACH"."LOCATIONS" ("LOCATION_ID") ENABLE;
