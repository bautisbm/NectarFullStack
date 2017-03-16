--
-- Fucntion to return SOL results of normal divs
-- 


--DROP FUNCTION IF EXISTS normDiv_solSubResultAvgs(div_name text, subject text);

--CREATE FUNCTION normDiv_solSubResultAvgs(div_name text, subject text)
--RETURNS TABLE(sch_year integer, div_name text, avg_score decimal(3,2)) AS $$

SELECT DISTINCT sch_year, d.div_name AS div, sol.test_level, CAST(AVG(avg_score) AS DECIMAL(10,2)) 
FROM school AS sch
	JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
	JOIN division AS d ON d.div_num = sch.div_num
WHERE sch.sch_name LIKE '%High%'
	AND d.div_name = 'Prince William County'
	AND sch.div_num NOT IN(7,18,21,29,41,53,60,63,77,80,83,89,112,113,115,117,123,128,136)
	AND sol.subject = 'MATH'
	AND sol.test_name = 'ALL'
	AND race = 'ALL'
	AND gender = 'ALL'
	AND disabil = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
	AND sch_year >= 2012
GROUP BY sch_year, div, sch.sch_name, sol.test_level
ORDER BY sch_year, div

--$$ LANGUAGE SQL STABLE STRICT;

--ALTER FUNCTION normDiv_solSubResultAvgs(div_name text, subject text) OWNER TO nectar;











