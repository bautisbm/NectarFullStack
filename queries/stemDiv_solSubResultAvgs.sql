--
-- Fucntion to return the average SOL results of a STEM division
--


DROP FUNCTION IF EXISTS stemDiv_solSubResultAvgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text);

CREATE FUNCTION stemDiv_solSubResultAvgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text)
RETURNS TABLE(sch_year integer, div_name text, avg_score decimal(3,2)) AS $$

SELECT DISTINCT sch_year, stem.div_name AS div, CAST(AVG(avg_score) AS DECIMAL(10,2))
FROM stem_schools AS stem
        JOIN school AS sch ON stem.div_num = sch.div_num
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
GROUP BY sch_year, div
ORDER BY sch_year, div


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION stemDiv_solSubResultAvgs(div_num integer, subject text, race text, gender text, disabil text, lep text, disadva text) OWNER TO nectar;
