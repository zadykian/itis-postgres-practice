begin;
    set search_path to task_18;
    set geqo to :use_geqo;
    set geqo_threshold to 4;

    select *
    from 
        geqo_table_0
        inner join geqo_table_1 using (id)
        inner join geqo_table_2 using (id)
        inner join geqo_table_3 using (id)
        inner join geqo_table_4 using (id)
        inner join geqo_table_5 using (id)
        inner join geqo_table_6 using (id)
        inner join geqo_table_7 using (id);
end;