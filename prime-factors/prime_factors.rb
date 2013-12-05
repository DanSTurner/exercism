require 'mathn'

class PrimeFactors
  # def self.for(num)
  #   @set = Array.new
  #   temp = num
  #   (2..num).each do |factor|
  #     if num / factor == num.to_f / factor
  #       @set.push(factor/temp)
  #       temp = num / factor
  #     end
  #   end
  #   return @set
  # end

  def self.for(num)
    @num = num
    @set = Array.new
    (2..@num).each { |candidate| self.recurse(candidate) }
    return @set
  end

  def self.recurse(candidate)
    if self.eligible?(candidate)
      @num = @num / candidate
      @set.push(candidate)
      self.recurse(candidate)
    end
  end

  def self.eligible?(candidate)
    candidate <= @num && @num % candidate == 0 && is_prime?(candidate)
  end

  def self.is_prime?(candidate)
    Prime.prime?(candidate)
  end

end