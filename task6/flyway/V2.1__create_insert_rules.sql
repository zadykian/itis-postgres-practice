-- flyway script to create insert rules for hub table
-- to implement partitioning.

set search_path to task_6;

create rule insert_to_child_0
as on insert to hub_table
where new.id % 10 = 0
do instead
insert into child_0 values (new.*);

create rule insert_to_child_1
as on insert to hub_table
where new.id % 10 = 1
do instead
insert into child_1 values (new.*);

create rule insert_to_child_2
as on insert to hub_table
where new.id % 10 = 2
do instead
insert into child_2 values (new.*);

create rule insert_to_child_3
as on insert to hub_table
where new.id % 10 = 3
do instead
insert into child_3 values (new.*);

create rule insert_to_child_4
as on insert to hub_table
where new.id % 10 = 4
do instead
insert into child_4 values (new.*);

create rule insert_to_child_5
as on insert to hub_table
where new.id % 10 = 5
do instead
insert into child_5 values (new.*);

create rule insert_to_child_6
as on insert to hub_table
where new.id % 10 = 6
do instead
insert into child_6 values (new.*);

create rule insert_to_child_7
as on insert to hub_table
where new.id % 10 = 7
do instead
insert into child_7 values (new.*);

create rule insert_to_child_8
as on insert to hub_table
where new.id % 10 = 8
do instead
insert into child_8 values (new.*);

create rule insert_to_child_9
as on insert to hub_table
where new.id % 10 = 9
do instead
insert into child_9 values (new.*);