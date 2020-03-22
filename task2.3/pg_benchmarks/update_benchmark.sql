begin;
    update :table_name
    set text_column = concat(text_column, text_column)
    where true;
end;