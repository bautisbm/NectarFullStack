-- Returns the postsecondary enrollment count of each high school in a division
--

DROP FUNCTION IF EXISTS postsec_enroll_per_stemschool(div_name text);

CREATE FUNCTION highSchScores_per_StemDiv(div_name text)
RETURNS TABLE(ps_enrollment_cnt integer, sch_name text, sch_year integer, ps_institution_type integer) AS $$



SELECT DISTINCT post.ps_enrollment_cnt, stem.sch_name, post.sch_year, div.div_name
FROM stem_schools AS stem
	JOIN postsec_enroll AS post ON stem.div_num = post.div_num
	JOIN division AS div ON stem.div_num = div.div_num
WHERE stem.div_num = $1
	AND stem.sch_num NOT IN(8888,9997)
	AND stem.sch_name LIKE '%High%'
	AND race = 'ALL'
	AND gender = 'ALL'
	AND lep = 'ALL'
	AND disadva = 'ALL'
	AND post.enroll_graduate_cnt > 0 
	AND post.ps_institution_type = 1
ORDER BY sch_name, sch_year

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION postsec_enroll_per_stemschool(div_name text) OWNER TO nectar;


