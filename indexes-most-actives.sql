/*
Show me the indexes that have been most active
– Metrics will only be returned for indexes on tables that have been accessed since the database was activated.
*/

SELECT
   SUBSTR(TABSCHEMA,1,10) AS SCHEMA, 
   SUBSTR(TABNAME,1,20) AS NAME,
   IID, 
   NLEAF, 
   NLEVELS,
   INDEX_SCANS,
   KEY_UPDATES,
   BOUNDARY_LEAF_NODE_SPLITS + NONBOUNDARY_LEAF_NODE_SPLITS AS PAGE_SPLITS
FROM 
   TABLE(MON_GET_INDEX('','',-1)) 
ORDER BY INDEX_SCANS DESC FETCH FIRST 5 ROWS ONLY
