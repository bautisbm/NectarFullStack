#!/bin/sh
# Run this script directly on the db server.

echo COPY division FROM vdoe
psql -c "COPY (
    SELECT div_num, div_name
    FROM division
  ) TO STDOUT;" vdoe | \
  psql -c "COPY division FROM STDIN;" nectar

echo COPY school FROM vdoe
psql -c "COPY (
    SELECT div_num, sch_num, sch_name
    FROM school
  ) TO STDOUT;" vdoe | \
  psql -c "COPY school FROM STDIN;" nectar

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

echo COPY college FROM csv
psql -c "\copy college FROM college.csv WITH CSV HEADER" nectar
