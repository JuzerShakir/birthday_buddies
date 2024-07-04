class ApplicationController < ActionController::Base
  private
  def after_sign_in_path_for(resource)
    birthday_buddies_path
  end
end
