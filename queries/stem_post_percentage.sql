DROP FUNCTION IF EXISTS stem_post_percentage(div_num integer);

CREATE FUNCTION stem_post_percentage(div_num integer)
RETURNS TABLE(sch_year integer, ps_enrollment_cnt numeric) AS $$



WITH grad_count AS (
SELECT sch_year, CAST(SUM(ps_enrollment_cnt) AS DECIMAL (10,2)) AS grad_seniors
FROM
(
    SELECT DISTINCT post.sch_year, SUM (ps_enrollment_cnt) AS ps_enrollment_cnt
    FROM stem_schools AS stem
      JOIN school AS sch ON stem.div_num = sch.div_num
      JOIN postsec_enroll AS post ON stem.div_num = post.div_num AND sch.sch_num = post.sch_num
    WHERE sch.div_num = $1
      AND race = 'ALL'
    	AND gender = 'ALL'
    	AND lep = 'ALL'
    	AND disadva = 'ALL'
    	AND disabil = 'ALL'
    	AND post.enroll_graduate_cnt > 0
    	AND post.ps_institution_type = 0
	    GROUP BY post.sch_year, sch.div_num
) total
GROUP BY sch_year
ORDER BY sch_year),

total_count AS (
    SELECT DISTINCT sch_year, fall_cnt AS total_seniors
    FROM enroll AS e
      JOIN school as s USING(div_num)
    WHERE div_num = $1
      AND e.sch_num = 0
      AND race = 'ALL'
      AND gender = 'ALL'
      AND lep = 'ALL'
      AND disadva = 'ALL'
      AND disabil = 'ALL'
      AND s.sch_name like '%High%'
      AND grade_num = 12
      AND sch_year <= 2010
    ORDER BY sch_year)

SELECT  tc.sch_year, CAST(((gc.grad_seniors / tc.total_seniors) * 100) AS DECIMAL (10,4)) AS percentage
FROM total_count tc, grad_count gc
WHERE gc.sch_year = tc. sch_year




$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION stem_post_percentage(div_num integer) OWNER TO nectar;
