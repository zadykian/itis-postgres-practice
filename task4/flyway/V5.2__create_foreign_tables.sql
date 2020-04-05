set search_path to task_4;

drop user mapping if exists for current_user server access_to_tables;
drop server if exists access_to_tables;
drop extension if exists postgres_fdw;

create extension postgres_fdw;

create server access_to_tables
foreign data wrapper postgres_fdw
options(host 'localhost', port '5432', dbname 'postgres');

create user mapping for current_user
server  access_to_tables
options (user 'postgres', password 'postgres');


create foreign table entity_0
(
    id bigserial,
    name varchar(128) not null
)
server access_to_tables
options (schema_name 'task_4_foreign_0', table_name 'entity_table');

create foreign table entity_1
(
    id bigserial,
    name varchar(128) not null
)
server access_to_tables
options (schema_name 'task_4_foreign_1', table_name 'entity_table');

create foreign table entity_2
(
    id bigserial,
    name varchar(128) not null
)
server access_to_tables
options (schema_name 'task_4_foreign_2', table_name 'entity_table');