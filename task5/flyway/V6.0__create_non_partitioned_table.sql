drop schema if exists task_5 cascade;
create schema task_5;

create table task_5.non_partitioned_table
(
    id int,
    name varchar(128)
);