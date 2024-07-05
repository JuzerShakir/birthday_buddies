# == Schema Information
#
# Table name: birthday_buddies
#
#  id                          :integer          not null, primary key
#  first_name                  :string           default(""), not null
#  gregorian_birthday          :date             not null
#  last_name                   :string           default(""), not null
#  upcoming_gregorian_birthday :date             not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  user_id                     :integer          not null
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
  validates_presence_of :first_name, :last_name, :gregorian_birthday
  validate :gregorian_birthday_cannot_be_in_future, if: :will_save_change_to_gregorian_birthday?
  # * Callbacks
  before_save :set_upcoming_gregorian_birthday, if: :will_save_change_to_gregorian_birthday?

  def hijri_birthday
    gregorian_birthday.tomorrow.to_hijri
  end

  private
  # callbacks
  def set_upcoming_gregorian_birthday
    birthday = calculate_birthday_for_current_year(gregorian_birthday)
    self.upcoming_gregorian_birthday = get_upcoming_birthday(birthday)
  end

  # Custom helper methods
  def calculate_birthday_for_current_year(date)
    gregorian_birthday.change(year: Date.today.year)
  end

  def get_upcoming_birthday(date)
    date.future? ? date : date.next_year
  end

  # * Custom Validation Methods
  def gregorian_birthday_cannot_be_in_future
    errors.add(:gregorian_birthday, "cannot be in future") if gregorian_birthday.future?
  end
end
