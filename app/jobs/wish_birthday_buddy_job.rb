class WishBirthdayBuddyJob < ApplicationJob
  self.queue_adapter = :solid_queue
  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args
    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_birthday_email.deliver_now
    update_upcoming_gregorian_birthday(birthday_buddy)
  end

  private

  def update_upcoming_gregorian_birthday(person)
    person.update(upcoming_gregorian_birthday: person.upcoming_gregorian_birthday + 1.year)
  end
end
