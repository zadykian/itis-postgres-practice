set search_path to task_16;

insert into btree_test_table(A, B, C)
select
    seq_value,
    seq_value * random(),
    random() * 100
from generate_series(1, 1000) seq_value;