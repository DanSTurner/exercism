class PhoneNumber
def initialize(input_number)
  @input_number = input_number
end

# refactor using method names to array, call each from the array on the var
def number
  result = @input_number
  normalize = [method(:to_all_digits), method(:remove_us_country_code), method(:zeros_if_not_10_digits)]
  normalize.each { |method| result = method.call(result) }
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