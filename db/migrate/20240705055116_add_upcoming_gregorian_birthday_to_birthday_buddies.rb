class AddUpcomingGregorianBirthdayToBirthdayBuddies < ActiveRecord::Migration[7.1]
  def change
      add_column :birthday_buddies, :upcoming_gregorian_birthday, :date, null: false
  end
end
