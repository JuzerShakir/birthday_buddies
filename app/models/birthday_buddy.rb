# == Schema Information
#
# Table name: birthday_buddies
#
#  id                 :integer          not null, primary key
#  first_name         :string           default(""), not null
#  gregorian_birthday :date             not null
#  last_name          :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer          not null
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
  belongs_to :user
end
