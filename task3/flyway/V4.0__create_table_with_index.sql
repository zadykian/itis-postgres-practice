drop schema if exists task_3 cascade;
create schema task_3;

create table task_3.table_to_cluster
(
    id int,
    name varchar(256)
);

create index 
on task_3.table_to_cluster 
using btree (id);