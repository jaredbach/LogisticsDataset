--------------------------------------------------------
--  Ref Constraints for Table DEST_PORT_LOCATIONS
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."DEST_PORT_LOCATIONS" ADD FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "JAREDBACH"."LOCATIONS" ("LOCATION_ID") ENABLE;
