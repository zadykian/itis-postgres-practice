drop schema if exists task_19 cascade;
create schema task_19;
set search_path to task_19;

create extension pg_trgm;

create table btree_test_table
(
    id int,
    content varchar(512)
);

create index on btree_test_table using btree (content);

create table gin_test_table
(
    id int,
    content varchar(512)
);

create index on gin_test_table using gin (content gin_trgm_ops);

create table gist_test_table
(
    id int,
    content varchar(512)
);

create index on gist_test_table using gist (content gist_trgm_ops);