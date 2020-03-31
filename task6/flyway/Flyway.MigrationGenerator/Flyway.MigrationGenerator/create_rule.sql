create rule move_from_{0}_to_{1}
as on update to task_6.hub_table
where
	old.id % 10 == {0}
	and new.id % 10 == {1}
do instead
(
	delete from task_6.child_{0}
	where id = old.id;

	insert into task_6.child_{1}
	values (new.*);
);