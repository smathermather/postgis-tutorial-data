CREATE OR REPLACE FUNCTION height_classify(numeric)
  RETURNS integer AS
$BODY$
  
SELECT
    CASE WHEN $1 < 10 THEN 1
         WHEN $1 >= 10 AND $1 < 20 THEN 2
         WHEN $1 >= 20 AND $1 < 30 THEN 3
         WHEN $1 >= 30 AND $1 < 40 THEN 4
         WHEN $1 >= 40 AND $1 < 50 THEN 5
         WHEN $1 >= 50 AND $1 < 60 THEN 6
         WHEN $1 >= 60 AND $1 < 70 THEN 7
         WHEN $1 >= 70 AND $1 < 80 THEN 8
         WHEN $1 >= 80 AND $1 < 90 THEN 9
         WHEN $1 >= 90 AND $1 < 100 THEN 10
         WHEN $1 >= 100 AND $1 < 110 THEN 11
         WHEN $1 >= 110 AND $1 < 120 THEN 12
         WHEN $1 >= 120 AND $1 < 130 THEN 13
         WHEN $1 >= 130 AND $1 < 140 THEN 14
         WHEN $1 >= 140 AND $1 < 150 THEN 15
         WHEN $1 >= 150 AND $1 < 160 THEN 16
         WHEN $1 >= 160 AND $1 < 170 THEN 17      
         WHEN $1 >= 170 AND $1 < 180 THEN 18
         ELSE 0
    END
    FROM test;
  
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;