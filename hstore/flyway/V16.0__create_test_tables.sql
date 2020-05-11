drop schema if exists hstore_benchmarks cascade;
create schema hstore_benchmarks;
set search_path to hstore_benchmarks;
create extension hstore;

create table hstore_test_table
(
    id serial primary key,
    attributes hstore not null
);

create table hstore_test_table_gin
(
    id serial primary key,
    attributes hstore not null
);

create index on hstore_test_table_gin using gin (attributes);

create table hstore_test_table_gist
(
    id serial primary key,
    attributes hstore not null
);

create index on hstore_test_table_gist using gist (attributes);

create table json_test_table
(
    id serial primary key,
    attributes json not null
);

create table jsonb_test_table
(
    id serial primary key,
    attributes jsonb not null
);

create table jsonb_test_table_gin
(
    id serial primary key,
    attributes jsonb not null
);

create index on jsonb_test_table_gin using gin (attributes);

create table jsonb_test_table_gin_path_ops
(
    id serial primary key,
    attributes jsonb not null
);

create index on jsonb_test_table_gin_path_ops using gin (attributes jsonb_path_ops);