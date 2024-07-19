class WishHappyHijriBirthdayJob < ApplicationJob
  include HijriHelpers
  queue_as :default

  def perform(*args)
    # * send emails on correct birthday / prevents users from getting reminders at wrong dates
    return if is_birthday_not_today?(birthdate: @birthday_buddy.upcoming_hijri_birthday_in_gregorian)

    HappyBirthdayMailer.with(user: @user, birthday_buddy: @birthday_buddy).wish_happy_hijri_birthday_email.deliver_now

    # updates `upcoming_hijri_birthday_in_gregorian` & enqueues new job to send next hijri birthday reminder
    update_upcoming_hijri_birthday_in_gregorian
  end

  private

  def update_upcoming_hijri_birthday_in_gregorian
    hijri_date = create_future_hijri_birthdate(@birthday_buddy.hijri_birthday)
    on_date = gregorian_date_of(hijri_date)

    @birthday_buddy.update(upcoming_hijri_birthday_in_gregorian: on_date)
  end
end
