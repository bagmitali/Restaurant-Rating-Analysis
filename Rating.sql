---RATING ANALYSIS----

Use Restaurant_Rating

Select * from ratings

-- Average ratings of each restaurant
Select
	b.Name,
	avg(a.Overall_Rating) as Avg_overall,
	avg(a.Food_Rating) as Avg_Foodrating,
	avg(a.Service_Rating) as Avg_service
from ratings a
inner join restaurants b on a.Restaurant_ID = b.Restaurant_ID
Group by b.Name

-- Average Rating based on Cuisine
Select 
	b.Cuisine, 
	avg(a.Overall_Rating) as Avg_overall,
	avg(a.Food_Rating) as Avg_Foodrating,
	avg(a.Service_Rating) as Avg_service
from ratings a
Left join restaurant_cuisines b on a.Restaurant_ID = b.Restaurant_ID
Group by b.Cuisine 

-- Ratings by Location
SELECT 
	r.State,
	AVG(cr.Overall_Rating) AS avg_location_rating
FROM restaurants r
INNER JOIN ratings cr ON r.restaurant_id = cr.restaurant_id
GROUP BY r.State
ORDER BY avg_location_rating DESC;

-- Impact of Cuisine Variety on Ratings
SELECT
	r.name,
	COUNT(rc.cuisine) AS cuisine_count, 
	AVG(cr.Overall_Rating) AS avg_rating
FROM restaurants r
INNER JOIN restaurant_cuisines rc ON r.restaurant_id = rc.restaurant_id
INNER JOIN ratings cr ON r.restaurant_id = cr.restaurant_id
GROUP BY r.name
ORDER BY cuisine_count DESC;
