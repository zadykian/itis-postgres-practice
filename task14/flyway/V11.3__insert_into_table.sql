set search_path to task_14;

insert into task_14.table_with_complex_number (varchar_column, complex_number_column)
select
    concat('varchar_value_', int_value),
    row(round(random()::numeric, 2), round(random()::numeric, 2))::complex_number
from generate_series(1, 1000) as int_value;