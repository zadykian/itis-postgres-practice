create view task_13.group_by_view as
select 
    type_name, 
    sum(value) as values_sum
from task_13.underlying_table
group by type_name;