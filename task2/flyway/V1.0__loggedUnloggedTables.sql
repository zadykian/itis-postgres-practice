-- flyway script to create logged and unlogged
-- tables with the same structure for benchmarking.

create table public.logged_table
(
    id serial primary key,
    text_column varchar(256),
    date_column date
);

create unlogged table public.unlogged_table
(
    id serial primary key,
    text_column varchar(256),
    date_column date
);