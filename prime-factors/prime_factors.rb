class PrimeFactors
  def self.for(num)
    @num = num
    @set = Array.new
    (2..@num).find do |candidate|
      self.recurse(candidate) if self.is_eligible?(candidate)
    end
    return @set
  end

  def self.recurse(candidate)

    if self.is_eligible?(candidate)
      @num = @num / candidate
      @set.push(candidate)
      self.recurse(candidate)
    end
  end

  def self.is_eligible?(candidate)
    candidate <= @num && is_factor?(candidate)
  end

  def self.is_factor?(candidate)
    @num % candidate == 0
  end
end