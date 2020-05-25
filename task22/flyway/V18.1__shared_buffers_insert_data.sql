insert into task_22.small_table (varchar_column, random_number)
select
    seq_value,
    random()
from generate_series(1, 1000) as seq_value;

insert into task_22.medium_table (varchar_column, random_number)
select
    seq_value,
    random()
from generate_series(1, 10000) as seq_value;

insert into task_22.large_table (varchar_column, random_number)
select
    seq_value,
    random()
from generate_series(1, 100000) as seq_value;