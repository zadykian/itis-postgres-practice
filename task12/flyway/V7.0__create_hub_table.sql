drop schema if exists task_12 cascade;
create schema task_12;

create table task_12.hub_table
(
    id serial primary key,
    text_value varchar(256)
);