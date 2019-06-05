/* 
Look at all the queries in the package cache
– Both Dynamic and Static
– See execution time, wait time (by component), and much more
*/

SELECT
  SUBSTR(STMT_TEXT,1,20) AS STMT, 
  SECTION_TYPE AS TYPE, 
  NUM_EXECUTIONS,
  TOTAL_ACT_TIME AS TOTAL_TIME, 
  TOTAL_ACT_WAIT_TIME AS WAIT_TIME
FROM 
  TABLE(MON_GET_PKG_CACHE_STMT('','','',-1))
