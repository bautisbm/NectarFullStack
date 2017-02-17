ANALYZE VERBOSE division;
SELECT count(*) AS div_cnt FROM division;

ANALYZE VERBOSE school;
SELECT count(*) AS sch_cnt FROM school;

ANALYZE VERBOSE stem_schools;
SELECT count(*) AS stem_cnt FROM stem_schools;

ANALYZE VERBOSE enroll;
SELECT count(*) AS enr_cnt FROM enroll;

ANALYZE VERBOSE hs_graduate;
SELECT count(*) AS hs_cnt FROM hs_graduate;

ANALYZE VERBOSE ontime_cohort;
SELECT count(*) AS ont_cnt FROM ontime_cohort;

ANALYZE VERBOSE postsec_enroll;
SELECT count(*) AS post_cnt FROM postsec_enroll;

ANALYZE VERBOSE sol_test_data;
SELECT count(*) AS sol_cnt FROM sol_test_data;

ANALYZE VERBOSE college;
SELECT count(*) AS col_cnt FROM college;

ANALYZE VERBOSE cte_comp;
SELECT count(*) AS cte_cnt FROM cte_comp;
