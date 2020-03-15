\set text_value md5(random()::text)
\set date_value now()

begin;
    insert into :table_name (text_value, date_column) values (:text_value, :date_value);
end;