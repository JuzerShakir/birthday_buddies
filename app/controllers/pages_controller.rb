class PagesController < ApplicationController
  before_action :redirect_if_logged_in

  def home;end

  private

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to birthday_buddies_path, alert: "You need to sign out before continuing."
    end
  end
end