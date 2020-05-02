set search_path to task_17;

insert into btree_test_table (id, name)
select seq_value, concat('name_', seq_value)
from generate_series(1, 100000);

insert into brin_test_table (id, name)
select seq_value, concat('name_', seq_value)
from generate_series(1, 100000);

insert into hash_test_table (id, name)
select seq_value, concat('name_', seq_value)
from generate_series(1, 100000);