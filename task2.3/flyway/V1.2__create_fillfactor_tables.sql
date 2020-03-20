--flyway script to create tables with different
--value of fillfactor parameter for benchmarking.

create schema task_2_3_fillfactor;
set search path to task_2_3_fillfactor;

create table table_50
(
    number_column int,
    text_column varchar(100),
    date_column date
)
with (fillfactor = 50);

create table table_75
(
    number_column int,
    text_column varchar(100),
    date_column date
)
with (fillfactor = 75);

create table table_90
(
    number_column int,
    text_column varchar(100),
    date_column date
)
with (fillfactor = 90);

create table table_100
(
    number_column int,
    text_column varchar(100),
    date_column date
)
with (fillfactor = 100);