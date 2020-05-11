begin;
    select *
    from hstore_benchmarks.json_test_table
    where coalesce(
        attributes ->> 'key_16',
        attributes ->> 'key_32',
        attributes ->> 'key_64',
        attributes ->> 'key_128',
        attributes ->> 'key_256',
        attributes ->> 'key_512',
        attributes ->> 'key_1024',
        attributes ->> 'key_2048',
        attributes ->> 'key_4096',
        attributes ->> 'key_8192')  is not null;
end;