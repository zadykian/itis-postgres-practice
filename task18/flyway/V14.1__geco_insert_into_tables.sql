set search_path to task_18;

insert into geco_table_0 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_1 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_2 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_3 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_4 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_5 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_6 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;

insert into geco_table_7 (name)
select concat('some_value_', seq_value)
from generate_series(1, 1000) seq_value;