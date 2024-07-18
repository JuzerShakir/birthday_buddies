# == Schema Information
#
# Table name: birthday_buddies
#
#  id                                   :integer          not null, primary key
#  first_name                           :string           default(""), not null
#  gregorian_birthday                   :date             not null
#  last_name                            :string           default("")
#  upcoming_gregorian_birthday          :date             not null
#  upcoming_hijri_birthday_in_gregorian :date             not null
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  user_id                              :integer          not null
#
# Indexes
#
#  index_birthday_buddies_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class BirthdayBuddy < ApplicationRecord
  # * Associations
  belongs_to :user, touch: true

  #  * name_of_person
  has_person_name

  # * Validations
  validates_presence_of :first_name, :gregorian_birthday
  validate :gregorian_birthday_cannot_be_in_future, if: :will_save_change_to_gregorian_birthday?

  # * Callbacks
  before_save :set_upcoming_gregorian_birthday, if: :will_save_change_to_gregorian_birthday?
  before_save :set_upcoming_hijri_birthday_in_gregorian, if: :will_save_change_to_gregorian_birthday?
  # birthday reminders
  after_save :set_happy_gregorian_birthday_reminder_email, if: :saved_change_to_upcoming_gregorian_birthday?
  after_save :set_happy_hijri_birthday_reminder_email, if: :saved_change_to_upcoming_hijri_birthday_in_gregorian?

  # * Helper Methods
  include HijriHelpers

  def hijri_birthday
    hijri_date_of(gregorian_birthday)
  end

  def upcoming_hijri_birthday
    # current hijri year
    current_hijri_year =  hijri_date_of(Date.today).year
    # create new hijri date with current year
    hijri_birthday_this_year = new_hijri_birthdate(year: current_hijri_year)
    # since we cannot check if current hijri date is in future or past we need to convert it to gregorian date
    date = gregorian_date_of(hijri_birthday_this_year)

    # check if gregorian date of hijri date is in past, if it is then set it in the future
    if date.future?
      hijri_birthday_this_year
    else
      new_hijri_birthdate(year: current_hijri_year + 1)
    end
  end

  def upcoming_gregorian_birthday_at_preferred_zone
    at_preferred_zone = user.time_zone
    upcoming_gregorian_birthday.in_time_zone(at_preferred_zone).midnight
  end

  def upcoming_hijri_birthday_at_preferred_zone
    at_preferred_zone = user.time_zone
    upcoming_hijri_birthday_in_gregorian.in_time_zone(at_preferred_zone).midnight
  end

  private

  # callbacks
  def set_upcoming_gregorian_birthday
    birthday = gregorian_birthday.change(year: Date.today.year)
    self.upcoming_gregorian_birthday =  birthday.future? ? birthday : birthday.next_year
  end

  def set_upcoming_hijri_birthday_in_gregorian
    self.upcoming_hijri_birthday_in_gregorian = gregorian_date_of(upcoming_hijri_birthday)
  end

  def set_happy_gregorian_birthday_reminder_email
    their_birthday_day = upcoming_gregorian_birthday_at_preferred_zone
    # send birthday notification email to user on midnight of their time zone
    WishHappyGregorianBirthdayJob.set(wait_until: their_birthday_day).perform_later(self.user, self)
  end

  def set_happy_hijri_birthday_reminder_email
    their_birthday_day = upcoming_hijri_birthday_at_preferred_zone
    # send birthday notification email to user on midnight of their time zone
    WishHappyHijriBirthdayJob.set(wait_until: their_birthday_day).perform_later(self.user, self)
  end

  # Custom helper methods
  def new_hijri_birthdate(year:)
    Hijri::Date.new(year, hijri_birthday.month, hijri_birthday.day)
  end

  # * Custom Validation Methods
  def gregorian_birthday_cannot_be_in_future
    errors.add(:gregorian_birthday, "cannot be in future") if gregorian_birthday.future?
  end
end
