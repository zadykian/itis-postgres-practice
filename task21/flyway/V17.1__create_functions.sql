create function task_21.sql_function(left_bound double precision)
    returns setof task_21.functions_test_table
    volatile
    language sql as
$func$
    select
        id,
        varchar_column,
        double_column
    from
        task_21.functions_test_table
    where
        double_column >= left_bound;
$func$;

create function task_21.plpgsql_function(left_bound double precision)
    returns setof task_21.functions_test_table
    volatile
    language plpgsql as
$func$
    begin
        return query 
        select
            id,
            varchar_column,
            double_column
        from
            task_21.functions_test_table
        where
            double_column >= left_bound;
    end;
$func$;