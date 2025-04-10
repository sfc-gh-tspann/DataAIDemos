CREATE or REPLACE TABLE adelaideagency (
	agencyid text NULL,
	agencyname text NULL,
	agencyurl text NULL,
	agencytimezone text NULL,
    agency_lang text NULL,
    agency_phone  text NULL,
    agency_fare_url text NULL
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
	"date" text NULL,
	exceptiontype text NULL
);

CREATE OR REPLACE TABLE adelaidefeed_info (
	feedpublishername text NULL,
	feedpublisherurl text NULL,
	feedlang text NULL,
	feedstartdate text NULL,
	feedenddate text NULL,
	feedversion text NULL
);

CREATE OR REPLACE TABLE adelaideroutes (
	routeid text NULL,
	agencyid text NULL,
	routeshortname text NULL,
	routelongname text NULL,
	routedesc text NULL,
	routetype text NULL,
	routeurl text NULL,
	routecolor text NULL,
	routetextcolor text NULL,
    RouteGroup text NULL
);

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

CREATE OR REPLACE TABLE adelaidetrips (
	routeid text NULL,
	serviceid text NULL,
	tripid text NULL,
	tripheadsign text NULL,
	tripshortname text NULL,
	directionid text NULL,
	blockid text NULL,
	shapeid text NULL,
    wheelchair_accessible text NULL
);

CREATE OR REPLACE TABLE adelaidefareattributes (
	fareid text,
	price text,
	currencytype text,
	paymentmethod text,
	transfers text
);

CREATE OR REPLACE TABLE adelaidetripupdates (
  stopsequence text NULL,
  arrivaltime text NULL,
  stopid text NULL,
  tripid    text NULL,
  tripstartdate text NULL,
  departuretime text NULL,
  triprouteid   text NULL,
    ts text NULL,
     uuid text NULL
  );


  describe table ADELAIDETRIPUPDATES;
  
