--
-- Fucntion to return SOL results of normal divs
-- NOT FINISHED


--DROP FUNCTION IF EXISTS normDiv_solSubResultAvgs(div_name text, subject text);

--CREATE FUNCTION normDiv_solSubResultAvgs(div_name text, subject text)
--RETURNS TABLE(sch_year integer, div_name text, avg_score float) AS $$

SELECT DISTINCT sch_year, sch.div_num AS div, AVG(avg_score) AS avg1 
FROM school AS sch
	JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
WHERE sch.sch_name LIKE '%High%'
	AND sol.subject = 'ALL'
	AND sol.test_name = 'ALL'
	AND race = 'ALL'
	AND gender = 'ALL'
	AND disabil = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
	AND sch_year >= 2012
GROUP BY sch_year, div
ORDER BY sch_year, div


--$$ LANGUAGE SQL STABLE STRICT;

--ALTER FUNCTION stemDiv_solSubResultAvgs(div_name text, subject text) OWNER TO nectar;











