/*
Display information about the application that currently has the oldest uncommitted unit of work
*/

SELECT
    AI.APPL_STATUS as Status, 
    SUBSTR(AI.PRIMARY_AUTH_ID,1,10) AS "Authid", 
    SUBSTR(AI.APPL_NAME,1,15) AS "Appl Name", 
    INT(AP.UOW_LOG_SPACE_USED/1024/1024)
FROM
    SYSIBMADM.SNAPDB DB, 
    SYSIBMADM.SNAPAPPL AP, 
    SYSIBMADM.SNAPAPPL_INFO AI
WHERE AI.AGENT_ID = DB.APPL_ID_OLDEST_XACT
AND AI.AGENT_ID = AP.AGENT_ID;
