-- flyway script to load 1_000_000 rows into hub table.

insert into hub_table(id, name)
select generate_series, 'name_value'
from generate_series(1, 1000000);