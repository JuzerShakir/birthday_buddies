class WishBirthdayBuddyJob < ApplicationJob
  self.queue_adapter = :solid_queue
  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args
    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_birthday_email
  end
end
