class BirthdayBuddiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @birthday_buddies = current_user.birthday_buddies
    @birthday_buddy = current_user.birthday_buddies.new
  end

  def create
    @birthday_buddy = current_user.birthday_buddies.new(birthday_buddy_params)
    p birthday_buddy_params

    respond_to do |format|
      if @birthday_buddy.save
        format.html { redirect_to birthday_buddies_path, notice: "Birthdate created" }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private
  def birthday_buddy_params
    params.require(:birthday_buddy).permit(:first_name, :last_name, :gregorian_birthday)
  end
end
