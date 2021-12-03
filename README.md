# Overview

#### The purpose of this analysis was to analyze the reviews for products on Amazon.  We used data on an Amazon S3 server that had product reviews (I chose tools), cleaned and filtered the data to match the schema given for the SQL database, and then used the RDS service from Amazon to link our pySpark code to the postgres SQL database.  We then got to choose which method of analysis we wanted to apply, I chose SQL.

## Results

#### The results were fairly straightforward in that the reporting only looked at a small subsection of reviews.  First, we only looked at products with 20 or more reviews, and we broke it out in to if the review was part of Amazon's vine program or not.  My results showed that the percent of 5 star reviews were quite high, above 50 percent in both subsets.  There were 1,733,334 non-vine reviews, with 1,109,235, or about 64% being 5 star, and 7,761 vine reviews, with 4,328, or about 55%, as 5 star.

## Summary

#### There does not appear to be a bias in the vine reviews as the percent of 5 star reviews are lower than the percent of 5 star reviews not in the vine program. However, digging deeper I did notice one thing, and that is that the average score for the vine review program is marginally higher.  The vine program has about an average review of 4.4, while the non vine program is at 4.26.  I got this data by adding a column in my SQL query as: AVG(star_rating)