-- script to perform bulk-update on 'task_6.hub_table'.

update task_6.hub_table
set id = id + 1000000 + random() * 10
where true;