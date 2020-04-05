\set left_bound random(1, 50000)
\set right_bound random (50001, 100000)

begin;
    select id, name
    from task_3.table_to_cluster
    where id between :left_bound and :right_bound;
end;