class AddHijriBirthdayToBirthdayBuddies < ActiveRecord::Migration[7.1]
  def change
    add_column :birthday_buddies, :upcoming_hijri_birthday_in_gregorian, :date, null: false
  end
end
