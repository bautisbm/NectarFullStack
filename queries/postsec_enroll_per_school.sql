DROP FUNCTION IF EXISTS postsec_enroll_per_school(div_num integer);

CREATE FUNCTION postsec_enroll_per_school(div_num integer)
RETURNS TABLE(sch_year integer, div_name text, total_enrollment_cnt bigint) AS $$


SELECT DISTINCT post.sch_year, sch.sch_name, SUM (ps_enrollment_cnt) as total_enrollment_cnt
FROM school AS sch
	JOIN postsec_enroll AS post ON sch.div_num = post.div_num AND sch.sch_num = post.sch_num
WHERE sch.div_num = $1
	AND sch.sch_num NOT IN(8888,9997)
	AND sch.sch_name LIKE '%High%'
	AND race = 'ALL'
	AND gender = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
	AND post.enroll_graduate_cnt > 0 
	AND post.ps_institution_type != 2 
	AND post.ps_institution_type != 0
GROUP BY sch_year, sch.sch_name, sch.div_num
ORDER BY sch_name, sch_year

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION postsec_enroll_per_school(div_num integer) OWNER TO nectar;
