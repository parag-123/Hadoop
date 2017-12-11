
# Creates table with all variables
create table bhav_data(`SYMBOL` STRING, `SERIES` STRING, `OPEN` DECIMAL, `HIGH` DECIMAL, `LOW` DECIMAL, `CLOSE` DECIMAL, `LAST` DECIMAL, `PREVCLOSE` DECIMAL, `TOTTRDQTY` DECIMAL, `TOTTRDVAL` DECIMAL, `TMESTAMP` CHAR(11), `TOTALTRADES` DECIMAL, `ISIN` STRING) ROW DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

#Load data in table from input files
LOAD DATA LOCAL INPATH "/HOME/HDUSER/*.CSV" INTO TABLE BHAV_DATA

#Filter the table based on Series = EQ
select * from BHAV_DATA where series = "EQ"

#Calculate Min, Max, Avg and stdev per stock per year
select symbol,substring(tmestamp,-4), min(close), max(close), avg(close), stddev_pop(close) from BHAV_DATA3 where series = "EQ" group by symbol, substring(tmestamp,-4);

#Create new table with prevous output
create table NEWDATA (`SYMBOL` STRING, `YEAR` STRING, `MINIMUM` DECIMAL, `MAXIMUM` DECIMAL, `MEAN_STOCKS` DECIMAL, `STANDARD_DEV` DECIMAL) ROW DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;)

LOAD DATA LOCAL INPATH "/HOME/HDUSER/output_hive.txt/000000_0" INTO TABLE NEWDATA