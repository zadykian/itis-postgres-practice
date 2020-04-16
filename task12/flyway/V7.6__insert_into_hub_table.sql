insert into task_12.hub_table (id, text_value)
select generate_series, 'text_value_to_insert'
from generate_series(1, 1000000);