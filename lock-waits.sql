/* lock wait query */

-- Mode 1
select 
  substr(ai_h.appl_name,1,10) as "Hold App",  -- Who is holding the lock
  substr(ai_h.primary_auth_id,1,10) as "Holder", 
  substr(ai_w.appl_name,1,10) as "Wait App",  -- Who is waiting on the lock
  substr(ai_w.primary_auth_id,1,10) as "Waiter", 
  lw.lock_mode as "Hold Mode", lw.lock_object_type as "Obj Type", 
  substr(lw.tabname,1,10) as "TabName", substr(lw.tabschema,1,10) as "Schema", 
  timestampdiff(2,char(lw.snapshot_timestamp - lw.lock_wait_start_time)) as "waiting (s)" -- How long is the wait
from 
  sysibmadm.snapappl_info ai_h,
  sysibmadm.snapappl_info ai_w, 
  sysibmadm.snaplockwait lw
where l
     w.agent_id = ai_w.agent_id
and lw.agent_id_holding_lk = ai_h.agent_id;
                       
-- Mode 2 (> 9.7 FP1)
select 
      substr(HLD_APPLICATION_NAME,1,10) as "Hold App",  -- Who is holding the lock
      substr(HLD_USERID,1,10) as "Holder", 
      substr(REQ_APPLICATION_NAME,1,10) as "Wait App",  -- Who is waiting on the lock
      substr(REQ_USERID,1,10) as "Waiter",
      LOCK_MODE as "Hold Mode", 
      LOCK_OBJECT_TYPE as "Obj Type", 
      substr(TABNAME,1,10) as "TabName", 
      substr(TABSCHEMA,1,10) as "Schema", 
      LOCK_WAIT_ELAPSED_TIME as "waiting (s)" -- How long is the wait
from 
      SYSIBMADM.MON_LOCKWAITS;


 
