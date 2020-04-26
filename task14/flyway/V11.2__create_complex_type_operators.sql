set search_path to task_14;

-- add operator

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

create operator +(
    leftarg = complex_number,
    rightarg = complex_number,
    function = add_complex_numbers);

-- subtract operator

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

create operator -(
    leftarg = complex_number,
    rightarg = complex_number,
    function = subtract_complex_numbers);

-- multiply operator

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

create operator *(
    leftarg = complex_number,
    rightarg = complex_number,
    function = multiply_complex_numbers);

-- divide operator

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

create operator /(
    leftarg = complex_number,
    rightarg = complex_number,
    function = divide_complex_numbers);