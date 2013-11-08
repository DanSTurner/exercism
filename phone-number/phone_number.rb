class PhoneNumber
def initialize(input_number)
  @input_number = input_number
end

# refactor using method names to array, call each from the array on the var
def number
  result = zeros_if_not_10_digits(
    remove_us_country_code(
      to_all_digits(
        @input_number
      )
    )
  )
  return result
end

def to_all_digits(number)
  number.scan(/\d/).join('')
end

def remove_us_country_code(number)
  if number.length == 11 && number.scan(/./)[0] == "1"
    number = number.scan(/./)[1..-1].join
  end
  return number
end

def zeros_if_not_10_digits(number)
  number = "0000000000" if number.length != 10
  return number
end

end