\setshell text_value ./generate_random_string.sh 3072

begin;
    insert into :table_name (text_column, date_column) values (:text_value, '2020-01-01');
end;