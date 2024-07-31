module TimeHelper
  def readable_date(date)
    date.strftime("%B %d, %Y")
  end

  def time_zones
    ActiveSupport::TimeZone::MAPPING.values.uniq.sort
  end

  def distance_of_gregorian_birthday_in_words(birthday_buddy)
    calculate_birthday_distance(
      birthday_buddy: ,
      upcoming_birthday: birthday_buddy.upcoming_gregorian_birthday
    )
  end

  def distance_of_hijri_birthday_in_words(birthday_buddy)
    calculate_birthday_distance(
      birthday_buddy: ,
      upcoming_birthday: birthday_buddy.upcoming_hijri_birthday_in_gregorian
    )
  end

  private

  def calculate_birthday_distance(birthday_buddy:, upcoming_birthday:)
    Time.zone = birthday_buddy.user.time_zone
    from_time = Time.zone.now
    to_time = upcoming_birthday.in_time_zone(Time.zone)
    distance_of_time_in_words(from_time, to_time)
  end
end