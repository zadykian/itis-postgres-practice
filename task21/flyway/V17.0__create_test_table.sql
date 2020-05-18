drop schema if exists task_21 cascade;
create schema task_21;

create table task_21.functions_test_table
(
    id serial primary key,
    varchar_column varchar(128) not null,
    double_column double precision not null
);

insert into task_21.functions_test_table
select
    concat('varchar_value_', seq_number),
    random() * 10
from generate_series(1, 100000) as seq_number;