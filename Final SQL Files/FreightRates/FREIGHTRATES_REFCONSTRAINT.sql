--------------------------------------------------------
--  Ref Constraints for Table FREIGHTRATES
--------------------------------------------------------

  ALTER TABLE "JAREDBACH"."FREIGHTRATES" ADD FOREIGN KEY ("PORTCARRIER_ID")
	  REFERENCES "JAREDBACH"."PORTCARRIER" ("PORTCARRIER_ID") ENABLE;
