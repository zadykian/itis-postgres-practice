create table task_14.table_with_complex_number
(
    id serial primary key,
    varchar_column varchar(32) not null,
    complex_number_column task_14.complex_number not null
);