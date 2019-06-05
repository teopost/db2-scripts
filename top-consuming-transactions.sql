/* Show the transactions with the most CPU and most Wait Time */

SELECT
   APPLICATION_HANDLE AS APP_HDL, 
   SUBSTR(CLIENT_USERID,1,10) AS USERID, 
   TOTAL_RQST_TIME,
   TOTAL_CPU_TIME,
   TOTAL_WAIT_TIME, 
   CLIENT_IDLE_WAIT_TIME
FROM 
   TABLE(MON_GET_UNIT_OF_WORK(NULL,-1))
