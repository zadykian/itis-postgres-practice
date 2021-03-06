create or replace function task_12.handle_hub_table_insert()
    returns trigger
    language plpgsql as
$func$
    declare
        id_remainder smallint := new.id % 10;
        partition_name varchar(64) := concat('child_table_', id_remainder);
        insert_command_text text;
    begin
        if not exists (
            select 1
            from pg_catalog.pg_class
            where
                relnamespace = 'task_12'::regnamespace
                and relname = partition_name)
        then
            perform task_12.create_partition(id_remainder);
        end if;

        select format('insert into task_12.%s (id, text_value) values ($1.*);', partition_name)
        into insert_command_text;

        execute insert_command_text using new;
        return null;
    end
$func$;

create trigger on_insert
before insert on task_12.hub_table
for each row
execute function task_12.handle_hub_table_insert();