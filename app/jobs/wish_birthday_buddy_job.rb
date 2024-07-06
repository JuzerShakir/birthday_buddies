class WishBirthdayBuddyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    HappyBirthdayMailer.with(user: User.first, birthday_buddy: User.first.birthday_buddies.first).wish_happy_birthday_email.deliver_now
  end
end
