DROP TABLE IF EXISTS division;

CREATE TABLE division (
    	div_num integer PRIMARY KEY,
    	div_name text NOT NULL,
    	loc_code integer NOT NULL,
    	loc_type text NOT NULL,
	region integer NOT NULL,
	city text NOT NULL,
	state text NOT NULL,
	zip text NOT NULL 
);

ALTER TABLE division OWNER TO nectar;

COMMENT ON TABLE division IS 'all divisions in Virginia';





DROP TABLE IF EXISTS school;

CREATE TABLE school (
    	div_num integer NOT NULL,
    	sch_num integer NOT NULL,
    	sch_name text NOT NULL,
	city text,
	state text,
	zip text
);

ALTER TABLE school OWNER TO nectar;

COMMENT ON TABLE school IS 'all schools in Virginia';





DROP TABLE IF EXISTS enroll;

CREATE TABLE enroll (
    	sch_year integer NOT NULL,
    	div_num integer NOT NULL,
    	sch_num integer NOT NULL,
    	race text NOT NULL,
    	gender text NOT NULL,
    	disabil text NOT NULL,
    	lep text NOT NULL,
       	disadva text NOT NULL,
    	grade_num integer NOT NULL,
    	fall_cnt integer NOT NULL
);

ALTER TABLE enroll OWNER TO nectar;

COMMENT ON TABLE enroll IS 'fall membership counts';





DROP TABLE IF EXISTS sol_test_data;

CREATE TABLE sol_test_data (
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	sch_num integer NOT NULL,	
    	race text NOT NULL,
    	gender text NOT NULL,
    	disabil text NOT NULL,
    	lep text NOT NULL,
    	disadva text NOT NULL,
	subject text NOT NULL,
	test_name text NOT NULL,
	test_level text NOT NULL,
	avg_score integer,
	pass_advn real NOT NULL,
	pass_prof real NOT NULL,
	pass_rate real NOT NULL,
	fail_rate real NOT NULL
);

ALTER TABLE sol_test_data OWNER TO nectar;

COMMENT ON TABLE sol_test_data IS 'sol test data per division/school';



DROP TABLE IF EXISTS postsec_enroll;

CREATE TABLE postsec_enroll(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	sch_num integer NOT NULL,
   	race text NOT NULL,
    gender text NOT NULL,
    disabil text NOT NULL,
    lep text NOT NULL,
    disadva text NOT NULL,
	enroll_graduate_cnt integer NOT NULL,
	ps_institution_type integer NOT NULL,
	ps_enrollement_cnt integer NOT NULL
);

ALTER TABLE postsec_enroll OWNER TO nectar;

COMMENT ON TABLE postsec_enroll IS 'post secondary enrollment data per division/school';





DROP TABLE IF EXISTS hs_graduate;

CREATE TABLE hs_graduate(
	diploma_num integer NOT NULL,
	graduate_cnt integer NOT NULL,
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
	sch_num integer NOT NULL,
   	race text NOT NULL,
    	gender text NOT NULL,
    	disabil text NOT NULL,
    	lep text NOT NULL,
    	disadva text NOT NULL
);

ALTER TABLE hs_graduate OWNER TO nectar;

COMMENT ON TABLE hs_graduate IS 'high school enrollment data per division/school';





DROP TABLE IF EXISTS ontime_cohort;

CREATE TABLE ontime_cohort(
	sch_year integer NOT NULL,
	div_num integer NOT NULL,
    sch_num integer NOT NULL,
   	race text NOT NULL,
	gender text NOT NULL,
    disabil text NOT NULL,
    lep text NOT NULL,
    disadva text NOT NULL
    cohort_cnt integer NOT NULL,
	diploma_rate real NOT NULL,
	dropout_rate real NOT NULL,
);

ALTER TABLE ontime_cohort OWNER TO nectar;

COMMENT ON TABLE ontime_cohort IS 'on time cohort data per division/school';




DROP TABLE IF EXISTS college;

CREATE TABLE college (
    unitid integer NOT NULL,
    instnm text NOT NULL,
    addr text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    zip text NOT NULL
);

ALTER TABLE college OWNER TO nectar;

COMMENT ON TABLE college IS 'colleges and universities';
