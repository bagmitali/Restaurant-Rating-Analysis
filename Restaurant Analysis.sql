Use Restaurant_Rating

------- Restaurants Analysis ------------
-- Total restaurants in each state
Select 
	State, 
	Count(Restaurant_ID) as Total_restaurants 
from restaurants
Group by State
Order by Total_restaurants desc

--  Total restaurants in each city
Select
	City,
	Count(Restaurant_ID) as Total_restaurants 
from restaurants
Group by City
order by Total_restaurants desc

-- Restaurants count by alcohol service 
Select 
	Alcohol_Service, 
	Count(Restaurant_ID) as Total_restaurants
from restaurants
Group by Alcohol_Service
order by Total_restaurants desc

-- Restaurants count by smoking allowed
Select 
	Smoking_Allowed,  
	Count(Restaurant_ID) as Total_restaurants
from restaurants
Group by Smoking_Allowed
order by Total_restaurants desc

-- Alcohol & Smoking analysis
SELECT
	alcohol_service,
	smoking_allowed,
	count(restaurant_id) as Total_restaurant
FROM restaurants
GROUP BY alcohol_service,smoking_allowed
Order BY Total_restaurant DESC

-- Restaurants count by Price
Select 
	Price,  
	count(restaurant_id) as Total_restaurant
from restaurants
Group by Price
Order BY Total_restaurant DESC

-- Restaurants count by parking
SELECT 
	parking, 
	count(restaurant_id) as Total_restaurant
FROM restaurants
GROUP BY parking
Order BY Total_restaurant DESC

-- Count of Restaurants by cuisines
SELECT 
	cuisine, 
	count(restaurant_id) AS Total_restaurant
FROM restaurant_cuisines
GROUP BY cuisine
ORDER BY Total_restaurant DESC

--  Restaurant price analysis for each cuisine
SELECT 
	b.cuisine,
	SUM(CASE WHEN a.price = 'High' Then 1 Else 0 END) AS High,
	SUM(CASE WHEN a.price = 'Medium' Then 1 Else 0 END) AS Medium,
	SUM(CASE WHEN a.price = 'Low' Then 1 Else 0 END) AS Low
FROM restaurants AS a
INNER JOIN restaurant_cuisines AS b ON a.restaurant_id = b.restaurant_id
GROUP BY b.cuisine
ORDER BY b.cuisine

-- Finding out count of each cuisine in each state
SELECT 
	b.cuisine,
	SUM(CASE WHEN a.state = 'Morelos' Then 1 Else 0 END) AS Morelos,
	SUM(CASE WHEN a.state = 'San Luis Potosi' Then 1 Else 0 END) AS San_Luis_Potosi,
	SUM(CASE WHEN a.state = 'Tamaulipas' Then 1 Else 0 END) AS Tamaulipas
FROM  restaurants AS a
INNER JOIN restaurant_cuisines AS b ON a.restaurant_id = b.restaurant_id
GROUP BY b.cuisine
ORDER BY b.cuisine

