# db2-scripts

## Others resources:

* http://www.db2dean.com/Previous/AdminView.html
* http://www.praxiumgroup.com/adug-www/prev_pres/ADUG-2011-05-20-Admin%20Views.pdf
* http://www.db2commands.com/db2tuning
* https://www.ibm.com/support/knowledgecenter/SS3NGB_1.6.0/ioc/maintain_db2mon.html
* https://datageek.blog/en/2011/03/30/the-least-you-can-do-for-db2-performance/
* http://www.dbazine.com/db2/db2-disarticles/gunning1/?track=lg_DB2

# Others quries

```sql
SELECT session_auth_id,
       application_handle,
       elapsed_time_sec,
       activity_state,
       rows_read,
       SUBSTR(stmt_text,1,200)
FROM sysibmadm.mon_current_sql
ORDER BY elapsed_time_sec DESC
FETCH FIRST 5 ROWS ONLY
```


