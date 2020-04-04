\set random_value random(1, 1000000)

begin;
    update task_7.vacuum_test
    set name = concat(left(name, 9), ' ', ':random_value');
end;