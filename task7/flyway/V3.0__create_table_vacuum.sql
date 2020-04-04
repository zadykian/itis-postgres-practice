drop schema if exists task_7;
create schema task_7;
set search_path to task_7;

create table vacuum_test
(
    id serial primary key,
    name varchar(128)
) 
with 
(
    autovacuum_enabled = false
);