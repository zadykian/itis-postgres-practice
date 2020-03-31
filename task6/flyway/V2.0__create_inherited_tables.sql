-- flyway script to create structure of inherited tables.

create schema task_6;
set search_path to task_6;

create table hub_table
(
    id int,
    name varchar(256)
);

create table child_0 ( check(id % 10 == 0) ) inherits (hub_table);
create table child_1 ( check(id % 10 == 1) ) inherits (hub_table);
create table child_2 ( check(id % 10 == 2) ) inherits (hub_table);
create table child_3 ( check(id % 10 == 3) ) inherits (hub_table);
create table child_4 ( check(id % 10 == 4) ) inherits (hub_table);
create table child_5 ( check(id % 10 == 5) ) inherits (hub_table);
create table child_6 ( check(id % 10 == 6) ) inherits (hub_table);
create table child_7 ( check(id % 10 == 7) ) inherits (hub_table);
create table child_8 ( check(id % 10 == 8) ) inherits (hub_table);
create table child_9 ( check(id % 10 == 9) ) inherits (hub_table);