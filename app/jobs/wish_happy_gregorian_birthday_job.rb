class WishHappyGregorianBirthdayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user, birthday_buddy =  args

    return if is_birthday_not_today?(
      time_zone: user.time_zone ,
      birthdate: birthday_buddy.upcoming_gregorian_birthday_at_preferred_zone
      )

    HappyBirthdayMailer.with(user: , birthday_buddy: ).wish_happy_gregorian_birthday_email.deliver_now
    update_upcoming_gregorian_birthday(birthday_buddy)
  end

  private

  def update_upcoming_gregorian_birthday(person)
    # updates `upcoming_gregorian_birthday` & enqueues new job to send next birthday reminder
    person.update(upcoming_gregorian_birthday: person.upcoming_gregorian_birthday + 1.year)
  end
end
