--
-- Fucntion to return high school num/name per stem academy division
--


DROP FUNCTION IF EXISTS highSchs_per_stemDiv(div_name text);

CREATE FUNCTION highSchs_per_stemDiv(div_name text)
RETURNS TABLE(sch_num integer, sch_name text) AS $$

SELECT DISTINCT sch.sch_num, sch.sch_name
FROM stem_schools AS stem
	JOIN school AS sch ON stem.div_num = sch.div_num
WHERE stem.div_name = $1
	AND sch.sch_num NOT IN(8888,9997)
	AND sch.sch_name LIKE '%High%'

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION highSchs_per_stemDiv(div_name text) OWNER TO nectar;











