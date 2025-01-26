Create database Sales_db_1;
use Sales_db_1;

create table SalesData(
ORDERNUMBER int primary key,
QUANTITY smallint,
PRICE float,
ORDERLINE int,
SALES float,
ORDERDATE date,
STATUS_ varchar(30),
QTR_ID smallint,
MONTH_ID int,
YEAR_ID int,
PRODUCTLINE varchar(50),
MSRP int,
PRODUCTCODE varchar(30),
CUSTOMERNAME varchar(50),
PHONE varchar(20),
ADDRESSLINE1 varchar(30),
ADDRESSLINE2 varchar(40),
CITY varchar(50),
STATE varchar(30),
POSTALCODE VARCHAR(30),
COUNTRY varchar(40),
TERRITORY char(30),
CONTACTLASTNAME char(30),
CONTACTFIRSTNAME char(30),
DEALSIZE char(10)
);

select* from Sales_data_sample;

select count(ORDERNUMBER)
from Sales_data_sample;


select count(ORDERNUMBER)
from Sales_data_sample
where ORDERNUMBER IS NULL;

select count(distinct ORDERNUMBER) from Sales_data_sample;

select PRODUCTLINE, count(PRODUCTLINE)
from Sales_data_sample
Group by PRODUCTLINE
ORDER BY PRODUCTLINE;

select count(SALES)
from Sales_data_sample
where STATE='';

select count(TERRITORY)
from Sales_data_sample
where
TERRITORY='NA';

select ORDERDATE, count(ORDERDATE)
from Sales_data_sample
group by ORDERDATE;

select left(ORDERDATE, 9) AS OriginalDate, 
right(ORDERDATE, 4) AS OrderTime
From Sales_data_sample;

ALTER table Sales_data_sample Add column Date_ date;
Alter table Sales_data_sample Add column Time_ time;

select ORDERDATE From Sales_data_sample;

SET sql_safe_updates = 0;

update Sales_data_sample
SET
Date_=date_format(str_to_date(LPAD(substring_index(ORDERDATE, ' ', 1), 10, '0'), '%m/%d/%Y'), '%Y-%m-%d'),
Time_=right(ORDERDATE, 4);

alter table Sales_data_sample Drop column ORDERDATE;
alter table Sales_data_sample Drop column Time_; 

alter table Sales_data_sample rename column Date_ to ORDERDATE;

select * from Sales_data_sample
where PRODUCTLINE='Planes' AND date_format(ORDERDATE, '%Y-%m') ='2003-08' AND QUANTITYORDERED > 20;

select PRODUCTLINE,round(sum(SALES), 2)
from Sales_data_sample
group by PRODUCTLINE; 

select * from Sales_data_sample
where SALES > 1000;

select MONTH_ID ,date_format(str_to_date(concat('2023-', MONTH_ID, '-1'), '%Y-%m-%d'), '%M') AS MonthName, round(avg(SALES), 2) AS S
from Sales_data_sample
group by MONTH_ID
order by S desc;

select CUSTOMERNAME, round(SUM(SALES), 2) As TotalSales from Sales_data_sample
GROUP BY CUSTOMERNAME
order by  TotalSales desc
limit 5;

select PRODUCTLINE, count(distinct CUSTOMERNAME)
from Sales_data_sample
group by PRODUCTLINE;

select STATUS_ ,count(STATUS_) 
from Sales_data_sample
group by STATUS_; 

select PRODUCTLINE ,COUNT(PRODUCTLINE)
from Sales_data_sample
where STATUS_='Disputed'
group by PRODUCTLINE
ORDER BY COUNT(PRODUCTLINE);

select COUNTRY, count(COUNTRY)
from Sales_data_sample
group by COUNTRY;

select PRODUCTLINE, count(PRODUCTLINE)
from Sales_data_sample
where COUNTRY='USA'
group by PRODUCTLINE
ORDER BY count(PRODUCTLINE) desc;