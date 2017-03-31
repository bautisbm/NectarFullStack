--
-- Fucntion to return avg SOL results of a non stem division
-- 


DROP FUNCTION IF EXISTS normDiv_solSubResultavgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text);

CREATE FUNCTION normDiv_solSubResultavgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text)
RETURNS TABLE(sch_year integer, div_name text, avg_score numeric) AS $$

SELECT DISTINCT sch_year, d.div_name AS div, CAST(AVG(avg_score) AS DECIMAL(10,2)) 
FROM school AS sch
	JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
	JOIN division AS d ON d.div_num = sch.div_num
WHERE sch.sch_name LIKE '%High%'
	AND d.div_num = $1
	AND sch.div_num NOT IN(7,18,21,29,41,53,60,63,77,80,83,89,112,113,115,117,123,128,136)
	AND sol.subject = $2
	AND sol.test_name = 'ALL'
	AND race = $3
	AND gender = $4
	AND disabil = $5
	AND lep = $6
	AND disadva = $7
	AND sch_year >= 2012
GROUP BY sch_year, div
ORDER BY sch_year, div

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION normDiv_solSubResultavgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text) OWNER TO nectar;











