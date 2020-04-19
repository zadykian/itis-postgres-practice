drop schema if exists task_11 cascade;
create schema task_11;

create table task_11.non_prepared_table
(
    id int primary key,
    name varchar(128)
);

create table task_11.prepared_table
(
    id int primary key,
    name varchar(128)
);