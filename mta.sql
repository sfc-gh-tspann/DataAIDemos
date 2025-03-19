CREATE ICEBERG TABLE ICYMTA (
   StopPointRef               STRING
  ,VehicleRef                 STRING
  ,ProgressRate               STRING
  ,ExpectedDepartureTime      STRING
  ,StopPoint                  STRING
  ,VisitNumber                STRING
  ,DataFrameRef               STRING
  ,StopPointName              STRING
  ,SituationSimpleRef5        STRING
  ,SituationSimpleRef3        STRING
  ,Bearing                    STRING
  ,SituationSimpleRef4        STRING
  ,SituationSimpleRef1        STRING
  ,OriginAimedDepartureTime   STRING
  ,SituationSimpleRef2        STRING
  ,JourneyPatternRef          STRING
  ,RecordedAtTime             STRING
  ,OperatorRef                STRING
  ,DestinationName            STRING
  ,ExpectedArrivalTime        STRING
  ,BlockRef                   STRING
  ,LineRef                    STRING
  ,VehicleLocationLongitude   STRING
  ,DirectionRef               STRING
  ,ArrivalProximityText       STRING
  ,DistanceFromStop           STRING
  ,EstimatedPassengerCapacity STRING
  ,AimedArrivalTime           STRING
  ,PublishedLineName          STRING
  ,DatedVehicleJourneyRef     STRING
  ,Date                       STRING
  ,Monitored                  STRING
  ,ProgressStatus             STRING
  ,DestinationRef             STRING
  ,EstimatedPassengerCount    STRING 
  ,VehicleLocationLatitude    STRING
  ,OriginRef                  STRING
  ,NumberOfStopsAway          STRING
  ,ts                         STRING
  ,uuid                       STRING
  )
  CATALOG = 'SNOWFLAKE'
  EXTERNAL_VOLUME = 'transcom_tspanniceberg_extvol'
  BASE_LOCATION = 'mta';

--
-- KM https://docs.snowflake.com/en/sql-reference/functions/haversine
-- 
CREATE OR REPLACE PROCEDURE DEMO.DEMO.RETURN_MTA_NEARBY(YOURLATITUDE STRING, YOURLONGITUDE STRING)
RETURNS TABLE ("BUS" VARCHAR, "destinationname" VARCHAR,  expectedarrivaltime  VARCHAR, EXPECTEDDEPARTURETIME VARCHAR,
               stoppointname varchar, bearing varchar, distance float, distancefromstop VARCHAR,
               IncidentDescription VARCHAR, recordedattime VARCHAR, ESTIMATEDPASSENGERCOUNT VARCHAR,
               ESTIMATEDPASSENGERCAPACITY VARCHAR, arrivalproximitytext VARCHAR, NUMBEROFSTOPSAWAY VARCHAR, TS VARCHAR)
LANGUAGE SQL
EXECUTE AS OWNER
AS 
DECLARE
  res RESULTSET;
BEGIN
  res := ( SELECT VEHICLEREF as bus, destinationname, 
         expectedarrivaltime,
         EXPECTEDDEPARTURETIME, stoppointname, bearing,HAVERSINE( VEHICLELOCATIONLATITUDE, VEHICLELOCATIONLONGITUDE, :YOURLATITUDE,	
         :YOURLONGITUDE ) as distance, 
         distancefromstop,SITUATIONSIMPLEREF1 as IncidentDescription, 
      recordedattime, ESTIMATEDPASSENGERCOUNT, 
      ESTIMATEDPASSENGERCAPACITY, 
      arrivalproximitytext,
      NUMBEROFSTOPSAWAY, 
      TS 
  FROM icymta
  WHERE DISTANCEFROMSTOP > 0
  ORDER BY distance ASC);
  RETURN TABLE(res);
END;



call RETURN_MTA_NEARBY('40.3209','-74.4208');


