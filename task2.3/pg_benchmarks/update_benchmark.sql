\set id_to_update random(1, 10000)

begin;
    update :table_name
    set text_column = concat(text_column, text_column)
    where
        id = :id_to_update
        and length(text_colum) = 50;
end;