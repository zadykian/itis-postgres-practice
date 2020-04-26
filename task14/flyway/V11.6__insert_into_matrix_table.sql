set search_path to task_14;

insert into table_with_matrix_column (matrix_column)
select '{{1, 2, 3},{4, 5, 6},{7, 8, 9}}'
from generate_series(1, 100000);