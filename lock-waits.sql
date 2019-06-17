/* lock wait query */

select
      substr(HLD_APPLICATION_NAME,1,10) as "Hold App",  -- Who is holding the lock
      substr(HLD_USERID,1,10) as "Holder",
      substr(REQ_APPLICATION_NAME,1,10) as "Wait App",  -- Who is waiting on the lock
      substr(REQ_USERID,1,10) as "Waiter",
      LOCK_MODE as "Hold Mode",
      LOCK_OBJECT_TYPE as "Obj Type",
      substr(TABNAME,1,10) as "TabName",
      substr(TABSCHEMA,1,10) as "Schema",
      LOCK_WAIT_ELAPSED_TIME as "waiting (s)", -- How long is the wait
      REQ_STMT_TEXT, -- new
      HLD_CURRENT_STMT_TEXT, -- new
      LOCK_NAME -- new
from
      SYSIBMADM.MON_LOCKWAITS
