\set id_to_update random(2, 150000)

begin;
    update :table_name
    set text_column = concat('updated_', text_column)
    where id = :id_to_update;
end;