-- UTILIZZO:
--        enforce -> db2
call SET_CONSTRAINTS('YES')
--        not enforced -> db2
call SET_CONSTRAINTS('NO')
-- To check if referential integrity check is enforced:
select * from syscat.tabconst where tabschema='%schemausername%' and TYPE='F'

###########################################################################################
CREAZIONE PROCEDURE
1) copiare lo statement di creazione della procdura visualizzatto sotto in un file (es: constarints.sql)
2) eseguire la connect al db
3) lanciare la creazione della procedura con il comando db2 -td@ -vf constarints.sql
4) db2 call SET_CONSTRAINTS('NO') per disabilitare e YES per riabilitare
############################################################################################


drop procedure SET_CONSTRAINTS!

create procedure SET_CONSTRAINTS (ENFORCE VARCHAR(3))
LANGUAGE SQL
BEGIN
declare v_tabname varchar(128);
declare v_constname varchar(128);
declare v_rows integer;
declare v_alter_table_sql varchar(256);
declare tmp_cursor cursor for SELECT tabname, constname FROM syscat.references WHERE TABSCHEMA = CURRENT SCHEMA ORDER BY CONSTNAME,TABNAME, REFTABNAME;
select count(*) into v_rows from syscat.references WHERE TABSCHEMA = CURRENT SCHEMA;
open tmp_cursor;
while (v_rows > 0) DO
FETCH tmp_cursor INTO v_tabname, v_constname;
SET v_alter_table_sql = 'alter table ' || current SCHEMA || '.' || v_tabname ||  ' alter foreign key ' || v_constname;
IF (ENFORCE = 'NO') THEN
SET v_alter_table_sql = v_alter_table_sql || ' NOT ENFORCED';
ELSE
SET v_alter_table_sql = v_alter_table_sql || ' ENFORCED';
END IF;
execute immediate v_alter_table_sql;
SET v_rows = v_rows - 1;
end while;
close tmp_cursor;
END
@
