\set id_to_delete random(2, 150000)

begin;
    delete from :table_name
    where id = :id_to_delete;
end;