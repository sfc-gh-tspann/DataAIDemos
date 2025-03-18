  CREATE OR REPLACE TABLE RAWDOCS (
	TITLE STRING,
	DESCRIPTION STRING,
	PUBDATE STRING,
	DOCID STRING,
    DOCVEC VARIANT
  );

  SELECT
  *
FROM
  "DEMO"."DEMO"."RAWDOCUMENTS"
LIMIT
  10;
  
  select * from RAWDOCS;



  INSERT INTO RAWDOCUMENTS
(VARIANT_COL)
VALUES
('{"TITLE": "TEST"}')



select * From RAWDOCUMENTS;

---- next do insert with variant stuff
---- se capstone

INSERT INTO ADOCS
SELECT
    variant_col:TITLE::VARCHAR as TITLE,
    variant_col:DESCRIPTION::VARCHAR as DESCRIPTION,
    variant_col:PUBDATE::VARCHAR as PUBDATE,
    variant_col:DOCID::VARCHAR as DOCID,
    variant_col:DOCVEC::ARRAY as DOCVEC
FROM rawdocuments m;


CREATE OR REPLACE TABLE ADOCS (
	TITLE STRING,
	DESCRIPTION STRING,
	PUBDATE STRING,
	DOCID STRING NOT NULL,
    DOCVEC ARRAY
  );

  

SELECT * FROM ADOCS;

    
INSERT INTO DOCS
SELECT TITLE, DESCRIPTION, PUBDATE,DOCID,
    DOCVEC::VECTOR(FLOAT,768) as DOCVEC
FROM ADOCS;


SELECT * FROM DOCS;
