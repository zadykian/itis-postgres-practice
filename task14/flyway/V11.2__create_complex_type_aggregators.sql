set search_path to task_14;

-- sum aggregator

create function add_complex_numbers(left_number complex_number, right_number complex_number)
    returns complex_number
    language plpgsql as
$func$
    declare
        result_real_part real;
        result_imaginary_part real;
    begin
        if (left_number is null)
        then
            return right_number;
        end if;

        if (right_number is null)
        then
            return left_number;
        end if;

        result_real_part := left_number.real_part + right_number.real_part;
        result_imaginary_part := left_number.imaginary_part + right_number.imaginary_part;
        return row(result_real_part, result_imaginary_part)::complex_number;
    end
$func$;

create aggregate sum(complex_number)
(
    initcond = '(0, 0)',
    stype = complex_number,
    sfunc = add_complex_numbers
);

-- subtraction aggregator

create function subtract_complex_numbers(left_number complex_number, right_number complex_number)
    returns complex_number
    language plpgsql as
$func$
    declare
        result_real_part real;
        result_imaginary_part real;
    begin
        if (left_number is null)
        then
            return right_number;
        end if;

        if (right_number is null)
        then
            return left_number;
        end if;

        result_real_part := left_number.real_part - right_number.real_part;
        result_imaginary_part := left_number.imaginary_part - right_number.imaginary_part;
        return row(result_real_part, result_imaginary_part)::complex_number;
    end
$func$;

create aggregate subtraction(complex_number)
(
    initcond = '(0, 0)',
    stype = complex_number,
    sfunc = subtract_complex_numbers
);

-- product aggregator

create function multiply_complex_numbers(left_number complex_number, right_number complex_number)
    returns complex_number
    language plpgsql as
$func$
    declare
        result_real_part real;
        result_imaginary_part real;
    begin
        if (left_number is null)
        then
            return right_number;
        end if;

        if (right_number is null)
        then
            return left_number;
        end if;

        result_real_part :=
            left_number.real_part * right_number.real_part
            - left_number.imaginary_part * right_number.imaginary_part;

        result_imaginary_part :=
            left_number.imaginary_part * right_number.real_part
            + left_number.real_part * right_number.imaginary_part;

        return row(result_real_part, result_imaginary_part)::complex_number;
    end
$func$;

create aggregate product(complex_number)
(
    initcond = '(1, 1)',
    stype = complex_number,
    sfunc = multiply_complex_numbers
);

-- division aggregator

create function divide_complex_numbers(left_number complex_number, right_number complex_number)
    returns complex_number
    language plpgsql as
$func$
    declare
        result_real_part real;
        result_imaginary_part real;
    begin
        if (left_number is null)
        then
            return right_number;
        end if;

        if (right_number is null)
        then
            return left_number;
        end if;

        result_real_part :=
            (left_number.real_part * right_number.real_part
            + left_number.imaginary_part * right_number.imaginary_part)
            / (right_number.real_part ^ 2 + right_number.imaginary_part ^ 2);

        result_imaginary_part :=
            (left_number.imaginary_part * right_number.real_part
            - left_number.real_part * right_number.imaginary_part)
            / (right_number.real_part ^ 2 + right_number.imaginary_part ^ 2);

        return row(result_real_part, result_imaginary_part)::complex_number;
    end
$func$;

create aggregate division(complex_number)
(
    initcond = '(1, 1)',
    stype = complex_number,
    sfunc = divide_complex_numbers
);