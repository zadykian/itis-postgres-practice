insert into task_13.underlying_table (type_name, value)
select 'first_type', generate_series
from generate_series(1, 200);

insert into task_13.underlying_table (type_name, value)
select 'second_type', generate_series
from generate_series(201, 400);

insert into task_13.underlying_table (type_name, value)
select 'third_type', generate_series
from generate_series(401, 600);

insert into task_13.underlying_table (type_name, value)
select 'fourth_type', generate_series
from generate_series(601, 800);

insert into task_13.underlying_table (type_name, value)
select 'fifth_type', generate_series
from generate_series(801, 1000);