\setshell id_to_update ./get_id_to_update.sh :table_name

begin;
    update :table_name
    set text_column = null
    where id = :id_to_update;
end;