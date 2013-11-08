class PhoneNumber
def initialize(input_number)
  @input_number = input_number
end

def number
  @input_number.scan(/\d/).join('')
end


end