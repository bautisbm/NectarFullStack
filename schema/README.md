# GROUP NAME

Database Nectar ("nectar")


# DESCRIPTION

Our application enables policy makers to view the correlations between Virgina school divisions that have Governer's STEM program versus those divisions that do not. Both sides will include information such as high school locations, their divisions, their test scores, and their post secondary acceptance rates to higher education institutions. Currently, the data we have is the basic division and school information taken from vdoe, with sol, cohort, and post secondary achievement/enrollment tables filled with information from 2014 as a start. We also include a csv file imported from VLDS on CTE data for the year 2014.

#### CVS LINKS
- CTE data - http://www.doe.virginia.gov/statistics_reports/research_data/data_files/cte_comp/2013-cte-comp.csv
- NCES IPEDS Colleges List - http://www.weebly.com/uploads/1/1/1/0/11104538/nces_ipeds_2010_listings_vaonly.csv

## STEPS TO CREATE DATABASE

### FOR CSV FILES:
- Download the a file, such as "NCES IPEDS Colleges List" from: http://www.weebly.com/uploads/1/1/1/0/11104538/nces_ipeds_2010_listings_vaonly.csv
  - NCES = National Center for Education Statistics
  - IPEDS = Integrated Post Secondary Education System
- Use a spreadsheet to save columns the number of needed columns to a file name of your choice, such as college.csv.
- Perform the first step of the "TO PULL INFORMATION FROM VDOE:" listed below
- Add to the copy.sh file as follows
```
echo COPY college FROM csv
psql -c "\copy college FROM college.csv WITH CSV HEADER" nectar
```



### TO PULL INFORMATION FROM VDOE:
- Run create.sql to create tables with group ownership.
First modify the file for each table you want to create.
For each table, add the following lines:
```
DROP TABLE IF EXISTS division;

CREATE TABLE division (
        div_num integer NOT NULL,
        div_name text NOT NULL,
        loc_code integer NOT NULL,
        loc_type text NOT NULL,
        region integer NOT NULL,
        city text,
        zip text NOT NULL
);

ALTER TABLE division OWNER TO nectar;

COMMENT ON TABLE division IS 'all divisions in Virginia';
```
- Run copy.sh on db.cs.jmu.edu to copy data from VDOE.
  -For each table you created in create.sql, you must modify the copy.sh file accordingly
```
echo COPY division FROM vdoe
psql -c "COPY ( SELECT div_num, div_name, loc_code, loc_type, region, city, zip
                FROM division
              ) TO STDOUT;" vdoe | \
psql -c "COPY division FROM STDIN;" nectar
```
What happens here is that for each table name, in the example above 'division', you must create a pair for it in this file that matches the name of the table in the create.sql file. You will want to also make sure the attribute names in each file line up.


- Run stats.sql to count rows and analyze the tables.
  - First edit the file, again making you sure you edit the following for each table you are creating, such as the division table above
```
ANALYZE VERBOSE division;
SELECT count(*) AS div_cnt FROM division;
```

