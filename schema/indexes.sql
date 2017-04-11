CREATE INDEX ON division (div_num);
CREATE INDEX ON division (div_num, div_name);

CREATE INDEX ON school (div_num, sch_num);

CREATE INDEX ON sol_test_data (sch_year);
CREATE INDEX ON sol_test_data (div_num, sch_num);

CREATE INDEX ON ontime_cohort (sch_year);
CREATE INDEX ON ontime_cohort (div_num, sch_num);

CREATE INDEX ON postsec_enroll (sch_year);
CREATE INDEX ON postsec_enroll (div_num, sch_num);


CREATE INDEX ON stem_schools (div_num, sch_num);
