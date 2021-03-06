--------------------------------------------------------
--  File created - Wednesday-November-03-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PLANT_LOCATIONS
--------------------------------------------------------

  CREATE TABLE "JAREDBACH"."PLANT_LOCATIONS" 
   (	"PLANT_LOCATION_ID" NUMBER(38,0), 
	"PLANT_CODE" VARCHAR2(26 BYTE), 
	"PLANT_CITY" VARCHAR2(26 BYTE), 
	"PLANT_STATE_NAME" VARCHAR2(26 BYTE), 
	"PLANT_STATE" VARCHAR2(26 BYTE), 
	"PLANT_LONGITUDE" NUMBER(38,8), 
	"PLANT_LATITUDE" NUMBER(38,8)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into JAREDBACH.PLANT_LOCATIONS
SET DEFINE OFF;
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (12,'PLANT01','Pottsville','Pennsylvania','PA',-76.182344,40.690894);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (13,'PLANT02','Raymond','New Hampshire','NH',-71.1661286,43.0274128);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (14,'PLANT03','Fort Pierce','Florida','FL',-80.3827964,27.4118942);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (15,'PLANT04','Henderson','North Carolina','NC',-78.39128113,36.28921127);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (16,'PLANT05','Smyrna','Delaware','DE',-75.626646,39.2888684);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (17,'PLANT06','Williamsport','Maryland','MD',-77.807916,39.619286);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (18,'PLANT07','Bethlehem','Pennsylvania','PA',-75.3227189,40.6112545);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (19,'PLANT08','Arcadia','Florida','FL',-81.851939,27.239609);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (20,'PLANT09','Mebane','North Carolina','NC',-79.262621,36.102563);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (21,'PLANT10','Pedricktown','New Jersey','NJ',-75.408412,39.733769);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (22,'PLANT11','Winter Haven','Florida','FL',-81.7556018,28.0462827);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (23,'PLANT12','Davenport','Florida','FL',-81.74889,27.995134);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (24,'PLANT13','Brooksville','Florida','FL',-82.2200794,28.5186767);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (25,'PLANT14','Harrison','New Jersey','NJ',-74.161783,40.742177);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (26,'PLANT15','Ridgeville','South Carolina','SC',-80.311951,33.102683);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (27,'PLANT16','Mira Loma','California','CA',-117.558152,34.012427);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (28,'PLANT17','Port Wentworth','Georgia','GA',-81.163168,32.149092);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (29,'PLANT18','Johnsontown','New York','NY',-74.4067541,42.9868881);
Insert into JAREDBACH.PLANT_LOCATIONS (PLANT_LOCATION_ID,PLANT_CODE,PLANT_CITY,PLANT_STATE_NAME,PLANT_STATE,PLANT_LONGITUDE,PLANT_LATITUDE) values (30,'PLANT19','Alachua','Florida','FL',-82.468558,29.760911);
