class WishBirthdayBuddyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args
    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_birthday_email.deliver_later
  end
end
