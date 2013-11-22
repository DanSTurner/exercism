class Grains
  def square(number)
    2**(number-1)
  end

  def total
    (1..64).inject { |total, num| total += self.square(num) }
    # also 2**(64)-1, or 18446744073709551615
  end

end