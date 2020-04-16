create or replace function task_12.log_tables_creation()
    returns event_trigger
    language plpgsql as
$func$
    declare
        table_oid oid;
    begin
        select objid into table_oid
        from pg_event_trigger_ddl_commands();

        insert into task_12.ddl_log(username, created_table_oid)
        values (current_user, table_oid);
    end
$func$;

create event trigger log_ddl_traffic
on ddl_command_end
when tag in ('create table')
execute function task_12.log_tables_creation();