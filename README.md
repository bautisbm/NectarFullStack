# nectar
Data-bassnectar


# DESCRIPTION
#### As of 2/17/17
Our application enables policy makers to view the correlations between Virgina school divisions that have Governer's STEM program versus those divisions that do not. Both sides will include information such as high school locations, their divisions, their test scores, student graduation count, and their post secondary acceptance rates to higher education institutions. The data we have is the basic division and school information taken from vdoe, with sol, cohort, and post secondary achievement/enrollment tables.

# APPLICATION information
Our application is deployed using the Apache Tomcat server to connect to the nectar database which is written in postgreSQL. By using jsp's with embedded Java scriplets, the application retrieves and displays information by running queries (via a db package containing Java classes) through a front-end webpage form. 
