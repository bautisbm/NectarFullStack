 --
 -- Fucntion to return the average SOL results of a STEM division
 --


DROP FUNCTION IF EXISTS average_stem_sol(div_num integer, subject text, race text,
gender text, disabil text, lep text, disadva text);

CREATE FUNCTION average_stem_sol(div_num integer, subject text, race text,
text, disabil text, lep text, disadva text)
RETURNS TABLE(sch_year integer, div_name text, avg_score numeric) AS $$

SELECT DISTINCT sch_year, div_name, CAST(AVG(avg_score) AS DECIMAL(10,2))
FROM school AS sch
    JOIN stem_schools AS stem ON sch.div_num = stem.div_num
    JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
WHERE stem.div_num = $1
    AND sch.sch_name LIKE '%High%'
    AND sol.subject = $2
    AND sol.test_name = 'ALL'
    AND race = $3
    AND gender = $4
    AND disabil = $5
    AND lep = $6
    AND disadva = $7
    AND sch_year >= 2012
GROUP BY sch_year, div_name
ORDER BY sch_year;

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION average_stem_sol(div_num integer, subject text, race text, gender text,
disabil text, lep text, disadva text) OWNER TO nectar;
