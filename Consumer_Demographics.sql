Use Restaurant_Rating

select * from consumers

--Customer Demographics

-- Total Customer in the State 
Select 
	State,
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by State
Order by Total_Customer desc

-- Total Customer in the City
Select 
	City,
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by City
Order by Total_Customer desc

-- Total Customer based on Age
Select 
	Age,
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by Age
Order by Total_Customer desc

--  Adding Age Bucket Column 
ALTER TABLE consumers
ADD Age_Bucket Varchar(50)


--- Updating the Age Bucket column with case when condition
UPDATE consumers
SET age_bucket = CASE WHEN age > 60 then '61 and Above'
		      WHEN age > 40 then '41 - 60'	
		      WHEN age > 25 then '26 - 40'
		      WHEN age >= 18 then '18 - 25'
			  END

-- Total customers in each age bucket
Select 
	Age_bucket,
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by Age_bucket
Order by Total_Customer desc

-- Budget level of customers
Select 
	Budget,
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by Budget
Order by Total_Customer desc

-- Transportation methods of customers
Select 
	Transportation_Method, 
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by Transportation_Method
Order by Total_Customer desc

-- Total customers count & smokers count in each age percent 
SELECT 
	 age_bucket,
	 count(consumer_id) as total,
	 count(case when smoker = 1 Then consumer_id end) as smokerscount
FROM 	 consumers
GROUP BY age_bucket
Order BY age_bucket

-- Total Customer based on Occupation
Select
	Occupation, 
	COUNT(Consumer_ID) as Total_Customer
from consumers
Group by Occupation
Order by Total_Customer desc


-- Top 5 preferred cuisines
SELECT top 5
	 preferred_cuisine,
	 count(consumer_id) AS total_customers
FROM consumer_preferences	
GROUP BY preferred_cuisine
ORDER BY total_customers DESC

-- Customer Budget analysis for each cuisine
Select 
	a.preferred_cuisine,
	SUM(case when b.Budget = 'Low' then 1 else 0 end) as LowBudget,
	SUM(case when b.Budget = 'Medium' then 1 else 0 end) as MediumBudget,
	SUM(case when b.Budget = 'High' then 1 else 0 end) as HighBudget
from consumer_preferences a
inner join consumers b on a.Consumer_ID = b.Consumer_ID
Group by a.Preferred_Cuisine
order by a.Preferred_Cuisine 

-- Preferred Cuisine based on State
SELECT
	   a.preferred_cuisine,
	   SUM(CASE WHEN b.state = 'Morelos' Then 1 Else 0 END) AS Morelos,
	   SUM(CASE WHEN b.state = 'San Luis Potosi' Then 1 Else 0 END) AS San_Luis_Potosi,
	   SUM(CASE WHEN b.state = 'Tamaulipas' Then 1 Else 0 END) AS Tamaulipas
from consumer_preferences a
inner join consumers b on a.Consumer_ID = b.Consumer_ID
Group by b.state, a.Preferred_Cuisine
order by a.Preferred_Cuisine 

-- Preferred Cuisine based on Age
SELECT
	   a.preferred_cuisine,
	  SUM(CASE WHEN b.age_bucket = '18 - 25' Then 1 Else 0 END) AS "18 - 25",
	  SUM(CASE WHEN b.age_bucket = '26 - 40' Then 1 Else 0 END) AS "26 - 40",
      SUM(CASE WHEN b.age_bucket = '41 - 60' Then 1 Else 0 END) AS "41 - 60",
	  SUM(CASE WHEN b.age_bucket = '61 and Above' Then 1 Else 0 END) AS "61+"
from consumer_preferences a
inner join consumers b on a.Consumer_ID = b.Consumer_ID
Group by b.state, a.Preferred_Cuisine
order by a.Preferred_Cuisine 