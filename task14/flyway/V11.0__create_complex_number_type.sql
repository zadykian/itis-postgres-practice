drop schema if exists task_14 cascade;
create schema task_14;
set search_path to task_14;

create type complex_number as
(
    real_part real,
    imaginary_part real
);