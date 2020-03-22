\set id_to_select random(2, 10001)

begin;
    select *
    from :table_name
    where 
        id = :id_to_select
        and starts_with(text_column, 'h');
end;