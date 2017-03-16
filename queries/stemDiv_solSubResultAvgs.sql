--
-- Fucntion to return SOL results of STEM divs
--


DROP FUNCTION IF EXISTS stemDiv_solSubResultAvgs(div_name text, subject text);

CREATE FUNCTION stemDiv_solSubResultAvgs(div_name text, subject text)
RETURNS TABLE(sch_year integer, div_name text, avg_score decimal(3,2)) AS $$

SELECT DISTINCT sch_year, stem.div_name AS div, CAST(AVG(avg_score) AS DECIMAL(10,2))
FROM stem_schools AS stem
        JOIN school AS sch ON stem.div_num = sch.div_num
        JOIN sol_test_data AS sol ON sch.div_num = sol.div_num AND sch.sch_num = sol.sch_num
WHERE div_name = $1
        AND sch.sch_name LIKE '%High%'
        AND sol.subject = $2
        AND sol.test_name = 'ALL'
        AND race = 'ALL'
        AND gender = 'ALL'
        AND disabil = 'ALL'
        AND lep = 'ALL'
        AND disadva = 'ALL'
        AND sch_year >= 2012
GROUP BY sch_year, div
ORDER BY sch_year, div


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION stemDiv_solSubResultAvgs(div_name text, subject text) OWNER TO nectar;
