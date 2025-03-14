create or replace TABLE DEMO.DEMO.STOCKVALUES (
	UUID VARCHAR(250),
	LASTPRICE FLOAT,
	STOCKVOLUME FLOAT,
	SYMBOL VARCHAR(250),
	TS VARCHAR(250),
	TRADECONDITIONS VARCHAR(250)
);




{"country":"US","currency":"USD","estimateCurrency":"USD","exchange":"NASDAQ NMS - GLOBAL MARKET","finnhubIndustry":"Technology","ipo":"1980-12-12","logo":"https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AAPL.png","marketCapitalization":3149828.207397,"name":"Apple Inc","phone":"14089961010","shareOutstanding":15037.87,"ticker":"AAPL","weburl":"https://www.apple.com/"}%                                                                                                            (base) tspann@LXLCQY329P code % curl "https://finnhub.io/api/v1/search?q=apple&exchange=US&token=$FINN_KEY"
{"count":17,"result":[{"description":"APPLE INC","displaySymbol":"AAPL","symbol":"AAPL","type":"Common Stock"}

CREATE TABLE stock(
   country              VARCHAR(10) 
  ,currency             VARCHAR(10)
  ,estimateCurrency     VARCHAR(10) 
  ,exchange             VARCHAR(250) 
  ,finnhubIndustry      VARCHAR(250) 
  ,ipo                  VARCHAR(250)  
  ,logo                 VARCHAR(250) 
  ,marketCapitalization NUMERIC(20,6)
  ,name                 VARCHAR(9) 
  ,phone                VARCHAR(250)
  ,shareOutstanding     NUMERIC(20,2) 
  ,ticker               VARCHAR(20) 
  ,weburl               VARCHAR(250) 
  ,description          VARCHAR(250)
  ,displaySymbol        VARCHAR(250)
  ,symbol               VARCHAR(250) 
  ,symboltype           VARCHAR(250) 
);

select * from stock;


insert into stock
(displaySymbol,symbol, ticker)
values
('AAPL','AAPL','AAPL'),
('AMZN','AMZN','AMZN'),
('SLA ','SLA ','SLA '),
('AMD','AMD','AMD'),
('MSFT','MSFT' ,'MSFT' ), 
('GOOG','GOOG','GOOG'),
('META','META','META'), 
('NVDA','NVDA','NVDA'),
('CRM','CRM','CRM'),
('BABA','BABA','BABA'),
('PYPL','PYPL','PYPL'),
('EA','EA','EA'), 
('WMT','WMT','WMT'),
('NKE','NKE','NKE'),
('BRK.B','BRK.B','BRK.B'),
('GOOGL','GOOGL','GOOGL'),
('UNH','UNH','UNH'),
('JNJ','JNJ','JNJ'), 
('XOM','XOM','XOM'), 
('JPM','JPM','JPM'), 
('V','V','V'), 
('HD','HD','HD'), 
('LLY','LLY','LLY'), 
('CVX','CVX','CVX'), 
('ABBV','ABBV','ABBV'), 
('PEP','PEP','PEP') ,
('BAC','BAC','BAC'), 
('KO','KO','KO'), 
('MA','MA','MA'), 
('AVGO','AVGO','AVGO'), 
('TMO','TMO','TMO'), 
('COST','COST','COST'), 
('CSCO','CSCO','CSCO'), 
('MCD','MCD','MCD'), 
('ABT','ABT','ABT'), 
('VZ','VZ','VZ'), 
('DIS','DIS','DIS'), 
('BMY','BMY','BMY'), 
('CMCSA','CMCSA','CMCSA'), 
('RTX','RTX','RTX'), 
('HON','HON','HON'), 
('IBM','IBM','IBM'), 
('CVS','CVS','CVS'),
('ORCL','ORCL','ORCL'),
('CAT','CAT','CAT'),
('LOW','LOW','LOW'),
('BLK','BLK','BLK'),
('MS','MS','MS'),
('BA','BA','BA'),
('INTC','INTC','INTC' ), 
('NTU','NTU','NTU'), 
('SNOW','SNOW','SNOW'  );



   insert into stock
(displaySymbol,symbol, ticker)
values
('CB', 'CB', 'CB'),
('TMUS', 'TMUS', 'TMUS'),
('C', 'C', 'C'),
('DUK', 'DUK', 'DUK'),
('BDX', 'BDX', 'BDX'),
('SLB', 'SLB', 'SLB'),
('MMM', 'MMM', 'MMM'),
('CL', 'CL', 'CL');
    


insert into stock
(displaySymbol,symbol, ticker)
values
('USB', 'USB', 'USB'),
('ICE', 'ICE', 'ICE'),
('MRNA', 'MRNA', 'MRNA'),
('TGT', 'TGT', 'TGT');

select '{"type":"subscribe","symbol":"' || symbol || '"} ' as stock from stock;

'https://docs.snowflake.com/en/developer-guide/stored-procedure/stored-procedures-selecting-from '
CREATE OR REPLACE PROCEDURE returnStockSymbols()
RETURNS TABLE(stock VARCHAR)
LANGUAGE SQL AS
DECLARE
  res RESULTSET;
BEGIN
  res := (SELECT '{"type":"subscribe","symbol":"' || symbol || '"} ' as stock FROM STOCK);
  RETURN TABLE(res);
END;

SELECT * FROM TABLE(returnStockSymbols());

