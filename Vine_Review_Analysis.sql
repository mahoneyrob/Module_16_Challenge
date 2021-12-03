CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT PRIMARY KEY
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Step 1
SELECT *
  FROM vine_table 
 WHERE total_votes >= 20;
 
-- Step 2
SELECT *
  FROM vine_table 
 WHERE total_votes >= 20
   AND (CAST(helpful_votes AS REAL) / total_votes) >= 0.5;

-- Step 3   
SELECT *
  FROM vine_table 
 WHERE total_votes >= 20
   AND (CAST(helpful_votes AS REAL) / total_votes) >= 0.5
   AND vine = 'Y';

-- Step 4 
SELECT *
  FROM vine_table 
 WHERE total_votes >= 20
   AND (CAST(helpful_votes AS REAL) / total_votes) >= 0.5
   AND vine = 'N';

-- Step 5
  SELECT vine, 
         COUNT(*) AS total_reviews, 
         COUNT(CASE WHEN star_rating = 5 THEN 1 END) AS five_star_reviews,
	 ROUND(100 * COUNT(CASE WHEN star_rating = 5 THEN 1 END) / CAST(COUNT(*) AS NUMERIC), 2) AS percent_five_star
    FROM vine_table
   WHERE vine IS NOT NULL
GROUP BY vine;
