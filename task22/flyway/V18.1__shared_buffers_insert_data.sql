insert into task_22.small_table (varchar_column, random_number)
select
    concat('varchar_value_', seq_value),
    random()
from generate_series(1, 1000) as seq_value;

insert into task_22.medium_table (varchar_column, random_number)
select
    concat('varchar_value_', seq_value),
    random()
from generate_series(1, 10000) as seq_value;

insert into task_22.large_table (varchar_column, random_number)
select
    concat('varchar_value_', seq_value),
    random()
from generate_series(1, 100000) as seq_value;

create or replace function task_22.select_all_data()
returns setof task_22.small_table
language sql as
$func$
    select *
    from task_22.small_table
    union all
    select * from task_22.medium_table
    union all
    select * from task_22.large_table;
$func$;