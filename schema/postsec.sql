--
-- Fix truncated sch_num in postsec_enroll (770,541 rows)
--


INSERT INTO spelling VALUES ('092', '0930', 'Pocahontas High/Middle');

-- verify replacement table (510 unique: div_num, sch_num, sch_name)
SELECT DISTINCT p.div_num, p.sch_num, p.sch_name, s.sch_num AS fix_num
FROM postsec_enroll AS p LEFT JOIN spelling AS s
     ON p.div_num::text = s.div_num
    AND (p.sch_num IS NULL AND s.sch_num IS NULL
        OR (s.sch_num LIKE p.sch_num::text || '_')) -- missing digit
    AND p.sch_name = s.sch_name
ORDER BY p.div_num, p.sch_num, p.sch_name, s.sch_num;

CREATE TABLE postsec_enroll2 AS
  SELECT
    p.school_year,
    p.div_num, 
    s.sch_num AS sch_num,
    federal_race_code AS race, 
    gender, 
    disability_flag AS disabil, 
    lep_flag AS lep, 
    disadvantaged_flag AS disadva,
    cohort_graduate_cnt AS enroll_graduate_cnt, 
    ps_institution_type, 
    ps_enrollment_cnt
  FROM postsec_enroll AS p, spelling AS s
  WHERE p.div_num = s.div_num
    AND (p.sch_num IS NULL AND s.sch_num IS NULL
        OR (s.sch_num LIKE p.sch_num || '_')) -- missing digit
    AND p.sch_name = s.sch_name

DROP TABLE spelling;

GRANT SELECT ON postsec_enroll2 TO public;

COMMENT ON TABLE postsec_enroll2
  IS 'HS grads who enrolled in public higher ed in VA and earned credit';

DROP TABLE postsec_enroll;
ALTER TABLE postsec_enroll2 RENAME TO postsec_enroll;

ANALYZE VERBOSE postsec_enroll;
SELECT count(*) FROM postsec_enroll;
