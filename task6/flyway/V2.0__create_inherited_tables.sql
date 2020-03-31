-- flyway script to create structure of inherited tables.

create schema task_6;
set search_path to task_6;

create table hub_table
(
    id int unique,
    name varchar(256)
);

create table child_0 (like hub_table including indexes, check(id % 10 = 0) ) inherits (hub_table);
create table child_1 (like hub_table including indexes, check(id % 10 = 1) ) inherits (hub_table);
create table child_2 (like hub_table including indexes, check(id % 10 = 2) ) inherits (hub_table);
create table child_3 (like hub_table including indexes, check(id % 10 = 3) ) inherits (hub_table);
create table child_4 (like hub_table including indexes, check(id % 10 = 4) ) inherits (hub_table);
create table child_5 (like hub_table including indexes, check(id % 10 = 5) ) inherits (hub_table);
create table child_6 (like hub_table including indexes, check(id % 10 = 6) ) inherits (hub_table);
create table child_7 (like hub_table including indexes, check(id % 10 = 7) ) inherits (hub_table);
create table child_8 (like hub_table including indexes, check(id % 10 = 8) ) inherits (hub_table);
create table child_9 (like hub_table including indexes, check(id % 10 = 9) ) inherits (hub_table);