# nectar
Data-bassnectar


# DESCRIPTION

Our application enables policy makers to view the correlations between Virgina school divisions that have Governer's STEM program versus those divisions that do not. Both sides will include information such as high school locations, their divisions, their test scores, and their post secondary acceptance rates to higher education institutions. Currently, the data we have is the basic division and school information taken from vdoe, with sol, cohort, and post secondary achievement/enrollment tables filled with information from 2014 as a start.

## STEPS TO CREATE DATABASE

### FOR CSV FILES:
- Download the "NCES IPEDS Colleges List" from: http://www.weebly.com/uploads/1/1/1/0/11104538/nces_ipeds_2010_listings_vaonly.csv
NCES = National Center for Education Statistics
IPEDS = Integrated Post Secondary Education System
- Use a spreadsheet to save columns A-F to college.csv.
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
DROP TABLE IF EXISTS [table name];
CREATE TABLE [table name] ( [comma separated list of attributes] );
ALTER TABLE [table name] OWNER TO nectar;
COMMENT ON TABLE [table name] IS [comment];
```
- Run copy.sh on db.cs.jmu.edu to copy data from VDOE.
For each table you created in create.sql, you must modify the copy.sh file accordingly
```
echo COPY division FROM vdoe
psql -c "COPY ( SELECT div_num, div_name, loc_code, loc_type, region, city, zip
                FROM division
              ) TO STDOUT;" vdoe | \
psql -c "COPY division FROM STDIN;" nectar
```
What happens here is that for each table name, in the example above 'division', you must create a pair for it in this file that matches the name of the table in the create.sql file. You will want to also make sure the attribute names in each file line up.


- Run stats.sql to count rows and analyze the tables.
