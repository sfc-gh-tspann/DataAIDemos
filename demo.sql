create or replace TABLE DEMO.DEMO.ADSB (
	SEEN_POS VARCHAR(250),
	FLIGHT VARCHAR(250),
	ADSBNOW VARCHAR(250),
	LATITUDE VARCHAR(250),
	NIC VARCHAR(250),
	EMERGENCY VARCHAR(250),
	UUID VARCHAR(250),
	SEEN VARCHAR(250),
	GEOMRATE VARCHAR(250),
	NAVHEADING VARCHAR(250),
	SILTYPE VARCHAR(250),
	SQUAWK VARCHAR(250),
	GVA VARCHAR(250),
	BARORATE VARCHAR(250),
	NOWTS VARCHAR(250),
	SIL VARCHAR(250),
	TRACK VARCHAR(250),
	LONGITUDE VARCHAR(250),
	MLAT VARCHAR(250),
	NAVIGATIONACCURACYFORVELOCITY VARCHAR(250),
	RSSI VARCHAR(250),
	NAVICATIONINTEGRITYFORBAROMETRICALTITUDE VARCHAR(250),
	NAVQNH VARCHAR(250),
	GS VARCHAR(250),
	DATAVERSION VARCHAR(250),
	SDA VARCHAR(250),
	RC VARCHAR(250),
	NAVIGATIONACCURACYFORPOSITION VARCHAR(250),
	TISB VARCHAR(250),
	NAVALTITUDEMCP VARCHAR(250),
	PLANEID VARCHAR(250),
	MESSAGES VARCHAR(250),
	CATEGORY VARCHAR(250),
	ALTBARO VARCHAR(250),
	TS VARCHAR(250),
	ALTGEOM VARCHAR(250)
);

create or replace TABLE DEMO.DEMO.AIRQUALITY (
	DATEOBSERVED VARCHAR(16777216),
	HOUROBSERVED VARCHAR(16777216),
	LOCALTIMEZONE VARCHAR(16777216),
	REPORTINGAREA VARCHAR(16777216),
	STATECODE VARCHAR(16777216),
	LATITUDE NUMBER(7,3),
	LONGITUDE NUMBER(7,3),
	PARAMETERNAME VARCHAR(16777216),
	AQI NUMBER(2,0),
	CATEGORYNUMBER VARCHAR(1),
	CATEGORYNAME VARCHAR(16777216),
	TS VARCHAR(16777216),
	UUID VARCHAR(16777216)
);


create or replace TABLE DEMO.DEMO.AIRQUALITYFORECAST (
	DATEISSUE VARCHAR(16777216),
	DATEFORECAST VARCHAR(16777216),
	REPORTINGAREA VARCHAR(16777216),
	STATECODE VARCHAR(16777216),
	LATITUDE NUMBER(7,3),
	LONGITUDE NUMBER(7,3),
	PARAMETERNAME VARCHAR(16777216),
	AQI NUMBER(38,0),
	CATEGORYNUMBER VARCHAR(1),
	CATEGORYNAME VARCHAR(16777216),
	ACTIONDAY VARCHAR(16777216),
	DISCUSSION VARCHAR(5000),
	TS VARCHAR(16777216),
	UUID VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.GROCERY (
	ITEM_DESCRIPTION VARCHAR(16777216),
	ITEM VARCHAR(16777216),
	ITEM_HEIGHT VARCHAR(16777216),
	PRODUCT_ID VARCHAR(16777216),
	DISPLAY_IMAGE VARCHAR(16777216),
	ITEM_SIZE VARCHAR(16777216),
	UPC VARCHAR(16777216),
	BRAND_NAME VARCHAR(16777216),
	ORIGIN_STORE VARCHAR(16777216),
	UUID VARCHAR(16777216),
	TEMPERATURE_INDICATOR VARCHAR(16777216),
	UPDATE_DATE VARCHAR(16777216),
	ITEM_DEPTH VARCHAR(16777216),
	ITEM_ID VARCHAR(16777216),
	PRICE VARCHAR(16777216),
	TPR VARCHAR(16777216),
	ITEM_HEATED_INDICATOR VARCHAR(16777216),
	CATEGORY VARCHAR(16777216),
	COUNTRY_ORIGIN VARCHAR(16777216),
	ITEM_WIDTH VARCHAR(16777216),
	TS VARCHAR(16777216),
	CREATED_DATE VARCHAR(16777216),
	ENRICHMENT_DATE VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.GROCERY_IMAGE (
	PRODUCT_SIZE VARCHAR(16777216),
	URL VARCHAR(16777216),
	ITEM_ID NUMBER(38,0) NOT NULL,
	UPC NUMBER(38,0),
	ITEM VARCHAR(16777216),
	TEMPERATURE_INDICATOR VARCHAR(16777216),
	PRICE NUMBER(4,2),
	ORIGIN_STORE VARCHAR(16777216),
	ITEM_DESCRIPTION VARCHAR(16777216),
	MSRP NUMBER(4,2),
	CATEGORY VARCHAR(16777216),
	ITEM_HEATED_INDICATOR VARCHAR(16777216),
	UPDATE_DATE VARCHAR(16777216),
	COUNTRY_ORIGIN VARCHAR(16777216),
	CREATED_DATE VARCHAR(16777216),
	ENRICHMENT_DATE VARCHAR(16777216),
	TS VARCHAR(16777216),
	TPR VARCHAR(16777216),
	PRODUCT_ID NUMBER(38,0),
	UUID VARCHAR(16777216),
	ITEM_SIZE VARCHAR(16777216),
	BRAND_NAME VARCHAR(16777216)
);

create or replace ICEBERG TABLE DEMO.DEMO.ICYTRANSCOME (
	TITLE STRING,
	DESCRIPTION STRING,
	PUBDATE STRING,
	POINT STRING,
	LATITUDE STRING,
	TS STRING,
	LONGITUDE STRING,
	UUID STRING NOT NULL,
	primary key (UUID)
)
 EXTERNAL_VOLUME = 'TRANSCOM_TSPANNICEBERG_EXTVOL'
 CATALOG = 'SNOWFLAKE'
 BASE_LOCATION = 'transcom/';


create or replace TABLE DEMO.DEMO.IRELANDLOOKUPAGENCY (
	AGENCYID VARCHAR(16777216),
	AGENCYNAME VARCHAR(16777216),
	AGENCYURL VARCHAR(16777216),
	AGENCYTIMEZONE VARCHAR(16777216)
);


create or replace TABLE DEMO.DEMO.IRELANDLOOKUPCALENDAR (
	SERVICEID VARCHAR(16777216),
	MONDAY VARCHAR(16777216),
	TUESDAY VARCHAR(16777216),
	WEDNESDAY VARCHAR(16777216),
	THURSDAY VARCHAR(16777216),
	FRIDAY VARCHAR(16777216),
	SATURDAY VARCHAR(16777216),
	SUNDAY VARCHAR(16777216),
	STARTDATE VARCHAR(16777216),
	ENDDATE VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.IRELANDLOOKUPCALENDAR_DATES (
	SERVICEID VARCHAR(16777216),
	"date" VARCHAR(16777216),
	EXCEPTIONTYPE VARCHAR(16777216)
);


create or replace TABLE DEMO.DEMO.IRELANDLOOKUPFEED_INFO (
	FEEDPUBLISHERNAME VARCHAR(16777216),
	FEEDPUBLISHERURL VARCHAR(16777216),
	FEEDLANG VARCHAR(16777216),
	FEEDSTARTDATE VARCHAR(16777216),
	FEEDENDDATE VARCHAR(16777216),
	FEEDVERSION VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.IRELANDLOOKUPROUTES (
	ROUTEID VARCHAR(16777216),
	AGENCYID VARCHAR(16777216),
	ROUTESHORTNAME VARCHAR(16777216),
	ROUTELONGNAME VARCHAR(16777216),
	ROUTEDESC VARCHAR(16777216),
	ROUTETYPE VARCHAR(16777216),
	ROUTEURL VARCHAR(16777216),
	ROUTECOLOR VARCHAR(16777216),
	ROUTETEXTCOLOR VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.IRELANDLOOKUPSTOPS (
	STOPID VARCHAR(16777216) NOT NULL,
	STOPCODE VARCHAR(16777216),
	STOPNAME VARCHAR(16777216),
	STOPDESC VARCHAR(16777216),
	STOPLAT VARCHAR(16777216),
	STOPLON VARCHAR(16777216),
	ZONEID VARCHAR(16777216),
	STOPURL VARCHAR(16777216),
	LOCATIONTYPE VARCHAR(16777216),
	PARENTSTATION VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.IRELANDLOOKUPSTOP_TIMES (
	TRIPID VARCHAR(16777216),
	ARRIVALTIME VARCHAR(16777216),
	DEPARTURETIME VARCHAR(16777216),
	STOPID VARCHAR(16777216),
	STOPSEQUENCE VARCHAR(16777216),
	STOPHEADSIGN VARCHAR(16777216),
	PICKUPTYPE VARCHAR(16777216),
	DROPOFFTYPE VARCHAR(16777216),
	TIMEPOINT VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.IRELANDLOOKUPTRIPS (
	ROUTEID VARCHAR(16777216),
	SERVICEID VARCHAR(16777216),
	TRIPID VARCHAR(16777216),
	TRIPHEADSIGN VARCHAR(16777216),
	TRIPSHORTNAME VARCHAR(16777216),
	DIRECTIONID VARCHAR(16777216),
	BLOCKID VARCHAR(16777216),
	SHAPEID VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.PLANES (
	ICAO24 VARCHAR(16777216),
	FIRSTSEEN VARCHAR(16777216),
	ESTDEPARTUREAIRPORT VARCHAR(16777216),
	LASTSEEN VARCHAR(16777216),
	ESTARRIVALAIRPORT VARCHAR(16777216),
	CALLSIGN VARCHAR(16777216),
	ESTDEPARTUREAIRPORTHORIZDISTANCE VARCHAR(16777216),
	ESTDEPARTUREAIRPORTVERTDISTANCE VARCHAR(16777216),
	ESTARRIVALAIRPORTHORIZDISTANCE VARCHAR(16777216),
	ESTARRIVALAIRPORTVERTDISTANCE VARCHAR(16777216),
	DEPARTUREAIRPORTCANDIDATESCOUNT VARCHAR(16777216),
	ARRIVALAIRPORTCANDIDATESCOUNT VARCHAR(16777216),
	TS VARCHAR(16777216),
	UUID VARCHAR(16777216)
);

create or replace TABLE DEMO.DEMO.TRANSCOM (
	TITLE VARCHAR(16777216),
	DESCRIPTION VARCHAR(16777216),
	PUBDATE VARCHAR(16777216),
	POINT VARCHAR(16777216),
	LATITUDE VARCHAR(16777216),
	TS VARCHAR(16777216),
	LONGITUDE VARCHAR(16777216),
	UUID VARCHAR(16777216) NOT NULL,
	primary key (UUID)
);

create or replace TABLE DEMO.DEMO.TRANSCOMRAW (
	TITLE VARCHAR(16777216),
	DESCRIPTION VARCHAR(16777216),
	PUBDATE VARCHAR(16777216),
	POINT VARCHAR(16777216),
	LATITUDE VARCHAR(16777216),
	TS VARCHAR(16777216),
	LONGITUDE VARCHAR(16777216),
	UUID VARCHAR(16777216) NOT NULL
);

# https://docs.snowflake.com/en/user-guide/tables-iceberg-create
# Se-tspann-apacheiceberg-tablepolicy
# Se-tspann-apacheiceberg
# se_tspann_iceberg_table_external_id
# Se_tspann_iceberg_table_nifirole

describe external volume transcom_tspanniceberg_extvol;

CREATE OR REPLACE EXTERNAL VOLUME transcom_tspanniceberg_extvol
STORAGE_LOCATIONS =
(
 (
    NAME = 'se-tspann-apacheiceberg'
    STORAGE_PROVIDER = 'S3'
    STORAGE_BASE_URL = 's3://se-tspann-apacheiceberg/'
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<3343434343434>:role/se_tspann_iceberg_table_nifirole'
    STORAGE_AWS_EXTERNAL_ID = 'se_tspann_iceberg_table_external_id'
 )
);

SELECT SYSTEM$VERIFY_EXTERNAL_VOLUME('transcom_tspanniceberg_extvol');


describe table icytranscome;

# https://docs.snowflake.com/en/user-guide/tables-iceberg-configure-external-volume-s3
# https://docs.snowflake.com/en/user-guide/tables-iceberg-configure-external-volume-s3 


