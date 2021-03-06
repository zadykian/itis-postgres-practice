create or replace rule move_from_0_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_0_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 0
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_0 where id = old.id;
);

create or replace rule move_from_1_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_1_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 1
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_1 where id = old.id;
);

create or replace rule move_from_2_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_2_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 2
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_2 where id = old.id;
);

create or replace rule move_from_3_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_3_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 3
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_3 where id = old.id;
);

create or replace rule move_from_4_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_4_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 4
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_4 where id = old.id;
);

create or replace rule move_from_5_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_5_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 5
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_5 where id = old.id;
);

create or replace rule move_from_6_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_6_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 6
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_6 where id = old.id;
);

create or replace rule move_from_7_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_7_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 7
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_7 where id = old.id;
);

create or replace rule move_from_8_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_8_to_9 as
on update to task_6.hub_table
where
	old.id % 10 = 8
	and new.id % 10 = 9
do instead
(
	insert into task_6.child_9 values (new.*);
	delete from task_6.child_8 where id = old.id;
);

create or replace rule move_from_9_to_0 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 0
do instead
(
	insert into task_6.child_0 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_1 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 1
do instead
(
	insert into task_6.child_1 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_2 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 2
do instead
(
	insert into task_6.child_2 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_3 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 3
do instead
(
	insert into task_6.child_3 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_4 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 4
do instead
(
	insert into task_6.child_4 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_5 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 5
do instead
(
	insert into task_6.child_5 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_6 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 6
do instead
(
	insert into task_6.child_6 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_7 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 7
do instead
(
	insert into task_6.child_7 values (new.*);
	delete from task_6.child_9 where id = old.id;
);

create or replace rule move_from_9_to_8 as
on update to task_6.hub_table
where
	old.id % 10 = 9
	and new.id % 10 = 8
do instead
(
	insert into task_6.child_8 values (new.*);
	delete from task_6.child_9 where id = old.id;
);