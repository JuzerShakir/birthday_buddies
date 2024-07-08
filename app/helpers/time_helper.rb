module TimeHelper
  def readable_date(date)
    date.strftime("%B %d, %Y")
  end

  def time_zones
    ActiveSupport::TimeZone::MAPPING.values.uniq.sort
  end
end