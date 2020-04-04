\set id_to_update random(1, 1000000)
\set id_random_bias random(0, 9)

begin;
    update task_6.hub_table
    set id = id + 1000000 + :id_random_bias
    where id = :id_to_update;
end;