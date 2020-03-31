-- script to perform bulk-update on 'task_6.hub_table'.

update task_6.hub_table
set id = id + random() * 10 + 1
where true;