module ApplicationHelper
  def readable_date(date)
    date.strftime("%B %d, %Y")
  end
end
