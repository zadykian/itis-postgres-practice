update task_6.hub_table
set id = id + 1
where id % 10 = 1 and id < 200000;

update task_6.hub_table
set id = id + 2
where id % 10 = 3 and id < 300000;

update task_6.hub_table
set id = id + 4
where id % 10 = 5 and id < 500000;

update task_6.hub_table
set id = id + 8
where id & 10 = 7 and id < 700000;