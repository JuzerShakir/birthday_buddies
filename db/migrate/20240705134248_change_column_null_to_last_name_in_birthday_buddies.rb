class ChangeColumnNullToLastNameInBirthdayBuddies < ActiveRecord::Migration[7.1]
  def change
    change_column_null :birthday_buddies, :last_name, true
  end
end
