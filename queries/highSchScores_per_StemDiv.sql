
-- Returns the avg subject sol scores of each high school in a division
--

DROP FUNCTION IF EXISTS highSchScores_per_StemDiv(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text);

CREATE FUNCTION highSchScores_per_StemDiv(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text)
RETURNS TABLE(sch_year integer, sch_num integer, sch_name text, avg_score integer) AS $$



SELECT DISTINCT sol.sch_year, sch.sch_num, sch.sch_name, avg_score
FROM stem_schools AS stem
	JOIN school AS sch ON stem.div_num = sch.div_num
	JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
WHERE stem.div_num = $1
	AND sch.sch_num NOT IN(8888,9997)
	AND sch.sch_name LIKE '%High%'
	AND sol.subject = $2
	AND sol.test_name = 'ALL'
	AND race = $3
	AND gender = $4
	AND disabil = $5
	AND lep = $6
	AND disadva = $7
ORDER BY sch_year, sch_num

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION highSchScores_per_StemDiv(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text) OWNER TO nectar;