class Year
def initialize(year)
  @year = year
end

def leap?
  every_4_test(@year) && ! ( every_100_test(@year) && ! every_400_test(@year) )
end

def every_4_test(year)
  year % 4 == 0
end

def every_100_test(year)
  year % 100 == 0
end

def every_400_test(year)
  year % 400 == 0
end

end