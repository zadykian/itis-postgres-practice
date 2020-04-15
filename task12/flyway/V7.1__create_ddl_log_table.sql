create table task_12.ddl_log
(
    id serial primary key,
    event_date timestamp not null default now(),
    username varchar(64) not null,
    created_table_oid oid not null
);