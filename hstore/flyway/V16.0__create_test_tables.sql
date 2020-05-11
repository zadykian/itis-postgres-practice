drop schema if exists hstore_benchmarks cascade;
create schema hstore_benchmarks;
set search_path to hstore_benchmarks;
create extension hstore;

create table hstore_test_table
(
    id serial primary key,
    attributes hstore not null
);

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