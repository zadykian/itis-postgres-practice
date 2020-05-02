drop schema if exists task_17 cascade;
create schema task_17;
set search_path to task_17;

create table btree_test_table
(
    id int,
    name varchar(64)
);

create index on btree_test_table using btree (name);

create table brin_test_table
(
    id int,
    name varchar(64)
);

create index on brin_test_table using brin (name);

create table hash_test_table
(
    id int,
    name varchar(64)
);

create index on hash_test_table using hash (name);