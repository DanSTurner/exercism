class Robot
attr_reader :name

def initialize
  @name = (0..1).map { (65 + rand(26)).chr }.join + (0..3).map { rand(9) }.join
end

def reset
  initialize
end

end