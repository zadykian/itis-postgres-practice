update task_12.hub_table
set id = id + 1000000 + 1
where
    id % 10 = 1
    and id < 200000;

update task_12.hub_table
set id = id + 1000000 + 3
where
    id % 10 = 3
    and id between 200000 and 400000;

update task_12.hub_table
set id = id + 1000000 + 5
where
    id % 10 = 5
    and id between 400000 and 600000;

update task_12.hub_table
set id = id + 1000000 + 7
where
    id % 10 = 7
    and id between 600000 and 800000;