-- flyway script to create insert rules for hub table
-- to implement partitioning.

set search_path to task_6;

create rule insert_to_child_0
on insert to hub_table
where id % 10 == 0
do instead
insert into child_0 (new.*);

create rule insert_to_child_1
on insert to hub_table
where id % 10 == 1
do instead
insert into child_1 (new.*);

create rule insert_to_child_2
on insert to hub_table
where id % 10 == 2
do instead
insert into child_2 (new.*);

create rule insert_to_child_3
on insert to hub_table
where id % 10 == 3
do instead
insert into child_3 (new.*);

create rule insert_to_child_4
on insert to hub_table
where id % 10 == 4
do instead
insert into child_4 (new.*);

create rule insert_to_child_5
on insert to hub_table
where id % 10 == 5
do instead
insert into child_5 (new.*);

create rule insert_to_child_6
on insert to hub_table
where id % 10 == 6
do instead
insert into child_6 (new.*);

create rule insert_to_child_7
on insert to hub_table
where id % 10 == 7
do instead
insert into child_7 (new.*);

create rule insert_to_child_8
on insert to hub_table
where id % 10 == 8
do instead
insert into child_8 (new.*);

create rule insert_to_child_9
on insert to hub_table
where id % 10 == 9
do instead
insert into child_9 (new.*);