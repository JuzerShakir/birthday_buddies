class CreateBirthdayBuddies < ActiveRecord::Migration[7.1]
  def change
    create_table :birthday_buddies do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.date :gregorian_birthday, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
