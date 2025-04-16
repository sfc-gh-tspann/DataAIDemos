CREATE or REPLACE TABLE ADELAIDEAGENCY (
	agencyid text NULL,
	agencyname text NULL,
	agencyurl text NULL,
	agencytimezone text NULL,
    agencylang text NULL,
    agencyphone  text NULL,
    agencyfareurl text NULL
);

describe table adelaideroutes;

CREATE OR REPLACE TABLE adelaidecalendar (
	serviceid text NULL,
	monday text NULL,
	tuesday text NULL,
	wednesday text NULL,
	thursday text NULL,
	friday text NULL,
	saturday text NULL,
	sunday text NULL,
	startdate text NULL,
	enddate text NULL
);

CREATE OR REPLACE TABLE adelaidecalendar_dates (
	serviceid text NULL,
	`date` text NULL,
	exceptiontype text NULL
);

-- field named date is a problem
-- ADELAIDERELEASE NOTES   <--- skip this table

--- Routes putdatabaserecord.error
-- Cannot convert CHOICE, type must be explicit ->>> needs a cast

---- Trips 
--- putdatabaserecord.error
--- Cannot convert CHOICE, type must be explicit

--- dont do text

describe table ADELAIDEROUTES;


CREATE OR REPLACE TABLE adelaidefeed_info (
	feedpublishername text NULL,
	feedpublisherurl text NULL,
	feedlang text NULL,
	feedstartdate text NULL,
	feedenddate text NULL,
	feedversion text NULL
);

CREATE OR REPLACE TABLE ADELAIDEROUTES (
	routeid TEXT NULL,
	agencyid text NULL,
	routeshortname text NULL,
	routelongname text NULL,
	routedesc text NULL,
	routetype text NULL,
	routeurl text NULL,
	routecolor text NULL,
	routetextcolor text NULL,
    routegroup text NULL
);

select * from ADELAIDEROUTES;



CREATE OR REPLACE TABLE ADELAIDETRIPS (
	routeid text NULL,
	serviceid text NULL,
	tripid text NULL,
	tripheadsign text NULL,
	tripshortname text NULL,
	directionid text NULL,
	blockid text NULL,
	shapeid text NULL,
    wheelchairaccessible text NULL
);

select * from ADELAIDETRIPS;


  
CREATE OR REPLACE  TABLE adelaidestops (
	stopid text NOT NULL,
	stopcode text NULL,
	stopname text NULL,
	stopdesc text NULL,
	stoplat text NULL,
	stoplon text NULL,
	zoneid text NULL,
	stopurl text NULL,
	locationtype text NULL,
	parentstation text NULL,
    stoptimezone text NULL,
    wheelchairboarding text NULL
);

CREATE OR REPLACE TABLE adelaidestop_times (
	tripid text NULL,
	arrivaltime text NULL,
	departuretime text NULL,
	stopid text NULL,
	stopsequence text NULL,
	stopheadsign text NULL,
	pickuptype text NULL,
	dropofftype text NULL,
    shapedisttraveled text NULL,
	timepoint text NULL
);

CREATE OR REPLACE TABLE adelaidetransfers (
    fromstopid text,
    tostopid text,
    transfertype text,
    mintransfertime text
);


CREATE OR REPLACE TABLE adelaidefareattributes (
	fareid text,
	price text,
	currencytype text,
	paymentmethod text,
	transfers text
);

CREATE OR REPLACE TABLE ADELAIDETRIPUPDATES (
  stopsequence text NULL,
  arrivaltime text NULL,
  stopid text NULL,
  tripid    text NULL,
  tripstartdate text NULL,
  departuretime text NULL,
  triprouteid   text NULL,
    ts text NULL,
     uuid text NULL);

  CREATE OR REPLACE TABLE ADELAIDESERVICEALERTS (
	ROUTEID4 STRING,
	ROUTEID5 STRING,
	DESCRIPTIONLANG STRING,
	CAUSE STRING,
	STOPID STRING,
	ALERTLANG STRING,
	ALERTTEXT STRING,
	ROUTEID STRING,
	EFFECT STRING,
	STOPID5 STRING,
	DESCRIPTIONTEXT STRING,
	STOPID4 STRING,
	ACTIVEPERIODEND STRING,
	STOPID3 STRING,
	STOPID2 STRING,
	ROUTEID2 STRING,
	ROUTEID3 STRING,
	ACTIVEPERIODSTART STRING,
	TS STRING,
	UUID STRING
  );

  
CREATE OR REPLACE TABLE ADELAIDEVEHICLEPOSITIONS (
	ROUTEID STRING,
	BEARING STRING,
	DIRECTIONID STRING,
	LATITUDE STRING,
	TRIPID STRING,
	VEHICLELABEL STRING,
	VEHICLEID STRING,
	STARTDATE STRING,
	UUID STRING,
	SPEED STRING,
	LONGITUDE STRING,
	TIMESTAMP STRING,
	TS STRING
    );



    PutDatabaseRecord[id=31d642ae-161b-3034-6a57-8b3cd6062f81] Failed to put Records to database for FlowFile[filename=trips.txt]. Routing to failure.: org.apache.nifi.serialization.record.util.IllegalTypeConversionException: Cannot convert CHOICE, type must be explicit

    Routes
    putdatabaserecord.error
Cannot convert CHOICE, type must be explicit


  describe table ADELAIDETRIPUPDATES;

  select * from adelaidetripupdates where departuretime is not null;

  select* from ADELAIDEVEHICLEPOSITIONS where routeid is not null;

  
  select * from adelaideSERVICEALERTS where stopid is not null;
  
  describe table adelaidestop_times;

  describe table ADELAIDEAGENCY;
  
  select * from ADELAIDECALENDAR_DATES
  
