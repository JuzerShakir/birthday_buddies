class WishHappyGregorianBirthdayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # * send emails on correct birthday / prevents users from getting reminders at wrong dates
    return if is_birthday_not_today?(birthdate: @birthday_buddy.upcoming_gregorian_birthday_at_preferred_zone)

    HappyBirthdayMailer.with(user: @user, birthday_buddy: @birthday_buddy).wish_happy_gregorian_birthday_email.deliver_now

    # updates `upcoming_gregorian_birthday` & enqueues new job to send next birthday reminder
    update_upcoming_gregorian_birthday
  end

  private

  def update_upcoming_gregorian_birthday
    @birthday_buddy.update(upcoming_gregorian_birthday: @birthday_buddy.upcoming_gregorian_birthday.next_year)
  end
end
