create or replace function task_12.create_partition(id_remainder smallint)
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
                primary key (id),
                check (id %% 10 = %s)
            ) 
            inherits (task_12.hub_table);',
            partition_name,
            id_remainder);

        execute command_text;

        command_text := format('
            create trigger move_record
            before update on task_12.%s
            for each row
            when (new.id != %s)
            execute function task_12.move_record_to_another_partition();',
            partition_name,
            id_remainder);

        execute command_text;
    end
$func$;