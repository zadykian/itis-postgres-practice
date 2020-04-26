set search_path to task_14;

create table task_14.table_with_matrix_column
(
    id serial primary key,
    matrix_column numeric[][]
);