-- Note: Please consult the directions for this assignment 
-- for the most explanatory version of each question.

-- 1. Select all columns for all brands in the Brands table.

SELECT * From brands;

 id |    name    | founded |            headquarters            | discontinued 
----+------------+---------+------------------------------------+--------------
  1 | Ford       |    1903 | Dearborn, MI                       |             
  2 | Chrysler   |    1925 | Auburn Hills, Michigan             |             
  3 | Citroën    |    1919 | Saint-Ouen, France                 |             
  4 | Hillman    |    1907 | Ryton-on-Dunsmore, England         |         1981
  5 | Chevrolet  |    1911 | Detroit, Michigan                  |             
  6 | Cadillac   |    1902 | New York City, NY                  |             
  7 | BMW        |    1916 | Munich, Bavaria, Germany           |             
  8 | Austin     |    1905 | Longbridge, England                |         1987
  9 | Fairthorpe |    1954 | Chalfont St Peter, Buckinghamshire |         1976
 10 | Studebaker |    1852 | South Bend, Indiana                |         1967
 11 | Pontiac    |    1926 | Detroit, MI                        |         2010
 12 | Buick      |    1903 | Detroit, MI                        |             
 13 | Rambler    |    1901 | Kenosha, Washington                |         1969
 14 | Plymouth   |    1928 | Auburn Hills, Michigan             |         2001
 15 | Tesla      |    2003 | Palo Alto, CA                      |             
(15 rows)


-- 2. Select all columns for all car models made by Pontiac in the Models table.

SELECT * FROM models WHERE brand_name = 'Pontiac';

 id | year | brand_name |    name    
----+------+------------+------------
 25 | 1961 | Pontiac    | Tempest
 27 | 1962 | Pontiac    | Grand Prix
 36 | 1963 | Pontiac    | Grand Prix
 42 | 1964 | Pontiac    | GTO
 43 | 1964 | Pontiac    | LeMans
 44 | 1964 | Pontiac    | Bonneville
 45 | 1964 | Pontiac    | Grand Prix
(7 rows)


-- 3. Select the brand name and model 
--    name for all models made in 1964 from the Models table.

SELECT brand_name, name FROM models WHERE year = '1964';

 brand_name |    name     
------------+-------------
 Chevrolet  | Corvette
 Ford       | Mustang
 Ford       | Galaxie
 Pontiac    | GTO
 Pontiac    | LeMans
 Pontiac    | Bonneville
 Pontiac    | Grand Prix
 Plymouth   | Fury
 Studebaker | Avanti
 Austin     | Mini Cooper
(10 rows)


-- 4. Select the model name, brand name, and headquarters for the Ford Mustang 
--    from the Models and Brands tables.

SELECT m.name, m.brand_name, b.headquarters FROM models AS m  JOIN brands AS b ON m.brand_name = b.name;

       name       | brand_name |            headquarters            
------------------+------------+------------------------------------
 Model T          | Ford       | Dearborn, MI
 Imperial         | Chrysler   | Auburn Hills, Michigan
 2CV              | Citroën    | Saint-Ouen, France
 Minx Magnificent | Hillman    | Ryton-on-Dunsmore, England
 Corvette         | Chevrolet  | Detroit, Michigan
 Corvette         | Chevrolet  | Detroit, Michigan
 Fleetwood        | Cadillac   | New York City, NY
 Corvette         | Chevrolet  | Detroit, Michigan
 Thunderbird      | Ford       | Dearborn, MI
 Corvette         | Chevrolet  | Detroit, Michigan
 Corvette         | Chevrolet  | Detroit, Michigan
 600              | BMW        | Munich, Bavaria, Germany
 Corvette         | Chevrolet  | Detroit, Michigan
 600              | BMW        | Munich, Bavaria, Germany
 Thunderbird      | Ford       | Dearborn, MI
 Mini             | Austin     | Longbridge, England
 Corvette         | Chevrolet  | Detroit, Michigan
 600              | BMW        | Munich, Bavaria, Germany
 Corvair          | Chevrolet  | Detroit, Michigan
 Corvette         | Chevrolet  | Detroit, Michigan
 Rockette         | Fairthorpe | Chalfont St Peter, Buckinghamshire
 Mini Cooper      | Austin     | Longbridge, England
 Avanti           | Studebaker | South Bend, Indiana
 Tempest          | Pontiac    | Detroit, MI
 Corvette         | Chevrolet  | Detroit, Michigan
 Grand Prix       | Pontiac    | Detroit, MI
 Corvette         | Chevrolet  | Detroit, Michigan
 Avanti           | Studebaker | South Bend, Indiana
 Special          | Buick      | Detroit, MI
 Mini             | Austin     | Longbridge, England
 Mini Cooper S    | Austin     | Longbridge, England
 Classic          | Rambler    | Kenosha, Washington
 E-Series         | Ford       | Dearborn, MI
 Avanti           | Studebaker | South Bend, Indiana
 Grand Prix       | Pontiac    | Detroit, MI
 Corvair 500      | Chevrolet  | Detroit, Michigan
 Corvette         | Chevrolet  | Detroit, Michigan
 Corvette         | Chevrolet  | Detroit, Michigan
 Mustang          | Ford       | Dearborn, MI
 Galaxie          | Ford       | Dearborn, MI
 GTO              | Pontiac    | Detroit, MI
 LeMans           | Pontiac    | Detroit, MI
 Bonneville       | Pontiac    | Detroit, MI
 Grand Prix       | Pontiac    | Detroit, MI
 Fury             | Plymouth   | Auburn Hills, Michigan
 Avanti           | Studebaker | South Bend, Indiana
 Mini Cooper      | Austin     | Longbridge, England
(47 rows)


-- 5. Select all rows for the three oldest brands 
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).

SELECT * FROM brands ORDER BY founded LIMIT 3;

id |    name    | founded |    headquarters     | discontinued 
----+------------+---------+---------------------+--------------
 10 | Studebaker |    1852 | South Bend, Indiana |         1967
 13 | Rambler    |    1901 | Kenosha, Washington |         1969
  6 | Cadillac   |    1902 | New York City, NY   |             
(3 rows)

-- 6. Count the Ford models in the database (output should be a number).

SELECT COUNT(name) FROM models WHERE brand_name = 'Ford';

count 
-------
     6
(1 row)

-- 7. Select the name of any and all car brands that are not discontinued.

SELECT name FROM brands WHERE discontinued IS NULL;

   name    
-----------
 Ford
 Chrysler
 Citroën
 Chevrolet
 Cadillac
 BMW
 Buick
 Tesla
(8 rows)

-- 8. Select rows 15-25 of the DB in alphabetical order by model name.

SELECT * FROM models ORDER BY name LIMIT 10 OFFSET 15;

 id | year | brand_name |   name   
----+------+------------+----------
 10 | 1956 | Chevrolet  | Corvette
 17 | 1959 | Chevrolet  | Corvette
  8 | 1955 | Chevrolet  | Corvette
  6 | 1954 | Chevrolet  | Corvette
 20 | 1960 | Chevrolet  | Corvette
 26 | 1961 | Chevrolet  | Corvette
 39 | 1964 | Chevrolet  | Corvette
 38 | 1963 | Chevrolet  | Corvette
  5 | 1953 | Chevrolet  | Corvette
 34 | 1963 | Ford       | E-Series
(10 rows)


-- 9. Select the brand, name, and year the model's brand was 
--    founded for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be NULL if 
--    the brand is not in the Brands table.)

SELECT m.brand_name, m.name, b.founded 
FROM models AS m 
LEFT JOIN brands AS b 
ON b.name = m.brand_name 
WHERE m.year = 1960;

 brand_name |   name   | founded 
------------+----------+---------
 Chevrolet  | Corvette |    1911
 Chevrolet  | Corvair  |    1911
 Fairthorpe | Rockette |    1954
 Fillmore   | Fillmore |        
(4 rows)




-- Part 2: Change the following queries according to the specifications. 
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all brands that are not discontinued
-- regardless of whether they have any models in the models table.
-- before:
    SELECT b.name,
           b.founded,
           m.name
    FROM brands AS b
      LEFT JOIN models as m
        ON b.name = m.brand_name
    WHERE b.discontinued IS NULL;

-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before: 
    SELECT m.name,
           m.brand_name,
           b.founded
    FROM models AS m
      JOIN brands AS b
        ON b.name = m.brand_name;

-- followup question: In your own words, describe the difference between 
-- left joins and inner joins.
    
    -- Left joins connect two tables in a way that all of the elements in the left table are 
    -- listed and the elements of the right table are only listed if they match with a 
    -- defined criteria from the left table.

    -- Inner joins connect two tables and list out only the elements that match based on a certain 
    -- common criteria.

-- 3. Modify the query so that it only selects brands that don't have any models in the models table. 
-- (Hint: it should only show Tesla's row.)
-- before: 
    SELECT brands.name,
           brands.founded
    FROM Brands
      LEFT JOIN Models
        ON brands.name = Models.brand_name
    WHERE Models.year IS NULL;

-- 4. Modify the query to add another column to the results to show 
-- the number of years from the year of the model until the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before: 
     

    SELECT b.name,
           m.name,
           m.year,
           b.discontinued, 
           CASE WHEN b.discontinued IS NOT NULL THEN (b.discontinued - m.year)
           ELSE NULL END AS years_until_brand_discontinued
    FROM Models AS m
      LEFT JOIN brands AS b
        ON m.brand_name = b.name
        WHERE b.discontinued IS NOT NULL;
  
  

-- Part 3: Further Study

-- 1. Select the name of any brand with more than 5 models in the database.

-- 2. Add the following rows to the Models table.

-- year    name       brand_name
-- ----    ----       ----------
-- 2015    Chevrolet  Malibu
-- 2015    Subaru     Outback

-- 3. Write a SQL statement to crate a table called `Awards`
--    with columns `name`, `year`, and `winner`. Choose
--    an appropriate datatype and nullability for each column
--   (no need to do subqueries here).

-- 4. Write a SQL statement that adds the following rows to the Awards table:

--   name                 year      winner_model_id
--   ----                 ----      ---------------
--   IIHS Safety Award    2015      the id for the 2015 Chevrolet Malibu
--   IIHS Safety Award    2015      the id for the 2015 Subaru Outback

-- 5. Using a subquery, select only the *name* of any model whose 
-- year is the same year that *any* brand was founded.





