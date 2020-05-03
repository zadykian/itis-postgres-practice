set search_path to task_19;

insert into btree_test_table (id, content)
select 
    seq_value, 
    public.get_random_string(128)
from generate_series(1, 100000) as seq_value;

insert into gin_test_table (id, content)
select 
    seq_value, 
    public.get_random_string(128)
from generate_series(1, 100000) as seq_value;

insert into gist_test_table (id, content)
select 
    seq_value, 
    public.get_random_string(128)
from generate_series(1, 100000) as seq_value;