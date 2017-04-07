
DROP FUNCTION IF EXISTS postsec_enroll_per_stemschool(div_num integer);

CREATE FUNCTION postsec_enroll_per_stemschool(div_num integer)
RETURNS TABLE(sch_year integer, sch_name text, total_enrollment_cnt bigint) AS $$


SELECT DISTINCT post.sch_year, stem.sch_name, SUM (ps_enrollment_cnt) as total_enrollment_cnt
FROM stem_schools AS stem
	JOIN school as sch ON stem.div_num = sch.div_num
	JOIN postsec_enroll AS post ON stem.div_num = post.div_num AND sch.sch_num = post.sch_num
WHERE stem.div_num = $1
	AND stem.sch_num NOT IN(8888,9997)
	AND race = 'ALL'
	AND gender = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
	AND post.enroll_graduate_cnt > 0 
	AND post.ps_institution_type != 2 
	AND post.ps_institution_type != 0
GROUP BY sch_year, stem.sch_name, stem.div_num
ORDER BY sch_name, sch_year

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION postsec_enroll_per_stemschool(div_num integer) OWNER TO nectar;


