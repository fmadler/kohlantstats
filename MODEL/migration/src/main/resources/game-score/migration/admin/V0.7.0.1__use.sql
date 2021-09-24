SET SQL_SAFE_UPDATES = 0;
SET NAMES UTF8;
-- for MYSQL V8
-- for store proc to avoid error This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration
-- you need (at least one of) the SUPER or SYSTEM_VARIABLES_ADMIN privilege(s) for this operation
SET GLOBAL log_bin_trust_function_creators = 1; 
-- SET GLOBAL lower_case_table_names=1;
-- SET [GLOBAL | SESSION] group_concat_max_len = val;
SET GLOBAL group_concat_max_len = 30000;
-- SET @@sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));