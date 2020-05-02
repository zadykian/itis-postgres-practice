drop schema if exists task_16 cascade;
create schema task_16;
set search_path to task_16;

create table btree_test_table
(
    A int,
    B int,
    C int
);