set search_path to task_14;

create or replace function sum_matrices(left_matrix numeric[][], right_matrix numeric[][])
    returns numeric[][]
    immutable
    parallel safe
    language plpgsql as
$func$
    declare
        first_dimension int := array_length(left_matrix, 1);
        second_dimension int := array_length(left_matrix, 2);
        result_matrix numeric[][];
        single_row numeric[];
    begin
        if (first_dimension != array_length(right_matrix, 1)
            or second_dimension != array_length(right_matrix, 2))
        then
            raise exception 'Matrices have different dimensions!';
        end if;

        for i in 1..first_dimension
        loop
            single_row = '{}'::numeric[];
            for j in 1..second_dimension
            loop
                single_row = single_row || (left_matrix[i][j] + right_matrix[i][j])::numeric;
            end loop;
            result_matrix = result_matrix || single_row;
        end loop;

        return result_matrix;
    end;
$func$;