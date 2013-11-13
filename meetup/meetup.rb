class Meetup

  def initialize (month, year)
    @month = month
    @year = year
    @daynames_with_dates = create_daynames_with_dates
  end

  def day(weekday, schedule)
    return Date.new(@year, @month, @daynames_with_dates[weekday][0]) if schedule == :first
    return Date.new(@year, @month, @daynames_with_dates[weekday][1]) if schedule == :second
    return Date.new(@year, @month, @daynames_with_dates[weekday][2]) if schedule == :third
    return Date.new(@year, @month, @daynames_with_dates[weekday][3]) if schedule == :fourth
    return Date.new(@year, @month, @daynames_with_dates[weekday][-1]) if schedule == :last
    return Date.new(@year, @month, teenth(weekday)) if schedule == :teenth
  end

  def teenth(weekday)
    teenthday = 0
    @daynames_with_dates[weekday].each do |array_value|
      teenthday = array_value if array_value >= 13 && array_value <= 19
    end
    return teenthday
  end

  def create_daynames_with_dates
    weekdays_with_days_of_month = Hash.new([])
    (1..31).each { |mday| weekdays_with_days_of_month[dayname(mday)] += [mday] if date_is_valid?(mday)}
    return weekdays_with_days_of_month
  end

  def dayname(day_of_month)
    Date.new(@year, @month, day_of_month).strftime('%A').downcase.to_sym if date_is_valid?(day_of_month)
  end

  # refactor
  # def lastday
  #   Date(@year, @month)
  # end

  def date_is_valid?(day_of_month)
    begin
      Date.new(@year, @month, day_of_month)
      return true
    rescue ArgumentError
      return false
    end
  end

end