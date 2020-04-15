create or replace function move_record_to_another_partition()
returns trigger
language plpgsql as
$func$
    declare
        old_partition_name varchar(32) := concat('child_table_', old.id % 10);
        new_partition_name varchar(32) := concat('child_table_', new.id % 10);
        command_text text;
    begin
        command_text := format('insert into %s (id, text_value) values ($1.*);', new_partition_name);
        execute command_text using new;

        command_text := format('delete from %s where id = %s;', old_partition_name, old.id);
        execute command_text;
    end;
$func$;

create or replace function create_partition(id_remainder smallint)
returns void
language plpgsql as
$func$
    declare
        partition_name varchar(64) := concat('child_table_', id_remainder);
        command_text text;
    begin
        command_text := format('
            create table task_12.%s 
            ( 
                check id % 10 = %s 
            ) 
            inherits task_12.hub_table;',
            partition_name,
            id_remainder);

        execute command_text;

        command_text := format('
            create trigger move_record
            before update on %s
            for each row
            when new.id != %s
            execute function move_record_to_another_partition();',
            partition_name,
            id_remainder);

        execute command_text;
    end
$func$;

create or replace function handle_hub_table_insert()
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
            perform create_partition(id_remainder);
        end if;

        select format('insert into %s (id, text_value) values ($1.*);', partition_name)
        into insert_command_text;

        execute insert_command_text using new;
        return null;
    end
$func$;

create trigger on_insert
after insert on task_12.hub_table
for each row
execute function handle_hub_table_insert();