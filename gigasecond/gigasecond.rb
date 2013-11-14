require 'date'
require 'time'
class Gigasecond
  attr_accessor :date

  def initialize(date)
    @date_in_seconds = date.strftime('%s').to_i
  end

  def date
    @date_in_seconds += 1000000000
    Time.at(@date_in_seconds).utc.to_date
  end
end