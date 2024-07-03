class BirthdayBuddiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @birthday_buddies = current_user.birthday_buddies
    @birthday_buddy = current_user.birthday_buddies.new
  end

  def create
    @birthday_buddy = current_user.birthday_buddies.new(birthday_buddy_params)
    p birthday_buddy_params

    if @birthday_buddy.save
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def birthday_buddy_params
    params.require(:birthday_buddy).permit(:first_name, :last_name, :gregorian_birthday)
  end
end
