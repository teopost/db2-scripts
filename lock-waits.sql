/* lock wait query */
select 
  substr(ai_h.appl_name,1,10) as "Hold App", 
  substr(ai_h.primary_auth_id,1,10) as "Holder", 
  substr(ai_w.appl_name,1,10) as "Wait App", 
  substr(ai_w.primary_auth_id,1,10) as "Waiter", 
  lw.lock_mode as "Hold Mode", lw.lock_object_type as "Obj Type", 
  substr(lw.tabname,1,10) as "TabName", substr(lw.tabschema,1,10) as "Schema", 
  timestampdiff(2,char(lw.snapshot_timestamp - lw.lock_wait_start_time)) as "waiting (s)"
from 
  sysibmadm.snapappl_info ai_h,
  sysibmadm.snapappl_info ai_w, 
  sysibmadm.snaplockwait lw
where l
     w.agent_id = ai_w.agent_id
and lw.agent_id_holding_lk = ai_h.agent_id
