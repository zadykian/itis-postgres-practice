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
        if (left_matrix = '{}')
        then
            return right_matrix;
        end if;

        if (right_matrix = '{}')
        then
            return left_matrix;
        end if;

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
            result_matrix = result_matrix || array[single_row];
        end loop;

        return result_matrix;
    end;
$func$;

create aggregate sum(numeric[][])
(
    initcond = '{}',
    stype = numeric[][],
    sfunc = sum_matrices
);

create aggregate sum_parallel(numeric[][])
(
    initcond = '{}',
    stype = numeric[][],
    sfunc = sum_matrices,
    parallel = safe,
    combinefunc = sum_matrices
);