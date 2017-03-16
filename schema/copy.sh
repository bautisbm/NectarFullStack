#!/bin/sh
# Run this script directly on the db server.

echo COPY division FROM vdoe
psql -c "COPY (
    SELECT div_num, div_name, loc_code, loc_type, region, city, zip
    FROM division
  ) TO STDOUT;" vdoe | \
  psql -c "COPY division FROM STDIN;" nectar

echo COPY school FROM vdoe
psql -c "COPY (
    SELECT d.div_num, d.div_name, sch_num, sch_name, sch_desc, d.city, d.zip
    FROM school as s
    JOIN division as d on d.div_num = s.div_num
  ) TO STDOUT;" vdoe | \
  psql -c "COPY school FROM STDIN;" nectar


echo COPY stem_schools FROM vdoe
psql -c "COPY (
    SELECT d.div_num, d.div_name, sch_num, sch_name, sch_desc, d.city, d.zip
    FROM school as s
    JOIN division as d on d.div_num = s.div_num
    WHERE sch_desc LIKE '%STEM%'
  ) TO STDOUT;" vdoe | \
  psql -c "COPY stem_schools FROM STDIN;" nectar


echo COPY enroll FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      grade_num, fall_cnt
    FROM fall_membership
    WHERE sch_year = 2014
  ) TO STDOUT;" vdoe | \
  psql -c "COPY enroll FROM STDIN;" nectar


echo COPY sol_test_data FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      subject, test_name, test_level, avg_score,
      pass_advn, pass_prof, pass_rate, fail_rate
    FROM sol_test_data
    WHERE sch_year >= 2012
  ) TO STDOUT;" vdoe | \
  psql -c "COPY sol_test_data FROM STDIN;" nectar


echo COPY postsec_enroll FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      enroll_graduate_cnt, ps_institution_type,
      ps_enrollment_cnt
    FROM postsec_enroll
    WHERE sch_year = 2014
  ) TO STDOUT;" vdoe | \
  psql -c "COPY postsec_enroll FROM STDIN;" nectar


echo COPY hs_graduate FROM vdoe
psql -c "COPY (
    SELECT
      diploma_num, graduate_cnt, sch_year,
      div_num, sch_num, race, gender, disabil,
      lep, disadva
    FROM hs_graduate
    WHERE sch_year = 2014
  ) TO STDOUT;" vdoe | \
  psql -c "COPY hs_graduate FROM STDIN;" nectar


echo COPY ontime_cohort FROM vdoe
psql -c "COPY (
    SELECT
      cohort_cnt, diploma_rate, dropout_rate,
      sch_year, div_num, sch_num, race, gender, 
      disabil, lep, disadva
    FROM ontime_cohort
    WHERE sch_year = 2014
  ) TO STDOUT;" vdoe | \
  psql -c "COPY ontime_cohort FROM STDIN;" nectar


echo COPY college FROM csv
psql -c "\copy college FROM college.csv WITH CSV HEADER" nectar


echo COPY cte_comp FROM csv
psql -c "\copy cte_comp FROM cte_comp.csv WITH CSV HEADER" nectar

echo COPY stem_schools from csv
psql -c "\copy stem_schools FROM stem_schools.csv WITH CSV HEADER" nectar


echo COPY school from csv
psql -c "\copy school FROM stem_schools.csv WITH CSV HEADER" nectar
