module HijriHelpers
  def hijri_date_of(date)
    date.tomorrow.to_hijri
  end

  def gregorian_date_of(date)
    date.to_greo.yesterday
  end
end