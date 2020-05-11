begin;
    set search_path to hstore_benchmarks;

    select *
    from :table_name
    where attributes ?| '{key_16, key_32, key_64, key_128, key_256, key_512, key_1024, key_2048, key_4096, key_8192}';
end;