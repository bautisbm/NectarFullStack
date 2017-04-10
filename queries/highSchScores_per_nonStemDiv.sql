
-- Returns the avg subject sol scores of each high school in a non STEM division
--

DROP FUNCTION IF EXISTS highSchScores_per_nonStemDiv(div_num integer, subject text);

CREATE FUNCTION highSchScores_per_nonStemDiv(div_num integer, subject text)
RETURNS TABLE(sch_year integer, sch_num integer, sch_name text, avg_score integer) AS $$



SELECT DISTINCT sol.sch_year, nonStem.sch_num, nonStem.sch_name, avg_score
FROM non_stem_schools AS nonStem
	JOIN division AS div ON nonStem.div_num = div.div_num
	JOIN sol_test_data AS sol ON nonStem.div_num = sol.div_num AND nonStem.sch_num = sol.sch_num
WHERE div.div_num = $1
	AND nonStem.sch_num NOT IN(8888,9997)
	AND nonStem.sch_name LIKE '%High%'
	AND sol.subject = $2
	AND sol.test_name = 'ALL'
	AND race = 'ALL'
	AND gender = 'ALL'
	AND disabil = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
ORDER BY sch_year, sch_num

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION highSchScores_per_nonStemDiv(div_num integer, subject text) OWNER TO nectar;