-- flyway script to create structure of inherited tables.

create schema task_6;
set search_path to task_6;

create table hub_table
(
    id serial primary key,
    name varchar(256)
);