drop schema if exists task_22 cascade;
create schema task_22;
set search_path to task_22;

create table small_table
(
    id serial primary key,
    varchar_column varchar(512) not null,
    random_number double precision not null
);

create table medium_table
(
    id serial primary key,
    varchar_column varchar(512) not null,
    random_number double precision not null
);

create table large_table
(
    id serial primary key,
    varchar_column varchar(512) not null,
    random_number double precision not null
);