class Users::ConfirmationsController < Devise::ConfirmationsController
  private
  # after confirming email address
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # sign in the user
    birthday_buddies_path
  end
end