SELECT count(*) FROM project_regression.regression;
delete from regression;
LOAD DATA LOCAL INFILE 'C:/Users/JoshuaMeldrum/Downloads/project_regression/regression_data.csv' INTO TABLE regression
FIELDS TERMINATED BY ',';





-- What are the unique values in the column bedrooms?
-- What are the unique values in the column bathrooms?
-- What are the unique values in the column condition?
-- What are the unique values in the column grade?

SELECT * FROM project_regression.regression;
SELECT DISTINCT bedrooms from project_regression.regression;
SELECT DISTINCT bathrooms from project_regression.regression;
SELECT DISTINCT floors from project_regression.regression;
SELECT DISTINCT cond from project_regression.regression;
SELECT DISTINCT grade from project_regression.regression;




-- #8 Arrange the data in a decreasing order by the price of the house to show the top 10 most expensive houses in your data.

Select price from regression
order by price desc
limit 10;





-- #9 What is the average price of all the properties in your data?
select avg(price) as average_price from regression;



-- #10(part 1) What is the average price of the houses grouped by bedrooms?
select bedrooms,avg(price) as average_price
from regression
group by bedrooms
order by bedrooms; 

-- #10(part 2) What is the average sqft_living of the houses grouped by bedrooms?
select bathrooms,avg(sqft_living) as avg_sqft_living
from regression
group by bathrooms;

-- #10(part 3) What is the average price of the houses with a waterfront and without a waterfront? 
select waterfront,avg(price) as avg_price
from regression
group by waterfront;

-- #10(part 4) Is there any correlation between the columns condition and grade? 
Select grade, regression.cond, count(*) from regression
group by grade, regression.cond
order by cond, regression.cond asc;
Select grade, regression.cond, count(*) from regression
group by grade, regression.cond
order by grade, regression.cond asc;




-- 11 Find all houses with the following: 3-4 bedrooms, more than 3 bathrooms, 1 foor, no waterfront, condition > 2,
# Grade > 4, price less than 300000
select bedrooms, bathrooms, floors, waterfront, regression.cond, grade, price from regression
where (bedrooms =3 or bedrooms = 4) and (bathrooms > 3) and (floors =1.0) and (waterfront = 0) and (regression.cond > 2)
and (grade > 4) and (price <300000);
-- no options available



-- #12 Show which prices are twice more than the average of all the properties in the database.
select price, id from regression
where price > 2*( select avg(price) from regression)
order by price;



-- #13 Create a view of the query in #12  
create or replace view twice_avg as
select price, id from regression 
where price > 2*( select avg(price) from regression)
order by price;
select * from twice_avg;



-- #14 Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
select( (select avg(price) from regression where bedrooms = 4) -
( select avg(price) from regression where bedrooms = 3))avg_price_diff;



-- #15 Show all zipcodes for properties in the database
select distinct zipcode from regression;




-- #16 Show the list of all the properties that were renovated.
select * from regression
where year_renovated != 0;



-- #17 Provide the details of the property that is the 11th most expensive property in your database.

