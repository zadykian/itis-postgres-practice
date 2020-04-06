insert into task_5.non_partitioned_table(id, name)
select generate_series, 'name_value'
from generate_series(1, 1000000);