drop schema if exists task_13 cascade;
create schema task_13;

create table task_13.underlying_table
(
    type_name varchar(256),
    value int
);