-- flyway script to create tables with different
-- TOAST strategies for benchmarking.

create schema task_2_2_toast;
set search_path to task_2_2_toast;

create table plain_strategy_table
(
    text_column varchar(4096)
);

alter table plain_strategy_table
alter column text_column
set storage plain;

create table extended_strategy_table
(
    text_column varchar(4096)
);

alter table extended_strategy_table
alter column text_column
set storage extended;

create table external_strategy_table
(
    text_column varchar(4096)
);

alter table external_strategy_table
alter column text_column
set storage external;

create table main_strategy_table
(
    text_column varchar(4096)
);

alter table main_strategy_table
alter column text_column
set storage main;