class WishHappyHijriBirthdayJob < ApplicationJob
  include HijriHelpers

  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args

    # * send emails on correct birthday / prevents users from getting reminders at wrong dates
    Time.zone = user.time_zone
    return if Time.zone.now.midnight != birthday_buddy.upcoming_hijri_birthday_at_preferred_zone

    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_hijri_birthday_email.deliver_now
    update_upcoming_hijri_birthday_in_gregorian(birthday_buddy)
  end

  private

  def update_upcoming_hijri_birthday_in_gregorian(person)
    h = hijri_date_of(person.upcoming_hijri_birthday_in_gregorian)
    upcoming_hijri_birthday = Hijri::Date.new(h.year + 1, h.month, h.day)
    on_date = gregorian_date_of(upcoming_hijri_birthday)

    # updates `upcoming_hijri_birthday_in_gregorian` & enqueues new job to send next hijri birthday reminder
    person.update(upcoming_hijri_birthday_in_gregorian: on_date)
  end
end
