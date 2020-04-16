create or replace function task_12.move_record_to_another_partition()
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

        return null;
    end;
$func$;