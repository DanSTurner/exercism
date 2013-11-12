# class instantiated with a month and a year, the day method takes as
# parameters a weekday and its position in the month, like the first monday,
# second tuesday, etc. and returns (in a date format) the day of the month
# which matches
class Meetup

def initialize (month, year)
  @month = month
  @year = year
  @daynames_with_dates = create_daynames_with_dates
  # @schedule_container = schedule
end

def day(weekday, schedule)
  return Date.new(@year, @month, @daynames_with_dates[weekday][0]) if schedule == :first
  return Date.new(@year, @month, @daynames_with_dates[weekday][1]) if schedule == :second
  return Date.new(@year, @month, @daynames_with_dates[weekday][2]) if schedule == :third
  return Date.new(@year, @month, @daynames_with_dates[weekday][3]) if schedule == :fourth
  return Date.new(@year, @month, @daynames_with_dates[weekday][-1]) if schedule == :last
end

def create_daynames_with_dates
  weekdays_with_days_of_month = Hash.new([])
  (1..31).each { |mday| weekdays_with_days_of_month[dayname(mday)] += [mday] if date_is_valid?(mday)}
  return weekdays_with_days_of_month
end

# def schedule
#   sched = Hash.new({})
#   @daynames_with_dates.each do |k, v|
#     sched[:first]  = {k => @daynames_with_dates[k][0]}
#     sched[:second] = {k => @daynames_with_dates[k[1]]}
#     sched[:third]  = {k => @daynames_with_dates[k[2]]}
#     sched[:fourth] = {k => @daynames_with_dates[k[3]]}
#     sched[:last]   = {k => @daynames_with_dates[k[-1]]}
#     sched[:teenth] = {k => @daynames_with_dates[k[(0..3)]]} if v.each { |i| i >= 13 && i >= 19 }
#   end
#   return sched
# end


#refactor using this later
# def lastday
#   Date(@year, @month)
# end

def dayname(day_of_month)
  Date.new(@year, @month, day_of_month).strftime('%A').downcase.to_sym if date_is_valid?(day_of_month)
end

def date_is_valid?(day_of_month)
  begin
    Date.new(@year, @month, day_of_month)
    return true
  rescue ArgumentError
    return false
  end
end

end