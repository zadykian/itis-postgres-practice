set search_path to hstore_benchmarks;

create function generate_hstore_value(start_index int, pairs_count int)
    returns hstore
    immutable
    language plpgsql as
$func$
    declare key_value_pairs text[];
    begin
        for index in start_index..(start_index + pairs_count)
        loop
            key_value_pairs = array_append(key_value_pairs, format('key_%s => value_%s', index, index));
        end loop;

        return array_to_string(key_value_pairs, ', ')::hstore;
    end
$func$;

create function generate_json_value(start_index int, pairs_count int)
    returns json
    immutable
    language plpgsql as
$func$
    declare key_value_pairs text[];
    begin
        for index in start_index..(start_index + pairs_count)
        loop
            key_value_pairs = array_append(key_value_pairs, format('"key_%s": "value_%s"', index, index));
        end loop;

        return ('{' || array_to_string(key_value_pairs, ', ') || '}')::json;
    end
$func$;

create function insert_into_test_tables(pairs_count int)
    returns void
    language plpgsql as
$func$
    begin
        set search_path to hstore_benchmarks;

        truncate table hstore_test_table;
        insert into hstore_test_table(attributes)
        select generate_hstore_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table hstore_test_table_gin;
        insert into hstore_test_table_gin(attributes)
        select generate_hstore_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table hstore_test_table_gist;
        insert into hstore_test_table_gist(attributes)
        select generate_hstore_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table json_test_table;
        insert into json_test_table(attributes)
        select generate_json_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table jsonb_test_table;
        insert into jsonb_test_table(attributes)
        select generate_json_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table jsonb_test_table_gin;
        insert into jsonb_test_table_gin(attributes)
        select generate_json_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;

        truncate table jsonb_test_table_gin_path_ops;
        insert into jsonb_test_table_gin_path_ops(attributes)
        select generate_json_value(seq_value, pairs_count)
        from generate_series(1, 100000) as seq_value;
    end;
$func$;