begin;
    select min(A)
    over (
        partition by B, C 
        order by B, C)
    from task_16.btree_test_table
    order by C, B;
end;