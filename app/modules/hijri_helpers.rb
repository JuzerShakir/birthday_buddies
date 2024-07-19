module HijriHelpers
  def hijri_date_of(date)
    date.tomorrow.to_hijri
  end

  def gregorian_date_of(date)
    date.to_greo.yesterday
  end

  # current hijri year
  def current_hijri_year
    hijri_date_of(Date.today).year
  end

  # create new hijri date
  def new_hijri_date(y: current_hijri_year, date:)
    Hijri::Date.new(y, date.month, date.day)
  end

  def create_future_hijri_birthdate(date)
    # create new hijri date with current year
    hijri_birthday_this_year = new_hijri_date(date:)

    # since we cannot check if current hijri date is in future or past we need to convert it to gregorian date
    greg_date = gregorian_date_of(hijri_birthday_this_year)

    # check if gregorian date of hijri date is in past, if it is then set it in the future
    if greg_date.future?
      hijri_birthday_this_year
    else
      new_hijri_date(y: current_hijri_year + 1, date:)
    end
  end
end