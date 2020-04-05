begin;
    select id, name
    from task_3.table_to_cluster
    where id in ();
end;