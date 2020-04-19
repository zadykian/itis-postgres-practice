begin;
    prepare insert_into_table(int, varchar(128)) as
    insert into task_11.prepared_table (id, name) values ($1, $2);

    execute insert_into_table(0, 'some_name');
    execute insert_into_table(1, 'some_name');
    execute insert_into_table(2, 'some_name');
    execute insert_into_table(3, 'some_name');
    execute insert_into_table(4, 'some_name');
    execute insert_into_table(5, 'some_name');
    execute insert_into_table(6, 'some_name');
    execute insert_into_table(7, 'some_name');
    execute insert_into_table(8, 'some_name');
    execute insert_into_table(9, 'some_name');

    execute insert_into_table(10, 'some_name');
    execute insert_into_table(11, 'some_name');
    execute insert_into_table(12, 'some_name');
    execute insert_into_table(13, 'some_name');
    execute insert_into_table(14, 'some_name');
    execute insert_into_table(15, 'some_name');
    execute insert_into_table(16, 'some_name');
    execute insert_into_table(17, 'some_name');
    execute insert_into_table(18, 'some_name');
    execute insert_into_table(19, 'some_name');

    execute insert_into_table(20, 'some_name');
    execute insert_into_table(21, 'some_name');
    execute insert_into_table(22, 'some_name');
    execute insert_into_table(23, 'some_name');
    execute insert_into_table(24, 'some_name');
    execute insert_into_table(25, 'some_name');
    execute insert_into_table(26, 'some_name');
    execute insert_into_table(27, 'some_name');
    execute insert_into_table(28, 'some_name');
    execute insert_into_table(29, 'some_name');

    execute insert_into_table(30, 'some_name');
    execute insert_into_table(31, 'some_name');
    execute insert_into_table(32, 'some_name');
    execute insert_into_table(33, 'some_name');
    execute insert_into_table(34, 'some_name');
    execute insert_into_table(35, 'some_name');
    execute insert_into_table(36, 'some_name');
    execute insert_into_table(37, 'some_name');
    execute insert_into_table(38, 'some_name');
    execute insert_into_table(39, 'some_name');

    execute insert_into_table(40, 'some_name');
    execute insert_into_table(41, 'some_name');
    execute insert_into_table(42, 'some_name');
    execute insert_into_table(43, 'some_name');
    execute insert_into_table(44, 'some_name');
    execute insert_into_table(45, 'some_name');
    execute insert_into_table(46, 'some_name');
    execute insert_into_table(47, 'some_name');
    execute insert_into_table(48, 'some_name');
    execute insert_into_table(49, 'some_name');

    execute insert_into_table(50, 'some_name');
    execute insert_into_table(51, 'some_name');
    execute insert_into_table(52, 'some_name');
    execute insert_into_table(53, 'some_name');
    execute insert_into_table(54, 'some_name');
    execute insert_into_table(55, 'some_name');
    execute insert_into_table(56, 'some_name');
    execute insert_into_table(57, 'some_name');
    execute insert_into_table(58, 'some_name');
    execute insert_into_table(59, 'some_name');

    execute insert_into_table(60, 'some_name');
    execute insert_into_table(61, 'some_name');
    execute insert_into_table(62, 'some_name');
    execute insert_into_table(63, 'some_name');
    execute insert_into_table(64, 'some_name');
    execute insert_into_table(65, 'some_name');
    execute insert_into_table(66, 'some_name');
    execute insert_into_table(67, 'some_name');
    execute insert_into_table(68, 'some_name');
    execute insert_into_table(69, 'some_name');

    execute insert_into_table(70, 'some_name');
    execute insert_into_table(71, 'some_name');
    execute insert_into_table(72, 'some_name');
    execute insert_into_table(73, 'some_name');
    execute insert_into_table(74, 'some_name');
    execute insert_into_table(75, 'some_name');
    execute insert_into_table(76, 'some_name');
    execute insert_into_table(77, 'some_name');
    execute insert_into_table(78, 'some_name');
    execute insert_into_table(79, 'some_name');

    execute insert_into_table(80, 'some_name');
    execute insert_into_table(81, 'some_name');
    execute insert_into_table(82, 'some_name');
    execute insert_into_table(83, 'some_name');
    execute insert_into_table(84, 'some_name');
    execute insert_into_table(85, 'some_name');
    execute insert_into_table(86, 'some_name');
    execute insert_into_table(87, 'some_name');
    execute insert_into_table(88, 'some_name');
    execute insert_into_table(89, 'some_name');

    execute insert_into_table(90, 'some_name');
    execute insert_into_table(91, 'some_name');
    execute insert_into_table(92, 'some_name');
    execute insert_into_table(93, 'some_name');
    execute insert_into_table(94, 'some_name');
    execute insert_into_table(95, 'some_name');
    execute insert_into_table(96, 'some_name');
    execute insert_into_table(97, 'some_name');
    execute insert_into_table(98, 'some_name');
    execute insert_into_table(99, 'some_name');

    deallocate insert_into_table;
end;