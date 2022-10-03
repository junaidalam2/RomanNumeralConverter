# roman numeral converter up to 3000


def case_1_3(roman_numerals, compare_digit, number_str_length, roman_output_arr)
    
    determined_key = 10 ** (number_str_length - 1)
    roman_digit = roman_numerals[determined_key]  
    
    k = compare_digit
    while k > 0
        roman_output_arr.append(roman_digit)
        k -= 1
    end

    return roman_output_arr

end


def case_4_and_9(roman_numerals, compare_digit, number_str_length, roman_output_arr)

    gross_up = 0.9
    if compare_digit == 4
        gross_up = 0.8
    end
    
    key_second_digit = (compare_digit * 10 ** (number_str_length - 1) / gross_up).to_i
    second_roman_digit = roman_numerals[key_second_digit]

    key_denominator = 10
    if compare_digit == 4
        key_denominator = 5
    end
    
    key_first_digit = key_second_digit / key_denominator
    first_roman_digit = roman_numerals[key_first_digit]

    roman_output_arr.append(first_roman_digit)
    roman_output_arr.append(second_roman_digit)

    return roman_output_arr

end


def case_5_8(roman_numerals, compare_digit, number_str_length, roman_output_arr)

    key_first_digit = 5 * 10 ** (number_str_length - 1)
    first_roman_digit = roman_numerals[key_first_digit]
    roman_output_arr.append(first_roman_digit)

    if compare_digit > 5
        key_next_digit = 6 * 10 ** (number_str_length - 1) - key_first_digit
        next_roman_digit = roman_numerals[key_next_digit]
        k = compare_digit - 5
        while k > 0
            roman_output_arr.append(next_roman_digit)
            k -= 1
        end
    end

    return roman_output_arr

end


def roman_numerals_converter(number)

    roman_numerals = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 1 => "I", 5 => "V"}
    roman_output_arr = []
    number_str = number.to_s

    
    i = 0
    while number_str[i]

        compare_digit = number_str[i].to_i 
        number_str_length = number_str.length - i

        case compare_digit
        when 1..3
            roman_output_arr = case_1_3(roman_numerals, compare_digit, number_str_length, roman_output_arr)
        when 5..8
            roman_output_arr = case_5_8(roman_numerals, compare_digit, number_str_length, roman_output_arr)
        when 4, 9
            roman_output_arr = case_4_and_9(roman_numerals, compare_digit, number_str_length, roman_output_arr)
        end

        i += 1
    end

    roman_output_string = roman_output_arr * "" 

    puts roman_output_string

end

roman_numerals_converter(1991)
roman_numerals_converter(14)
roman_numerals_converter(2567)
roman_numerals_converter(1549)

