create function task_13.insert_into_view()
    returns trigger
    language plpgsql as
$func$
    begin
        insert into task_13.underlying_table (typename, value)
        values (new.typename, new.value);
    end
$func$;

create trigger perform_insert
instead of insert to task_13.group_by_view
for each row
execute function task_13.insert_into_view();