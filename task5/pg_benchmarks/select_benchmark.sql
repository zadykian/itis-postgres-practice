\set random_id random(1, 100000)

begin;
    select id, name
    from :table_name
    where id = :random_id;
end;
