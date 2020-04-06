set search_path to task_5;

create table hub_table
(
    id int,
    name varchar(128)
)
partition by hash (id);

create table partition_0
partition of hub_table
for values with (modulus 10, remainder 0);

create table partition_1
partition of hub_table
for values with (modulus 10, remainder 1);

create table partition_2
partition of hub_table
for values with (modulus 10, remainder 2);

create table partition_3
partition of hub_table
for values with (modulus 10, remainder 3);

create table partition_4
partition of hub_table
for values with (modulus 10, remainder 4);

create table partition_5
partition of hub_table
for values with (modulus 10, remainder 5);

create table partition_6
partition of hub_table
for values with (modulus 10, remainder 6);

create table partition_7
partition of hub_table
for values with (modulus 10, remainder 7);

create table partition_8
partition of hub_table
for values with (modulus 10, remainder 8);

create table partition_9
partition of hub_table
for values with (modulus 10, remainder 9);