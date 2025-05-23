create or replace ICEBERG TABLE DEMO.DEMO.AQFORECAST (
	DATEISSUE STRING,
	DATEFORECAST STRING,
	REPORTINGAREA STRING,
	STATECODE STRING,
	LATITUDE NUMBER(7,3),
	LONGITUDE NUMBER(7,3),
	PARAMETERNAME STRING,
	AQI NUMBER(38,0),
	CATEGORYNUMBER STRING,
	CATEGORYNAME STRING,
	ACTIONDAY STRING,
	DISCUSSION STRING,
	TS    STRING,
	UUID   STRING
)
  EXTERNAL_VOLUME = 'TRANSCOM_TSPANNICEBERG_EXTVOL'
 CATALOG = 'SNOWFLAKE'
 BASE_LOCATION = 'airqualityforecast/';

create or replace ICEBERG TABLE DEMO.DEMO.AQ (
	DATEOBSERVED   STRING,
	HOUROBSERVED    STRING,
	LOCALTIMEZONE   STRING,
	REPORTINGAREA     STRING,
	STATECODE  STRING,
	LATITUDE NUMBER(7,3),
	LONGITUDE NUMBER(7,3),
	PARAMETERNAME  STRING,
	AQI NUMBER(2,0),
	CATEGORYNUMBER  STRING,
	CATEGORYNAME     STRING,
	TS    STRING,
	UUID    STRING,
	AQITMP NUMBER(2,0)
  )
  EXTERNAL_VOLUME = 'TRANSCOM_TSPANNICEBERG_EXTVOL'
 CATALOG = 'SNOWFLAKE'
 BASE_LOCATION = 'airquality/';

 
  select * from aq
  order by aq.dateobserved,  AQ.HOUROBSERVED, statecode desc, reportingarea desc, ts desc;

SELECT * FROM AQFORECAST
  order by dateforecast desc, parametername asc, statecode desc, reportingarea desc, ts desc;
  
 select zipcode from zipcodes order by state asc;


create or replace TABLE DEMO.DEMO.ZIPCODES (
	STATE_FIPS VARCHAR(16777216),
	STATE VARCHAR(16777216),
	STATE_ABBR VARCHAR(16777216),
	ZIPCODE VARCHAR(16777216),
	COUNTY VARCHAR(16777216),
	CITY VARCHAR(16777216)
);
