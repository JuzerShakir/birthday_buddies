class BirthdayBuddiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @birthday_buddies = current_user.birthday_buddies.order(:upcoming_gregorian_birthday)
    @birthday_buddy = BirthdayBuddy.new
  end

  def create
    @birthday_buddy = current_user.birthday_buddies.new(birthday_buddy_params)

    respond_to do |format|
      if @birthday_buddy.save
        format.html { redirect_to birthday_buddies_path, notice: "Birthdate created" }
      else
        @birthday_buddies = current_user.birthday_buddies.order(:upcoming_gregorian_birthday)
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @birthday_buddy = BirthdayBuddy.find(params[:id])
  end

  def update
    @birthday_buddy = BirthdayBuddy.find(params[:id])

    respond_to do |format|
      if @birthday_buddy.update(birthday_buddy_params)
        format.html { redirect_to birthday_buddies_path, notice: "Details Updated!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @birthday_buddy = BirthdayBuddy.find(params[:id])
    @birthday_buddy.destroy
    redirect_to birthday_buddies_path, notice: "Birthday Buddy Deleted!"
  end

  private
  def birthday_buddy_params
    params.require(:birthday_buddy).permit(:name, :gregorian_birthday)
  end
end
