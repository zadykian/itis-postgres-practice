drop schema if exists task_9 cascade;
create schema task_9;
set search_path to task_9;

create table hub_table
(
    id serial primary key,
    text_value varchar(256)
);