-- flyway script to load 1_000_000 rows into hub table.

create sequence hub_table_id_seq as integer;

insert into hub_table(id, name)
values 