set search_path to task_16;

create index on btree_test_table (A);
create index on btree_test_table (A, B);
create index on btree_test_table (A, B, C);
create index on btree_test_table (A, C);
create index on btree_test_table (A, C, B);

create index on btree_test_table (B);
create index on btree_test_table (B, A);
create index on btree_test_table (B, A, C);
create index on btree_test_table (B, C);
create index on btree_test_table (B, C, A);

create index on btree_test_table (C);
create index on btree_test_table (C, A);
create index on btree_test_table (C, A, B);
create index on btree_test_table (C, B);
create index on btree_test_table (C, B, A);