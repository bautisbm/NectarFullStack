DROP TABLE IF EXISTS division;

CREATE TABLE division (
    div_num integer NOT NULL PRIMARY KEY,
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
	city text NOT NULL,
	state text NOT NULL,
	zip text NOT NULL,
	PRIMARY KEY(div_num, sch_num)
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
    fall_cnt integer NOT NULL,
	PRIMARY KEY(div_num, sch_num, sch_year)
);

ALTER TABLE enroll OWNER TO nectar;

COMMENT ON TABLE enroll IS 'fall membership counts';





DROP TABLE IF EXIST sol_data;

CREATE TABLE sol_data (
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
	pass_adv real NOT NULL,
	pass_prof real NOT NULL,
	pass_rate real NOT NULL,
	fail_rate real NOT NULL,
	PRIMARY KEY (sch_year, div_num, sch_num)
);

ALTER TABLE sol_data OWNER TO nectar;

COMMENT ON TABLE sol_data IS 'sol test data per division/school';



DROP TABLE IF EXISTS postsec_enroll

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
	ps_enrollement_cnt integer NOT NULL,
	PRIMARY KEY(div_num, sch_num, sch_year)
);

ALTER TABLE postsec_enroll OWNER TO nectar;

COMMENT ON TABLE postsec_enroll IS 'post secondary enrollment data per division/school';








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
