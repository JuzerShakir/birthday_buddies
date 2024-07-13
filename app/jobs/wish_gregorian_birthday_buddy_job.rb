class WishGregorianBirthdayBuddyJob < ApplicationJob
  self.queue_adapter = :solid_queue
  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args

    # * send emails on correct birthday / prevents users from getting reminders at wrong dates
    Time.zone = user.time_zone
    return if Time.zone.now.midnight  != birthday_buddy.upcoming_gregorian_birthday_at_preferred_zone

    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_gregorian_birthday_email.deliver_now
    update_upcoming_gregorian_birthday(birthday_buddy)
  end

  private

  def update_upcoming_gregorian_birthday(person)
    # updates `upcoming_gregorian_birthday` & enqueues new job to send next birthday reminder
    person.update(upcoming_gregorian_birthday: person.upcoming_gregorian_birthday + 1.year)
  end
end
