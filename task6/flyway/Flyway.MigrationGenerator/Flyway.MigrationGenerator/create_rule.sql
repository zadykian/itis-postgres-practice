create rule update_child_{0}_to_{1}
as on update to child_{0}
      where old.id != new.id and new.id % 10 = {1}
do instead (
delete from task_6.child_{0} where id = old.id;
insert into task_6.child_{1} values (new.*);
);