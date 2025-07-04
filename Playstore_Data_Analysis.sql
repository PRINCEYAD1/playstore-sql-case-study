use new_project_analysis;

select * from playstore;


---

use new_project_analysis;


select * from playstore;


SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/playstore.csv'
INTO TABLE playstore
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



select count(*) from playstore;

select * from playstore;




-- CHANGING  COLUMN NAMES
ALTER TABLE playstore
CHANGE COLUMN `Content Rating` `Content_Rating` VARCHAR(255);

ALTER TABLE playstore
CHANGE COLUMN `Last_Updated` `Last_Updated` date;

ALTER TABLE playstore
CHANGE COLUMN `Current Ver` `Current_Ver` Varchar(255);

ALTER TABLE playstore
CHANGE COLUMN `Android Ver` `Android_Ver` Varchar(255);




select * from playstore;




-- 1.You're working as a market analyst for a mobile app development company. Your task is to identify the most promising categories(TOP 5) for 
-- launching new free apps based on their average ratings.
select category, round(avg(rating),2) as 'average'  from playstore where type='Free' 
group by category
order by average desc
limit 5;




-- 2. As a business strategist for a mobile app company, your objective is to pinpoint the three categories that generate the most revenue from paid apps.
-- This calculation is based on the product of the app price and its number of installations.
select category, round(sum(revenue),2) as rev from
(
select *, (Installs*Price)  as revenue from playstore where  type='paid'
)t  group by category 
order by rev desc
limit 3;


-- 3. As a data analyst for a gaming company, you're tasked with calculating the percentage of games within each category. 
-- This information will help the company understand the distribution of gaming apps across different categories.
select * , (cnt/(select count(*) from playstore))*100 as 'percentage' from
(
select category , count(category) as 'cnt' from playstore group by category
)m





-- 4. As a data analyst at a mobile app-focused market research firm, 
-- you'll recommend whether the company should develop paid or free apps for each category based on the  ratings of that category.

with freeapp as
(
 select category, round(avg(rating),2) as 'avg_rating_free' from playstore where type ='Free'
 group by category
),
paidapp as
( 
 select category, round(avg(rating),2) as 'avg_rating_paid' from playstore where type ='Paid'
 group by category
)

select *, if(avg_rating_free>avg_rating_paid,'Develop Free app','Develop Paid app') as 'Development' from
(
select f.category,f.avg_rating_free, p.avg_rating_paid  from freeapp as f inner join paidapp  as p on f.category = p.category
)k






-- 5.Suppose you're a database administrator, your databases have been hacked  and hackers are changing price of certain apps on the database , its taking long for IT team to 
-- neutralize the hack , however you as a responsible manager  dont want your data to be changed , do some measure where the changes in price can be recorded as you cant 
-- stop hackers from making changes

-- creating table.
CREATE TABLE PriceChangeLog (
    App VARCHAR(255),
    Old_Price DECIMAL(10, 2),
    New_Price DECIMAL(10, 2),
    Operation_Type VARCHAR(10),
    Operation_Date TIMESTAMP
);

create table play as
SELECT * FROM PLAYSTORE

-- for update
DELIMITER //   
CREATE TRIGGER price_change_update
AFTER UPDATE ON play
FOR EACH ROW
BEGIN
    INSERT INTO pricechangelog (app, old_price, new_price, operation_type, operation_date)
    VALUES (NEW.app, OLD.price, NEW.price, 'update', CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
UPDATE play
SET price = 4
WHERE app = 'Infinite Painter';

UPDATE play
SET price = 5
WHERE app = 'Sketch - Draw & Paint';


select * from play where app='Sketch - Draw & Paint'





-- 6. your IT team have neutralize the threat,  however hacker have made some changes in the prices, but becasue of your measure you have noted the changes , now you want
-- correct data to be inserted into the database.

drop trigger price_change_update


UPDATE play AS p1
INNER JOIN pricechangelog AS p2 ON p1.app = p2.app
SET p1.price = p2.old_price;      -- step 2

select * from play where app='Sketch - Draw & Paint';






-- 7. As a data person you are assigned the task to investigate the correlation between two numeric factors: app ratings and the quantity of reviews.
SET @x = (SELECT ROUND(AVG(rating), 2) FROM playstore);
SET @y = (SELECT ROUND(AVG(reviews), 2) FROM playstore);    

with t as 
(
	select  *, round((rat*rat),2) as 'sqrt_x' , round((rev*rev),2) as 'sqrt_y' from
	(
		select  rating , @x, round((rating- @x),2) as 'rat' , reviews , @y, round((reviews-@y),2) as 'rev'from playstore
	)a                                                                                                                        
)
-- select * from  t
select  @numerator := round(sum(rat*rev),2) , @deno_1 := round(sum(sqrt_x),2) , @deno_2:= round(sum(sqrt_y),2) from t ; -- setp 4 
select round((@numerator)/(sqrt(@deno_1*@deno_2)),2) as corr_coeff


-- 8. High Installs, Low Ratings
-- Find categories where apps are downloaded a lot (many installs) but have low average ratings.
-- This helps the team improve quality in popular categories.
SELECT 
    category,
    AVG(rating) AS Avg_Rating,
    AVG(installs) AS Avg_Insatalls
FROM
    playstore
GROUP BY category
order by Avg_Rating,Avg_Insatalls desc;


-- 9. Which Categories Have Expensive Apps?
-- Find out which categories have the highest average app price (only for paid apps).
-- Useful for pricing decisions.
select * from playstore;

SELECT 
    category, AVG(Price) AS Avg_Price
FROM
    playstore
WHERE
    type = 'Paid'
GROUP BY category
ORDER BY Avg_Price DESC;



-- 10. Fake Ratings Check
-- Find apps with high ratings but very few reviews (less than 50).
-- Maybe they’re not really popular – helps check for fake or biased ratings.
select * from Playstore;

SELECT 
    App, Rating, Reviews
FROM
    playstore
WHERE
    Rating >= 4.5 AND Reviews < 50
ORDER BY Reviews ASC;


-- 11. Does App Size Affect Rating?
--  Group apps by size (Small / Medium / Large) and find out which size has better average ratings.
-- Helps optimize app size for better user feedback.
select* from Playstore;

SELECT 
  CASE 
    WHEN size < 20000 THEN 'Small'
    WHEN size BETWEEN 20000 AND 50000 THEN 'Medium'
    WHEN size > 50000 THEN 'Large'
    ELSE 'Unknown'
  END AS size_category,
  ROUND(AVG(IFNULL(rating, 0)), 2) AS avg_rating
FROM playstore
WHERE size IS NOT NULL AND rating IS NOT NULL
GROUP BY size_category;






-- 12. Age Restriction Apps
-- Find out which categories have more adult apps (rated Mature 17+ or Adults only 18+).
-- Useful for legal and content compliance.
select * from playstore;
SELECT 
    category, COUNT(*) AS Adults_App
FROM
    playstore
WHERE
    Content_Rating IN ('Mature 17+' , 'Adults only 18+')
GROUP BY category
ORDER BY Adults_App DESC; 	             	





-- 13. Old Apps in Playstore
-- Show apps that have not been updated since 2016 or before.
-- May be outdated or no longer useful.
select * from playstore;
SELECT app, category, last_updated
FROM playstore
WHERE YEAR(STR_TO_DATE(last_updated, '%B %d, %Y')) <= 2016;



SELECT app, category, last_updated
FROM playstore
WHERE Last_updated <= 2016;






-- 14. Popular Genres by Year
--  Show which genres are getting more installs each year based on the Last Updated date.
-- Good for finding trending genres.
select * from playstore;
select genres,sum(installs) as  Total_installs ,YEAR(STR_TO_DATE(last_updated, '%B %d, %Y')) AS update_year
 from playstore 
GROUP BY update_year, genres
ORDER BY update_year, total_installs DESC;












-- 15. Same App Name Check
-- Find app names that appear more than once in the data.
-- This helps remove  or check if different developers used the same name.
select * from Playstore;
SELECT 
    app, COUNT(*) AS Count_app
FROM
    playstore
GROUP BY app
HAVING Count_app > 1; 




-- 16. Popular but Low-Rated Apps
--  Find apps with very high downloads (over 1 million) but low ratings (under 3).
-- These need improvement – people are using them but not happy.
SELECT app, installs, rating
FROM playstore
WHERE installs > 1000000 AND rating < 3
ORDER BY installs DESC;




-- 17. what is duration time and fetch time.


-- Duration Time :- Duration time is how long  it takes system to completely understand the instructions given  from start to end  in proper order  and way.
-- Fetch Time :- Once the instructions are completed , fetch ttime is like the time it takes for  the system to hand back the results, it depend on how quickly  ths system
                -- can find  and bring back what you asked for.
                


