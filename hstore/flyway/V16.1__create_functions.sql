set search_path to hstore_benchmarks;

create function generate_hstore_value(pairs_count int)
    returns hstore
    immutable
    language plpgsql as
$func$
    declare key_value_pairs text[];
    begin
        for index in 1..pairs_count
        loop
            key_value_pairs = array_append(key_value_pairs, format('key_%s => value_%s', index, index));
        end loop;

        return array_to_string(key_value_pairs, ', ')::hstore;
    end
$func$;

create generate_json_value(pairs_count int)
    returns json
    immutable
    language plpgsql as
$func$
    declare key_value_pairs text[];
    begin
        for index in 1..pairs_count
        loop
            key_value_pairs = array_append(key_value_pairs, format('"key_%s": "value_%s"', index, index));
        end loop;

        return ('{' || array_to_string(key_value_pairs, ', ') || '}')::json;
    end
$func$;

create function generate_jsonb_value(pairs_count int)
    returns jsonb
    immutable
    language plpgsql as
$func$
    declare key_value_pairs text[];
    begin
        for index in 1..pairs_count
        loop
            key_value_pairs = array_append(key_value_pairs, format('"key_%s": "value_%s"', index, index));
        end loop;

        return ('{' || array_to_string(key_value_pairs, ', ') || '}')::jsonb;
    end
$func$;