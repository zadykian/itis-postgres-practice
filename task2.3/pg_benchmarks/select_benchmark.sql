\set id_to_select random(1, 10000)

begin;
    select *
    from :table_name
    where id = :id_to_select;
end;